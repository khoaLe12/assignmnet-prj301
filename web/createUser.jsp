<%-- 
    Document   : createUser
    Created on : Dec 6, 2022, 1:10:06 PM
    Author     : KHOA
--%>

<%@page import="sample.user.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
    </head>
    <body>
        <h1>Input your information</h1>
        <%
            UserError userError = (UserError) request.getAttribute("ERROR_USER");
            if(userError==null){
                userError =  new UserError();
            }
        %>
        <form action="MainController" method="POST">
            User ID<input type="text" name="userID" required=""/></br>
            <%= userError.getUserID() %></br> 
            Full Name<input type="text" name="fullName" required=""/></br>
            <%= userError.getFullName() %></br> 
            Role ID<input type="text" name="roleID" value="USER" readonly=""/></br>
            Password<input type="password" name="password" required=""/></br>
            Confirm<input type="password" name="confirm" required=""/></br>
            <%= userError.getConfirm() %></br> 
            <input type = "submit" name ="action" value="Create"/>
            <input type = "reset" value ="Reset"/>
        </form>
    </body>
</html>
