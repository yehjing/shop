<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2020/9/17
  Time: 下午 02:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <script src="https://kit.fontawesome.com/e59a78301c.js" crossorigin="anonymous"></script>
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
      fieldset {
        border: 2px solid #fbd864;
        border-radius: 10px;
        /*background: linear-gradient(to right, #232526, #414345);*/
        width: 500px;
        margin: auto;
        padding: 20px;
      }

      img {
        width: 5%;
      }

      legend {
        padding:5px 10px;
        border: 2px solid#fbd864;
        border-radius: 5px;
        background: linear-gradient(to right, #232526, #414345);
        margin: 0 auto;
        /* margin-left: 140px; */
        /* font-family: cursive; */
        font-size: 24px;
        color: #fbd864;
      }

      label{
        color: #fbd864;
        font-size: 16px;
        margin-right: 5px;
      }

      input{
        outline:none;
        border:none;
        color: #fbd864;
        border: 1px solid #fbd864;
        border-radius: 5px;
        background-color:#414345;
        font-size: 16px;
        padding:5px;
        letter-spacing: 1px;
      }

      input::placeholder{
        color: #fbd864;
      }

      input[type=submit]{
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 5px;
        color: #fbd864;
        border: 1px solid #fbd864;
        background-color:#414345;
      }

      input[type=submit]:hover{
        background-color:#fbd864;
        color: #414345;
        transition: .5s;
      }

      .row{
        margin-bottom: 15px;
      }

      .error{
        color: #ff0000;
        font-size: 16px;
      }

      .success{
        color:#71b83d;
      }

    </style>
  </head>
  <body>
    <form id="myForm" name="myForm" action="list" method="post">
      <fieldset>
        <legend>Form Check</legend>
        <div class="row">
          <label for="name">產品名稱</label>
          <input name="name" autocomplete="off" type="text" placeholder="請輸入產品名稱" id="name" maxlength="6">
          <c:if test="${not empty errorMsgs.name}">
            <span class="nameTip">
              <i class="error far fa-times-circle">${errorMsgs.name}</i>
            </span>
          </c:if>

        </div>
        <div class="row">
          <label for="price">產品售價</label>
          <input name="price" autocomplete="off" type="text" placeholder="請輸入產品售價" id="price" maxlength="12">
            <c:if test="${not empty errorMsgs.price}">
                <span class="priceTip">
                  <i class="error far fa-times-circle">${errorMsgs.price}</i>
                </span>
            </c:if>
        </div>
        <div class="row">
          <label for="date">建立日期</label>
          <input name="date" autocomplete="off" placeholder="請輸入日期" id="date">
            <c:if test="${not empty errorMsgs.date}">
                <span class="dateTip">
                  <i class="error far fa-times-circle">${errorMsgs.date}</i>
                </span>
            </c:if>
        </div>
        <input type="submit" value="送出"/>
      </fieldset>
    </form>
    <script>

      // let errIcon = msg => '<i class="error far fa-times-circle">' + msg + '</i>'
      // let correctIcon = '<i class="success far fa-check-circle">正確</i>'
      //
      // function checkName() {
      //   let value = document.querySelector("#name").value
      //   let nameTip = document.querySelector(".nameTip")
      //   let reg = /^[\u4e00-\u9fa5]*$/g
      //   if (!value) {
      //     nameTip.innerHTML = errIcon("產品名稱不可為空值")
      //   } else if (value.length < 2) {
      //     nameTip.innerHTML = errIcon("產品名稱必須大於2個字")
      //   } else if (!reg.test(value)) {
      //     nameTip.innerHTML = errIcon("產品名稱必須為中文字")
      //   } else {
      //     nameTip.innerHTML = correctIcon
      //   }
      // }
      // function ckeckPrice() {
      //   let value = document.querySelector("#price").value
      //   let nameTip = document.querySelector(".priceTip")
      //   let regNum = /^[0-9]*$/g
      //   if (value === "") {
      //     nameTip.innerHTML = errIcon("產品售價不可空白")
      //   } else if (!regNum.test(value)) {
      //     nameTip.innerHTML = errIcon("產品售價必須是數字")
      //   } else {
      //     nameTip.innerHTML = correctIcon
      //   }
      // }
      // function ckeckDate() {
      //   let value = document.querySelector("#date").value
      //   let dateTip = document.querySelector(".dateTip")
      //   let reg = /^([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-9]{1,2})$/g
      //   let valArr = value.split('/')
      //   if (!value) {
      //     dateTip.innerHTML = errIcon("日期不可空白")
      //   } else if (!reg.test(value)) {
      //     dateTip.innerHTML = errIcon("日期格式錯誤")
      //   } else if (Number(valArr[1]) < 1 || Number(valArr[1]) > 12) {
      //     dateTip.innerHTML = errIcon("月份區間錯誤")
      //   } else if (Number(valArr[2]) < 1 || Number(valArr[2]) > 31) {
      //     dateTip.innerHTML = errIcon("日期區間錯誤")
      //   } else {
      //     dateTip.innerHTML = correctIcon
      //   }
      // }
      // function submit() {
      //   // document.myForm.submit()
      //   return false
      // }
    </script>
  </body>
</html>
