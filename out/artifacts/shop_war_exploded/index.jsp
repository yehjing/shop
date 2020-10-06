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
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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

      a{
        font-size: 14px;
        padding: 5px 10px;
        border-radius: 5px;
        color: #fbd864;
        border: 1px solid #fbd864;
        background-color:#414345;
      }

      a:hover{
        cursor: pointer;
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

    <form id="myForm" name="myForm" method="post" onsubmit="return false">
      <fieldset>
        <legend>Form Check</legend>
        <div class="row">
          <label for="name">產品名稱</label>
          <input onblur="checkName()" name="name" autocomplete="off" type="text" placeholder="請輸入產品名稱" id="name" maxlength="6">
          <span class="nameTip">
<%--            <c:if test="${not empty errorMsgs.name}">--%>
<%--              <i class="error far fa-times-circle">${errorMsgs.name}</i>--%>
<%--            </c:if>--%>
          </span>

        </div>
        <div class="row">
          <label for="price">產品售價</label>
          <input onblur="checkPrice()" name="price" autocomplete="off" type="text" placeholder="請輸入產品售價" id="price" maxlength="12">
                <span class="priceTip">
<%--            <c:if test="${not empty errorMsgs.price}">--%>
<%--                  <i class="error far fa-times-circle">${errorMsgs.price}</i>--%>
<%--            </c:if>--%>
                </span>
        </div>
        <div class="row">
          <label for="date">建立日期</label>
          <input onblur="checkDate()" name="date" autocomplete="off" placeholder="請輸入日期" id="date">
                <span class="dateTip">
<%--            <c:if test="${not empty errorMsgs.date}">--%>
<%--                  <i class="error far fa-times-circle">${errorMsgs.date}</i>--%>
<%--            </c:if>--%>
                </span>
        </div>
        <a onclick="submit()">送出</a>
      </fieldset>
    </form>
    <script>
      // let name1 = document.querySelector("#name").value
      // let price1 = document.querySelector("#price").value
      // let date1 = document.querySelector("#date").value
      let errIcon = msg => '<i class="error far fa-times-circle">' + msg + '</i>'
      let correctIcon = '<i class="success far fa-check-circle">正確</i>'

      function submit(){
        let checkAll = checkName() && checkPrice() && checkDate()
        console.log('checkAll',checkAll)
        if(checkAll){
          let data =  {
            name: $("#name").val(),
            price: $("#price").val(),
            creat_date: $("#date").val()
          }
          $.ajax({
            type : "post",//傳送方式
            url : "<%=request.getContextPath()%>/ProductServlet",// 路徑
            contentType : 'application/json; charset=utf-8',
            data : JSON.stringify(data),
            success: function(res){
              location.href = "/list.jsp"
            },
            error: function(err) {alert(err.msg);}
          })
        } else {
          return false
        }
      }

      function checkName() {
        let name = document.querySelector("#name").value
        let nameTip = document.querySelector(".nameTip")
        let reg = /^[\u4e00-\u9fa5]*$/g
        if (!name) {
          nameTip.innerHTML = errIcon("產品名稱不可為空值")
          return false
        } else if (name.length < 2) {
          nameTip.innerHTML = errIcon("產品名稱必須大於2個字")
          return false
        } else if (!reg.test(name)) {
          nameTip.innerHTML = errIcon("產品名稱必須為中文字")
          return false
        } else {
          nameTip.innerHTML = correctIcon
          return true
        }
      }
      function checkPrice() {
        let price = document.querySelector("#price").value
        let nameTip = document.querySelector(".priceTip")
        let regNum = /^[1-9][0-9]*$/g
        if (price === "") {
          nameTip.innerHTML = errIcon("產品售價不可空白")
          return false
        } else if (!regNum.test(price)) {
          nameTip.innerHTML = errIcon("產品售價必須是數字且須大於0")
          return false
        } else {
          nameTip.innerHTML = correctIcon
          return true
        }
      }
      function checkDate() {
        let date = document.querySelector("#date").value
        let dateTip = document.querySelector(".dateTip")
        let reg = /^([0-9]{4})[/]{1}([0-9]{1,2})[/]{1}([0-9]{1,2})$/g
        let valArr = date.split('/')
        if (!date) {
          dateTip.innerHTML = errIcon("日期不可空白")
          return false
        } else if (!reg.test(date)) {
          dateTip.innerHTML = errIcon("日期格式錯誤")
          return false
        } else if (Number(valArr[1]) < 1 || Number(valArr[1]) > 12) {
          dateTip.innerHTML = errIcon("月份區間錯誤")
          return false
        } else if (Number(valArr[2]) < 1 || Number(valArr[2]) > 31) {
          dateTip.innerHTML = errIcon("日期區間錯誤")
          return false
        } else {
          dateTip.innerHTML = correctIcon
          return true
        }
      }
      // function submit() {
      //   // document.myForm.submit()
      //   return false
      // }
    </script>
  </body>
</html>
