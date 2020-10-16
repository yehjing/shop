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
        <title>產品列表</title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <style>
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family: Arial, '微軟正黑體';
                color: #fbd864;
                font-size: 18px;
                list-style: none;
            }

            body {
                min-height: 100vh;
                /*display: flex;*/
                /*justify-content: center;*/
                /*align-items: center;*/
                background: linear-gradient(to right, #232526, #414345);
            }
            ul{
                width: 80%;
                margin: 0 auto;
                display: flex;
                flex-wrap: wrap;
            }
            li{
                /*flex: 0 0 19%;*/
                /*max-width: 19%;*/
                width: 250px;
                height: 400px;
                margin: .5% .5%;
                border: 1px solid #fbd864;
                border-radius: 5px;
                overflow: hidden;
            }
            figure{
                width: 100%;
                /*width: 200px;*/
                height: 200px;
                overflow: hidden;
            }
            img{
                width: 100%;
                object-fit: cover;
            }
            a{
                font-size: 14px;
                padding: 5px 10px;
                border-radius: 5px;
                color: #fbd864;
                border: 1px solid #fbd864;
                background-color:#414345;
                text-decoration: none;
            }

            a:hover{
                cursor: pointer;
                background-color:#fbd864;
                color: #414345;
                transition: .5s;
            }
            a:active{
                color: #fbd864;
            }
        </style>
    </head>
    <body>
        <div>
<%--            <img src="" alt="">--%>
            <ul class="productUl">
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <img src="https://i.pinimg.com/564x/5d/fa/39/5dfa39270bf43d17a907e45d3b1ee96c.jpg" alt="">--%>
<%--                    </figure>--%>
<%--                    <p>產品名稱</p>--%>
<%--                    <p>$200</p>--%>
<%--                    <a href="javascript:;">刪除</a>--%>
<%--                </li>--%>

            </ul>
        </div>

        <script>
            $(document).ready(function(){
                getInitData()
            })
            let getInitData = function (){
                $.ajax({
                    type : "post",//傳送方式
                    url : "<%=request.getContextPath()%>/ProductResultServlet",// 路徑
                    contentType : 'application/json; charset=utf-8',
                    // data : {},
                    success: function(res){
                        let { result = [] } = JSON.parse(res).data
                        $(".productUl").children().remove();
                        result.forEach(function (item){
                            let htmlTemplate = `
                                <li data-id="${'${item.id}'}">
                                    <figure>
                                        <img src="<%=request.getContextPath()%>${"${item.img_path}"}" alt="">
                                    </figure>
                                    <p>${"${item.name}"}</p>
                                    <p>${"${item.price}"}</p>
                                    <a href="javascript:;" onclick="del(${"${item.id}"})">刪除</a>
                                </li>
                            `
                            $(".productUl").append(htmlTemplate)
                        })
                        console.log("res", JSON.parse(res))
                    },
                    error: function(err) {alert(err.msg);}
                })
            }
            let del = function (id){
                $.ajax({
                    type : "get",//傳送方式
                    url : "<%=request.getContextPath()%>/ProductDeleteServlet?id=" + id,// 路徑
                    contentType : 'application/json; charset=utf-8',
                    // data : {},
                    success: function(res){

                        console.log("res", JSON.parse(res))
                        getInitData()
                    },
                    error: function(err) {alert(err.msg);}
                })
            }
        </script>
    </body>
</html>
