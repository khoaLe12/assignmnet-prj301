<%-- 
    Document   : shopping1
    Created on : Dec 7, 2022, 1:16:48 PM
    Author     : KHOA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Page</title>
    </head>
    <body>
        <h1>Let choose your favorite food</h1>
        <form action="MainController" method="POST">
            <select name="cmbFood">
                <option value="F001-Pho-100">Pho-100$</option>
                <option value="F002-Hu Tieu-40">Hu Tieu-40$</option>
                <option value="F003-Com Tam-90">Com Tam-90$</option>
                <option value="F004-Chao Long-10">Chao Long-10$</option>
            </select>
            <select name="cmbQuantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="10">10</option>
            </select>
            <input type="submit" name="action" value="Add"/>
            <input type="submit" name="action" value="View"/>
        </form>
        <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
        <%= message%>

    </body>
</html>
