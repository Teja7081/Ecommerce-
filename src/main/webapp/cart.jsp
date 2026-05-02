<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommerce.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Your Cart</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="products">Products</a>
        </nav>
    </header>
    <main>
        <%
            Map<Integer, Integer> cart = (Map<Integer, Integer>) request.getAttribute("cart");
            List<Product> products = (List<Product>) request.getAttribute("products");
            double total = 0;
            if (cart.isEmpty()) {
        %>
        <p>Your cart is empty.</p>
        <%
            } else {
        %>
        <table>
            <tr>
                <th>Product</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Subtotal</th>
                <th>Action</th>
            </tr>
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
                        double subtotal = p.getPrice() * qty;
                        total += subtotal;
            %>
            <tr>
                <td><%= p.getName() %></td>
                <td><%= qty %></td>
                <td>$<%= p.getPrice() %></td>
                <td>$<%= subtotal %></td>
                <td>
                    <form action="cart" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <p>Total: $<%= total %></p>
        <a href="checkout">Proceed to Checkout</a>
        <%
            }
        %>
    </main>
</body>
</html>