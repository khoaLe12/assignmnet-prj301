<%-- 
    Document   : search
    Created on : Dec 1, 2022, 12:36:45 PM
    Author     : KHOA
--%>

<%@page import="java.util.List"%>
<%@page import="sample.food.FoodDTO"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"USER".equals(loginUser.getRoleID())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        Welcome:<%= loginUser.getFullName()%>

        <a href="MainController?action=Logout">Logout<a/>

            <form action="MainController">
                Search<input type="text" name="search" value = "<%= search%>"/>
                <input type ="submit" name="action" value="SearchProduct"/>
            </form>
            <%
                List<FoodDTO> listFood = (List<FoodDTO>) request.getAttribute("LIST_FOOD");
                if (listFood != null) {
                    if (listFood.size() > 0) {
            %>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Cooking Time</th>
                        <th>Quantity</th>
                        <th>Add</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        for (FoodDTO food : listFood) {
                    %>     
                <form action="MainController" method="POST">
                    <tr>
                        <td><%= count++%></td>
                        <td>
                            <input type ="text" name="id" value="<%=food.getId()%>" readonly=""/>
                        </td>
                        <td>
                            <input type ="text" name="name" value="<%=food.getName()%>" readonly=""/>
                        </td>
                        <td>
                            <%=food.getDescription()%>
                        </td>
                        <td>
                            <input type ="number" name="price" value="<%=food.getPrice()%>" readonly=""/>
                        </td>
                        <td>
                            <%=food.getCookingTime()%>
                        </td>
                        <td>
                            <select name ="quantity">
                                <option value ="1">1</option>
                                <option value ="2">2</option>
                                <option value ="3">3</option>
                                <option value ="4">4</option>
                                <option value ="5">5</option>
                                <option value ="10">10</option>
                        </td>
                        <td>
                            <input type ="submit" name="action" value="Add"/>
                            <input type="hidden" name="search" value="<%=search%>"/>
                        </td>
                    </tr>

                </form>
                <%
                    }
                %>
                </tbody>
            </table>
            <form action="MainController" method="POST">
                <input type="submit" name="action" value="View"/>
                <input type="hidden" name="search" value="<%=search%>"/>
            </form>

            <%
                String message = (String) request.getAttribute("MESSAGE");
                if (message == null) {
                    message = "";
                }
            %>
            <%= message%>

            <%
                    }
                }
            %>
    </body>
</html>
