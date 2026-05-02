package com.example.ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        List<Product> products = getProducts();
        double total = calculateTotal(cart, products);
        request.setAttribute("cart", cart);
        request.setAttribute("products", products);
        request.setAttribute("total", total);
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
        }
        request.setAttribute("message", "Order placed successfully!");
        request.getRequestDispatcher("/success.jsp").forward(request, response);
    }

    private List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Laptop", 999.99, "laptop.jpg"));
        products.add(new Product(2, "Phone", 599.99, "phone.jpg"));
        products.add(new Product(3, "Tablet", 299.99, "tablet.jpg"));
        return products;
    }

    private double calculateTotal(Map<Integer, Integer> cart, List<Product> products) {
        double total = 0;
        for (Map.Entry<Integer, Integer> entry : cart.entrySet()) {
            int id = entry.getKey();
            int qty = entry.getValue();
            for (Product p : products) {
                if (p.getId() == id) {
                    total += p.getPrice() * qty;
                    break;
                }
            }
        }
        return total;
    }
}