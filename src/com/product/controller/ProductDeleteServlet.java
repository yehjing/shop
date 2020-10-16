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

public class ProductDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain; charset=UTF-8");

        String id = req.getParameter("id"); // 取得請求參數


        ProductService service = new ProductService();
        boolean isDelete = service.delProduct(Integer.valueOf(id));


        JSONObject resJsonObject = new JSONObject();
        HashMap<String, Object> data = new HashMap();  // 封裝到 Map 裡

        if(isDelete){
            resJsonObject.put("code", "success");
            resJsonObject.put("data", data);
            resJsonObject.put("msg", "商品刪除成功");
        } else {
            resJsonObject.put("code", "fail");
            resJsonObject.put("data", data);
            resJsonObject.put("msg", "商品刪除失敗");
        }

        /*
         * 返回json
         */
        PrintWriter out = res.getWriter();
        out.write(String.valueOf(resJsonObject)); // 轉字串輸出
        out.close();


    }
}
