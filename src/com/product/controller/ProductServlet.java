package com.product.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.product.service.ProductService;
import com.product.vo.ProductVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

//@WebServlet(name = "ProductServlet",urlPatterns = {"/list"})
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        doGet(req, res);
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain; charset=UTF-8");

        /* 接收json */
        BufferedReader reader = req.getReader();
        StringBuilder sb = new StringBuilder();// 接收使用者端傳來的JSON字串(body體裡的資料)
        String line;
        while ((line = reader.readLine()) != null){
            sb = sb.append(line);
        }
        reader.close();

        ProductVo vo = JSON.parseObject(String.valueOf(sb), ProductVo.class);
        String name = vo.getName(); // 取得請求參數
        Integer price = vo.getPrice(); // 取得請求參數
        String date = vo.getCreat_date(); // 取得請求參數
        System.out.println("date=> " + date + "name=> " + name + "price=> " + price);
//        Integer price = null;

        ProductService service = new ProductService();
        // 封裝錯誤訊息
        HashMap<String, String> errorMsgs = new HashMap();

//        PrintWriter out = res.getWriter();
//        String name = req.getParameter("name"); // 取得請求參數
//        String priceStr = req.getParameter("price"); // 取得請求參數
//        Integer price = null;
//        Integer price = Integer.parseInt(req.getParameter("price")); // 取得請求參數
        if(price == null) {
            errorMsgs.put("price", "產品售價不應為空");
        }

        try {
            if(price < 0) {
                errorMsgs.put("price", "產品售價不得小於0");
            }
        } catch (NumberFormatException e) {
            errorMsgs.put("price", "產品售價只能為數字");
        }
//        String date = req.getParameter("date"); // 取得請求參數
//        Map map1 = req.getParameterMap();
//        System.out.println(map);

        // name
//        String regCh = "/^[\u4e00-\u9fa5]*$/g";
        if(name == null || name.trim().isEmpty()){
            errorMsgs.put("name", "產品名稱不應為空");
        } else if (name.length() < 2){
            errorMsgs.put("name", "產品名稱必須大於2個字");
        }


        // date
        String dateReg = "([0-9]{4})[/]{1}([0-9]{1,2})[/]{1}([0-9]{1,2})$";
        String[] valArr = date.split("/");
        if(date.trim().isEmpty()){
            errorMsgs.put("date", "日期不可空白");
        }else if (!date.matches(dateReg)) {
            errorMsgs.put("date", "日期格式錯誤");
        }else if (Integer.parseInt(valArr[1]) < 1 || Integer.parseInt(valArr[1]) > 12) {
            errorMsgs.put("date", "月份區間錯誤");
        } else if (Integer.parseInt(valArr[2]) < 1 || Integer.parseInt(valArr[2]) > 31) {
            errorMsgs.put("date", "日期區間錯誤");
        }
        JSONObject resJsonObject = new JSONObject();
        HashMap<String, Object> data = new HashMap();  // 封裝到 Map 裡
        data.put("name", name);
        data.put("price", price);
        data.put("date", date);


//        req.setAttribute("data", data);         // 設定請求屬性
//        req.setAttribute("price", price);         // 設定請求屬性
//        req.setAttribute("date", date);         // 設定請求屬性
        System.out.println(errorMsgs.size());

        if (errorMsgs.size() > 0){
//            req.setAttribute("errorMsgs", errorMsgs);
//            req.setAttribute("data", data);
            resJsonObject.put("code", "fail");
            resJsonObject.put("data", data);
            resJsonObject.put("msg", errorMsgs);

            System.out.println("first");

//            req.getRequestDispatcher("index.jsp").forward(req, res);
            return;
        }
        resJsonObject.put("code", "success");
        resJsonObject.put("data", data);
        resJsonObject.put("msg", "商品新增成功");
        /*
         * 返回json
         */
        PrintWriter out = res.getWriter();
        out.write(String.valueOf(resJsonObject)); // 轉字串輸出
        out.close();

//        ProductVo vo = new ProductVo();
//        vo.setName(name);
//        vo.setPrice(price);
//        vo.setCreat_date(date);

        // 驗證過了就呼叫 service 層，導向產品列表頁
        service.addProduct(vo);
        System.out.println("last");
//        req.getRequestDispatcher("list.jsp").forward(req, res);
    }

}
