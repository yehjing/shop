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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./style/list.css">
</head>
<body>
<%@ include file="/nav.jsp"%>
<div>
    <ul class="productUl">
    </ul>
</div>

<script>
    {
        $(document).ready(function () {
            getInitData()
        })

        let getInitData = function () {
            $.ajax({
                type: "post",//傳送方式
                url: "<%=request.getContextPath()%>/ProductResultServlet",// 路徑
                contentType: 'application/json; charset=utf-8',
                // data : {},
                success: function (res) {
                    let {result = []} = JSON.parse(res).data
                    // $(".productUl").children().remove();
                    result.forEach(function (item) {
                        let htmlTemplate = `
                                    <li data-id="${'${item.id}'}">
                                        <figure>
                                            <img src="<%=request.getContextPath()%>${"${item.img_path}"}" alt="">
                                        </figure>
                                        <div class="cardContent">
                                            <p class="productName">${"${item.name}"}</p>
                                            <p class="description">${"${item.description}"}</p>
                                            <p class="price">$ ${"${item.price}"}</p>
                                            <a class="del" href="javascript:;" onclick="del(${"${item.id}"})">刪除</a>
                                        </div>
                                    </li>
                                `
                        $(".productUl").append(htmlTemplate)
                    })
                    hideText()
                    console.log("res", JSON.parse(res))
                },
                error: function (err) {
                    alert(err.msg);
                }
            })
        }
        let del = function (id) {
            $.ajax({
                type: "get",//傳送方式
                url: "<%=request.getContextPath()%>/ProductDeleteServlet?id=" + id,// 路徑
                contentType: 'application/json; charset=utf-8',
                // data : {},
                success: function (res) {

                    console.log("res", JSON.parse(res))
                    getInitData()
                },
                error: function (err) {
                    alert(err.msg);
                }
            })
        }
        let hideText = () => {
        let len = 50
        $(".description").each(function (i) {
            if ($(this).text().length > len) {
                $(this).attr("title", $(this).text())
                var text = $(this).text().substring(0, len - 1) + "..."
                $(this).text(text)
            }
        })
    }
    }

</script>
</body>
</html>
