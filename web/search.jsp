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
            UserDTO loginUser = (UserDTO)session.getAttribute("LOGIN_USER");
            if(loginUser==null || !"ADMIN".equals(loginUser.getRoleID())){
                response.sendRedirect("login.jsp");
                return;
            }
            String search = request.getParameter("search");
            if(search==null) search="";
        %>
        Welcome:<%= loginUser.getFullName()%>
        
        <a href="MainController?action=Logout">Logout<a/>
            
        <form action="MainController">
            Search<input type="text" name="search" value = "<%= search%>"/>
            <input type ="submit" name="action" value="Search"/>
        </form>
        <%
            List<FoodDTO> listFood = (List<FoodDTO>) request.getAttribute("LIST_FOOD");
            if(listFood!=null){
                if(listFood.size()>0){
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
                                <th>Status</th>
                                <th>Delete</th>
                                <th>Update</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int count = 1;
                                for(FoodDTO food : listFood){
                            %>     
                        <form action="MainController" method="POST">
                            <tr>
                                <td><%= count++ %></td>
                                <td>
                                    <input type ="text" name="id" value="<%=food.getId()%>" readonly=""/>
                                </td>
                                <td>
                                    <input type ="text" name="name" value="<%=food.getName()%>" required=""/>
                                </td>
                                <td>
                                    <input type ="text" name="description" value="<%=food.getDescription()%>" required=""/>
                                </td>
                                <td>
                                    <input type ="number" name="price" value="<%=food.getPrice()%>" required="min=1"/>
                                </td>
                                <td>
                                    <input type ="number" name="cookingTime" value="<%=food.getCookingTime()%>" required=""/>
                                </td>

                                <td><%= food.isStatus()%></td>
                                
                                <! delete o day-->
                                <td> 
                                    <a href="MainController?action=Delete&search=<%=search %>&id=<%= food.getId()%>">Delete</a> 
                                </td>
                                
                                <! update o day-->
                                <td>
                                    <input type ="submit" name ="action" value ="Update"/>
                                    <input type="hidden" name ="search" value="<%=search%>"/>
                                </td>
                            </tr>
                        </form>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    <%
                }
            }
        %>
    </body>
</html>
