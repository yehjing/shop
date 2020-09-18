package com.product.controller;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(urlPatterns={"/index"})
//@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        doGet(req, res);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain; charset=UTF-8");
//        PrintWriter out = res.getWriter();
        String name = req.getParameter("name"); // 取得請求參數
        String price = req.getParameter("price"); // 取得請求參數
        String date = req.getParameter("date"); // 取得請求參數


        req.setAttribute("name", name);         // 設定請求屬性
        req.setAttribute("price", price);         // 設定請求屬性
        req.setAttribute("date", date);         // 設定請求屬性
        req.getRequestDispatcher("list.jsp").forward(req, res); // 轉發至 JSP
    }
}
