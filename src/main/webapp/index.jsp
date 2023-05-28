<%@ page import="java.security.Principal" %>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8" />
    <title>Welcome</title>
</head>
<body>
<%
    String username = request.getRemoteUser();
%>
<span>Hello <%= username==null ? "World" : username %>!</span>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<a href="private-servlet">Private Servlet</a>
<a href="Private.jsp">Private page</a>
<a href="logout">Logout</a>
</body>
</html>