package com.product.controller;
import com.product.service.ProductService;
import com.product.vo.ProductVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

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

        ProductService service = new ProductService();

//        PrintWriter out = res.getWriter();
        String name = req.getParameter("name"); // 取得請求參數
        Integer price = Integer.parseInt(req.getParameter("price")); // 取得請求參數
        String date = req.getParameter("date"); // 取得請求參數
//        Map map1 = req.getParameterMap();
//        System.out.println(map);

        req.setAttribute("name", name);         // 設定請求屬性
        req.setAttribute("price", price);         // 設定請求屬性
        req.setAttribute("date", date);         // 設定請求屬性
        req.getRequestDispatcher("list.jsp").forward(req, res);


        ProductVo vo = new ProductVo();
        vo.setName(name);
        vo.setPrice(price);
        vo.setCreat_date(date);

        try {
            service.addProduct(vo);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
