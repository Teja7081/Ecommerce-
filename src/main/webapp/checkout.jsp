<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommerce.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Checkout</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="cart">Cart</a>
        </nav>
    </header>
    <main>
        <h2>Order Summary</h2>
        <%
            Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getAttribute("cart");
            List<Product> products = (List<Product>) request.getAttribute("products");
            double total = (Double) request.getAttribute("total");
        %>
        <ul>
            <%
                for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
                    int id = entry.getKey();
                    int qty = entry.getValue();
                    Product p = null;
                    for (Product prod : products) {
                        if (prod.getId() == id) {
                            p = prod;
                            break;
                        }
                    }
                    if (p != null) {
            %>
            <li><%= p.getName() %> x <%= qty %> - $<%= p.getPrice() * qty %></li>
            <%
                    }
                }
            %>
        </ul>
        <p>Total: $<%= total %></p>
        <form action="checkout" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required><br>
            <label for="address">Address:</label>
            <textarea id="address" name="address" required></textarea><br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required><br>
            <button type="submit">Place Order</button>
        </form>
    </main>
</body>
</html>