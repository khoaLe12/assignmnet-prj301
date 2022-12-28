<%-- 
    Document   : ERROR
    Created on : Dec 1, 2022, 11:44:39 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String error = (String)request.getAttribute("ERROR");
            if(error == null){
                error = "";
            }
        %>
        <h1><%=error %></h1>
    </body>
</html>
