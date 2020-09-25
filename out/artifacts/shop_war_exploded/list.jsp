<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/9/17
  Time: 下午 06:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        *{
            margin:0;
            padding:0;       box-sizing:border-box;
            font-family: Arial, '微軟正黑體';
            color: #fbd864;
            font-size: 18px;
        }

        body {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to right, #232526, #414345);
        }
    </style>
</head>
<body>
<div>
    <p>產品名稱 => ${data.name}</p>
    <p>產品售價 => ${data.price}</p>
    <p>建立日期 => ${data.date}</p>
</div>

</body>
</html>
