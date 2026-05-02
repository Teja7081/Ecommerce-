package com.example.ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = getProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    private List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        products.add(new Product(1, "Laptop", 999.99, "laptop.jpg"));
        products.add(new Product(2, "Phone", 599.99, "phone.jpg"));
        products.add(new Product(3, "Tablet", 299.99, "tablet.jpg"));
        return products;
    }
}