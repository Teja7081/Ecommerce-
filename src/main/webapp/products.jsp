<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommerce.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Our Products</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="cart">Cart</a>
        </nav>
    </header>
    <main>
        <div class="products">
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                for (Product p : products) {
            %>
            <div class="product">
                <img src="images/<%= p.getImage() %>" alt="<%= p.getName() %>">
                <h3><%= p.getName() %></h3>
                <p>$<%= p.getPrice() %></p>
                <form action="cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="<%= p.getId() %>">
                    <button type="submit">Add to Cart</button>
                </form>
            </div>
            <%
                }
            %>
        </div>
    </main>
</body>
</html>