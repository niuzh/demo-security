<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>
<a href="http://localhost:8080/cas/logout?service=http://localhost:8081/security">退出</a><br/>
<%@page import="org.springframework.security.cas.authentication.CasAuthenticationToken" %>

<%@page  import="org.springframework.security.core.userdetails.User" %>
<h3>当前页面:${view}</h3>
<%
    if(request.getUserPrincipal()==null){
        return;
    }
    User principal = (User)((CasAuthenticationToken) request.getUserPrincipal()).getPrincipal();
    String loginName = principal.getUsername();
    out.println("loginName:  "+loginName);
%>
</body>
</html>
