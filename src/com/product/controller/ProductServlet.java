package com.product.controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet(urlPatterns={"/index"})
public class ProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        doGet(req, res);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
//        res.getWriter().println("Hello, World");
        String name = req.getParameter("name"); // 取得請求參數
        req.setAttribute("name", name);         // 設定請求屬性
        req.getRequestDispatcher("list.jsp").forward(req, res); // 轉發至 JSP
    }
}
