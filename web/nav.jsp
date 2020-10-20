<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/10/19
  Time: 下午 02:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, '微軟正黑體';
        color: #fbd864;
        font-size: 18px;
        list-style: none;
    }

    body {
        height: 100vh;
        display: flex;
        flex-direction: column;
        /*justify-content: center;*/
        align-items: center;
        background: linear-gradient(to right, #232526, #414345);
    }
    .navBar{
        width: 80%;
        display: flex;
        border-bottom: 1px solid #fbd864;
        margin-bottom: 20px;
    }
    h1{
        margin-top: 10px;
        font-size: 40px;
        margin-bottom: 50px;
    }
    .navBar a{
        display: block;
        margin-right: 10px;
        text-decoration: none;
    }
</style>
<h1>JSP & Servlet Exercises</h1>
<div class="navBar">
    <a href="index.jsp">新增商品</a>
    <a href="list.jsp">查詢商品</a>
</div>