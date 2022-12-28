<%-- 
    Document   : viewCart
    Created on : Dec 7, 2022, 12:49:13 PM
    Author     : KHOA
--%>

<%@page import="sample.product.ProductDTO"%>
<%@page import="com.oracle.jrockit.jfr.Producer"%>
<%@page import="sample.product.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>
    <body>
        <h1>Your selected items</h1>
        <%
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart != null) {
                if (cart.getCart().size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>NO</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Edit</th>
                    <th>Remove</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String search = request.getParameter("search");
                    if (search == null) {
                        search = "";
                    }
                    int count = 1;
                    double total = 0;
                    for (ProductDTO p : cart.getCart().values()) {
                        total += p.getPrice() * p.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                    <td><%= count++%></td>

                    <td><%= p.getId()%>
                        <input type="hidden" name="id" value="<%=p.getId()%>"
                    </td>

                    <td><%= p.getName()%></td>

                    <td><%= p.getPrice()%></td>

                    <td>
                        <input type="number" name="quantity" value="<%= p.getQuantity()%>" min="1"

                    </td>

                    <td><%= p.getPrice() * p.getQuantity()%>$</td>
                    <td>
                        <input type ="submit" name="action" value="Edit"/>
                        <input type="hidden" name="search" value="<%= search%>"
                    </td>
                    <td>
                        <input type ="submit" name="action" value="Remove"/>
                    </td>
                    <td>
                        <a href ="MainController?action=Remove&id=<%=p.getId()%>">Remove</a>
                    </td>
                </tr>
            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <h1> Total: <%= total%>$</h1>
    <%
            }
        }
    %>
    <%
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
    %>

    <a href ="SearchProductController?search=<%= search%>">add more</a>

    <a href="shopping1.jsp">Add more</a>
</body>
</html>
