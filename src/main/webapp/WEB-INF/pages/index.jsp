<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>
<a href="http://localhost:8080/cas/logout?service=http://localhost:8081/security">退出</a><br/>

<h3>当前页面:${view}</h3>
<h3>当前用户:${user.username}</h3>
<h3>当前用户权限:${user.authorities}</h3>
</body>
</html>
