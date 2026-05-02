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

public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }
        List<Product> products = getProducts();
        request.setAttribute("cart", cart);
        request.setAttribute("products", products);
        request.getRequestDispatcher("/cart.jsp").forward(request, response);
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<Integer, Integer> cart = (Map<Integer, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            if ("add".equals(action)) {
                cart.put(id, cart.getOrDefault(id, 0) + 1);
            } else if ("remove".equals(action)) {
                cart.remove(id);
            }
        }

        response.sendRedirect("cart");
    }

    private List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Laptop", 999.99, "laptop.jpg"));
        products.add(new Product(2, "Phone", 599.99, "phone.jpg"));
        products.add(new Product(3, "Tablet", 299.99, "tablet.jpg"));
        return products;
    }
}