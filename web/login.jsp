<%-- 
    Document   : login
    Created on : Dec 1, 2022, 11:48:16 AM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Hello Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action = "MainController" method = "POST">
            User ID<input type = "text" name ="userID" required=""/><br>
            Password<input type = "password" name ="password" required=""/><br>

            <div class="g-recaptcha" 
                 data-sitekey="6LccXXwjAAAAANAywKneClwPJndo12Jv-ddttHl4"></div>
            <%
                String recaptcha = (String) request.getAttribute("RECAPTCHA");
                if (recaptcha == null) {
                    recaptcha = "";
                }
            %>
            <h4><%=recaptcha%></h4>

            <input value="Login" name="action" hidden=""/>
            <input type="submit" value="Login"/>
            <input type = "reset" value ="Reset"/>
        </form>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <%
            String error = (String) request.getAttribute("ERROR");
            if (error == null) {
                error = "";
            }
        %>
        <h1><%=error%></h1>

    </body>
</html>
