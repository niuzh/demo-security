package com.funi.security.service.impl;

import com.funi.security.mbg.dao.AuthorityMapper;
import com.funi.security.mbg.dao.RoleAuthorityRelMapper;
import com.funi.security.mbg.dao.UserMapper;
import com.funi.security.mbg.dao.UserRoleRelMapper;
import com.funi.security.mbg.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * @author zhihuan.niu on 7/20/17.
 */
public class MyUserDetailsManager implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserRoleRelMapper userRoleRelMapper;
    @Autowired
    private RoleAuthorityRelMapper roleAuthorityRelMapper;
    @Autowired
    private AuthorityMapper authorityMapper;
    //配置数据库访问，从数据库读取用户信息
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user=null;
        UserExample userExample=new UserExample();
        userExample.createCriteria().andUserNameEqualTo(userName);
        List<com.funi.security.mbg.dto.User> userList=userMapper.selectByExample(userExample);
        if(userList.size()==1) {
            user = new User(userList.get(0).getUserName(),userList.get(0).getPassword(), authorities(userList.get(0)));
        }
        if(user == null) {
            throw new UsernameNotFoundException(userName);
        } else {
            return new User(user.getUsername(), user.getPassword(), user.isEnabled(), user.isAccountNonExpired(),
                    user.isCredentialsNonExpired(), user.isAccountNonLocked(), user.getAuthorities());
        }
    }

    //查询用户权限
    private Collection<? extends GrantedAuthority> authorities(com.funi.security.mbg.dto.User user){
        List<SimpleGrantedAuthority> list=new ArrayList<SimpleGrantedAuthority>();
        List<Authority> authorityList=new ArrayList<Authority>();
        if(user.getIsAdmin()){
            AuthorityExample authorityExample=new AuthorityExample();
            authorityExample.createCriteria().andIsDeletedEqualTo(false);
            authorityList=authorityMapper.selectByExample(authorityExample);
        }else {
            UserRoleRelExample userRoleRelExample=new UserRoleRelExample();
            userRoleRelExample.createCriteria().andUserIdEqualTo(user.getId());
            List<UserRoleRel> userRoleRelList=userRoleRelMapper.selectByExample(userRoleRelExample);
            for (UserRoleRel userRoleRel:userRoleRelList){
                RoleAuthorityRelExample roleAuthorityRelExample=new RoleAuthorityRelExample();
                roleAuthorityRelExample.createCriteria().andIsDeletedEqualTo(false)
                        .andRoleIdEqualTo(userRoleRel.getRoleId());
                List<RoleAuthorityRel> roleAuthorityRelList=roleAuthorityRelMapper.selectByExample(roleAuthorityRelExample);
                for (RoleAuthorityRel roleAuthorityRel:roleAuthorityRelList){
                    Authority authority=authorityMapper.selectByPrimaryKey(roleAuthorityRel.getAuthoriryId());
                    if(authority!=null){
                        authorityList.add(authority);
                    }
                }
            }
        }
        for (Authority authority:authorityList) {
            list.add(new SimpleGrantedAuthority(authority.getKeyValue()));
        }
        return list;
    }
}
