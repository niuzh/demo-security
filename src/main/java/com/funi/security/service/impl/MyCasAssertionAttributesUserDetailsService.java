package com.funi.security.service.impl;

import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.springframework.security.cas.userdetails.AbstractCasAssertionUserDetailsService;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author zhihuan.niu on 7/21/17.
 */
public class MyCasAssertionAttributesUserDetailsService extends AbstractCasAssertionUserDetailsService {
    @Override
    protected UserDetails loadUserDetails(Assertion assertion) {
        List<GrantedAuthority> grantedAuthorities = new ArrayList();
        AttributePrincipal attributePrincipal=assertion.getPrincipal();
        Map<String,String> map=assertion.getPrincipal().getAttributes();
        for (Map.Entry<String,String> entry:map.entrySet()){
            if(entry.getKey().equals("authority")) {
                for (String str:entry.getValue().split(","))
                grantedAuthorities.add(new SimpleGrantedAuthority(str));
            }
        }
        return new User(attributePrincipal.getName(),"password",grantedAuthorities);
    }
}
