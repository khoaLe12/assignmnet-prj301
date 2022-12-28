<%-- 
    Document   : user
    Created on : Dec 1, 2022, 12:40:30 PM
    Author     : KHOA
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser==null || !"USER".equals(loginUser.getRoleID())){
                response.sendRedirect("login.jsp");
            }
        %>
        User ID<%= loginUser.getUserID()%>
        Full Name<%= loginUser.getFullName()%>
        Role ID<%=loginUser.getRoleID()%>
        Password<%=loginUser.getPassword()%>
                
    </body>
</html>
