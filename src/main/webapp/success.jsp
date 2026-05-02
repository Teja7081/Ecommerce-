<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <header>
        <h1>Order Placed</h1>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="products">Products</a>
        </nav>
    </header>
    <main>
        <p><%= request.getAttribute("message") %></p>
        <a href="products">Continue Shopping</a>
    </main>
</body>
</html>