package com.product.controller;

import com.alibaba.fastjson.JSONObject;
import com.product.service.ProductService;
import com.product.vo.ProductVo;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

public class ProductResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        doGet(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain; charset=UTF-8");

        if (req.getHeader("x-forwarded-for") == null) {
            System.out.println("a => " + req.getRemoteAddr());
        }
        System.out.println("b => " + req.getHeader("x-forwarded-for"));

        ProductService service = new ProductService();
        ArrayList<ProductVo> result =  service.getAllProduct();


        JSONObject resJsonObject = new JSONObject();
        HashMap<String, Object> data = new HashMap();  // 封裝到 Map 裡
        data.put("result", result);


        resJsonObject.put("code", "success");
        resJsonObject.put("data", data);
        resJsonObject.put("msg", "商品查詢成功");
        /*
         * 返回json
         */
        PrintWriter out = res.getWriter();
        out.write(String.valueOf(resJsonObject)); // 轉字串輸出
        out.close();


    }
}
