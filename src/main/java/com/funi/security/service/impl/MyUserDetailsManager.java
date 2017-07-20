package com.funi.security.service.impl;

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
    //todo 配置数据库访问，从数据库读取用户信息
    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
        User user=new User("admin","admin",authorities(userName));
        if(user == null) {
            throw new UsernameNotFoundException(userName);
        } else {
            return new User(user.getUsername(), user.getPassword(), user.isEnabled(), user.isAccountNonExpired(),
                    user.isCredentialsNonExpired(), user.isAccountNonLocked(), user.getAuthorities());
        }
    }

    //查询用户权限
    private Collection<? extends GrantedAuthority> authorities(String userName){
        List<SimpleGrantedAuthority> list=new ArrayList<SimpleGrantedAuthority>();
        list.add(new SimpleGrantedAuthority("Index"));
        list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        return list;
    }
}
