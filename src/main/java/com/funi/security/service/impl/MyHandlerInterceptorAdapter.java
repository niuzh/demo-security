package com.funi.security.service.impl;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.cas.authentication.CasAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.util.CollectionUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author zhihuan.niu on 7/21/17.
 */
public class MyHandlerInterceptorAdapter extends HandlerInterceptorAdapter {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getUserPrincipal()==null){
            throw new AccessDeniedException("Access is denied");
        }
        User principal = (User)((CasAuthenticationToken) request.getUserPrincipal()).getPrincipal();
        if(principal==null) {
            throw new AccessDeniedException("Access is denied");
        }
        HandlerMethod handlerMethod= (HandlerMethod)handler;
        Secured secured=handlerMethod.getMethod().getAnnotation(Secured.class);
        if(secured!=null){
            List<String> list= Arrays.asList(secured.value());
            for (GrantedAuthority authority: principal.getAuthorities()){
                if(list.contains(authority.getAuthority())){
                    return true;
                }
            }
        }else {
            return true;
        }
        throw new AccessDeniedException("Access is denied");
    }
}
