package com.product.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Calendar;
import java.util.HashMap;

//@WebServlet(name = "ProductUploadServlet", urlPatterns = {"/ProductUploadServlet"})
public class ProductUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        doGet(req, res);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        req.setCharacterEncoding("UTF-8");
        res.setContentType("text/plain; charset=UTF-8");

//        PrintWriter outInfo = res.getWriter();
        /* 接收json */
        BufferedReader reader = req.getReader();
        StringBuilder sb = new StringBuilder();// 接收使用者端傳來的JSON字串(body體裡的資料)
        String line;
        while ((line = reader.readLine()) != null){
            sb = sb.append(line);
        }
        reader.close();
        JSONObject jsonObj = JSON.parseObject(String.valueOf(sb));
        String type = String.valueOf(jsonObj.get("type"));
        String imgBase64  = String.valueOf(jsonObj.get("imgBase64"));
        System.out.println("type" + type);


        sun.misc.BASE64Decoder base64Decoder = new sun.misc.BASE64Decoder();
        String ppp = getServletContext().getRealPath("/"); // 取得當前專案路徑 D:\IDEA\shop\out\artifacts\shop_war_exploded\
        System.out.println("ppp" + ppp);
        String projectNowPath = ppp.substring(0, ppp.indexOf("shop") + 4); //ex => D:\IDEA\shop
        String path = projectNowPath + "/web/uploads/img/"; // 自己想存放的路徑

        Calendar calendar = Calendar.getInstance();
        String filePath = path+calendar.get(Calendar.MINUTE)+calendar.get(calendar.SECOND)+calendar.get(calendar.MILLISECOND)+"."+type;

        File file = new File(filePath);
//        System.out.println("f.exists() " + file.exists());
        if (!file.exists()) {
//          直接 file.mkdirs()會把 xxx.png 當成資料夾建立，就無法 createNewFile ，所以應該先切換到上層目錄再進行mkdirs()
            file.getParentFile().mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

//        file.createNewFile();
        OutputStream fileOut = new FileOutputStream(file);
//        解析 base64
        fileOut.write(base64Decoder.decodeBuffer(imgBase64));



        fileOut.close();

        JSONObject resJsonObject = new JSONObject();
        HashMap<String, Object> data = new HashMap();  // 封裝到 Map 裡
//        處理一下前端要的錄徑 /uploads/img/xxxxxx.png
        String transFilePath = filePath.substring(filePath.indexOf("/uploads"));
        System.out.println(transFilePath);
        data.put("filePath", transFilePath);

        resJsonObject.put("code", "success");
        resJsonObject.put("data", data);
        resJsonObject.put("msg", "商品圖片上傳成功");


        /*
         * 返回json
         */
        PrintWriter out = res.getWriter();
        out.write(String.valueOf(resJsonObject)); // 轉字串輸出
        out.close();


//        outInfo.println("{\"url\":"+"\""+calendar.get(Calendar.MINUTE)+calendar.get(calendar.SECOND)+calendar.get(calendar.MILLISECOND)+"."+type+"\"}");
//        if("1".equals(operation)) {
//            File f = new File(path+account+calendar.get(Calendar.MINUTE)+calendar.get(calendar.SECOND)+calendar.get(calendar.MILLISECOND)+"."+type);
//            f.createNewFile();
//            OutputStream out = new FileOutputStream(f);
//            out.write(base64Decoder.decodeBuffer(data));
//            out.close();
//
//            outInfo.println("{\"url\":"+"\""+account+calendar.get(Calendar.MINUTE)+calendar.get(calendar.SECOND)+calendar.get(calendar.MILLISECOND)+"."+type+"\"}");
//
//        }else if("2".equals(operation)) {
//            File file=new File(name);
//            if(file.exists()&&file.isFile()) {
//                file.delete();
//                outInfo.println("2");
//            }
//
//        }

    }


}
