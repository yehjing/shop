<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>新增商品</title>
    <script src="https://kit.fontawesome.com/e59a78301c.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        .addProduct{
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
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
            padding: 5px 10px;
            border: 2px solid #fbd864;
            border-radius: 5px;
            background: linear-gradient(to right, #232526, #414345);
            margin: 0 auto;
            /* margin-left: 140px; */
            /* font-family: cursive; */
            font-size: 24px;
            color: #fbd864;
        }

        label {
            color: #fbd864;
            font-size: 16px;
            margin-right: 5px;
        }

        input {
            outline: none;
            border: none;
            color: #fbd864;
            border: 1px solid #fbd864;
            border-radius: 5px;
            background-color: #414345;
            font-size: 16px;
            padding: 5px;
            letter-spacing: 1px;
        }

        input::placeholder, textarea::placeholder {
            color: #fbd864;
        }

        textarea {
            outline: none;
            border: none;
            color: #fbd864;
            border: 1px solid #fbd864;
            border-radius: 5px;
            background-color: #414345;
            font-size: 16px;
            padding: 5px;
            letter-spacing: 1px;
        }

        a.submit {
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 5px;
            color: #fbd864;
            border: 1px solid #fbd864;
            background-color: #414345;
        }

        a.submit:hover {
            cursor: pointer;
            background-color: #fbd864;
            color: #414345;
            transition: .5s;
        }

        .row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .error {
            color: #ff0000;
            font-size: 16px;
        }

        .success {
            color: #71b83d;
        }

    </style>
</head>
<body>
<%@ include file="/nav.jsp"%>
<div class="addProduct">
    <form id="myForm" name="myForm" method="post" onsubmit="return false">
        <fieldset>
            <legend>Form Check</legend>
            <div class="row">
                <label for="name">產品名稱</label>
                <input onblur="checkName()" name="name" autocomplete="off" type="text" placeholder="請輸入產品名稱" id="name"
                       maxlength="10">
                <span class="nameTip">
<%--            <c:if test="${not empty errorMsgs.name}">--%>
<%--              <i class="error far fa-times-circle">${errorMsgs.name}</i>--%>
<%--            </c:if>--%>
          </span>

            </div>
            <div class="row">
                <label for="price">產品售價</label>
                <input onblur="checkPrice()" name="price" autocomplete="off" type="text" placeholder="請輸入產品售價" id="price"
                       maxlength="12">
                <span class="priceTip">
<%--            <c:if test="${not empty errorMsgs.price}">--%>
<%--                  <i class="error far fa-times-circle">${errorMsgs.price}</i>--%>
<%--            </c:if>--%>
                </span>
            </div>
            <%--        <div class="row">--%>
            <%--          <label for="date">建立日期</label>--%>
            <%--          <input onblur="checkDate()" name="date" autocomplete="off" placeholder="請輸入日期" id="date">--%>
            <%--                <span class="dateTip">--%>
            <%--                </span>--%>
            <%--        </div>--%>
            <div class="row">
                <label for="description">產品描述</label>
                <textarea maxlength="200" rows="4" cols="40" onblur="checkDesc()" name="description" autocomplete="off" placeholder="請輸入產品描述"
                          id="description"></textarea>
                <span class="descriptionTip">
          </span>
            </div>

            <div class="row">
                <label for="productImg">產品圖片</label>
                <input accept="image/*" type="file" id="productImg" name="productImg" onchange="handleFiles()">
            </div>
            <a class="submit" onclick="submit()">送出</a>
        </fieldset>
    </form>

</div>
<script>
    let filePathTemp;

    // 圖片上傳
    function uploadImg(type, imgBase64) {
        let data = {
            type: type,
            imgBase64: imgBase64
        }
        $.ajax({
            type: "post",//傳送方式
            url: "<%=request.getContextPath()%>/ProductUploadServlet",// 路徑
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data),
            success: function (res) {
                filePathTemp = JSON.parse(res).data.filePath
                console.log('res', res)
            },
            error: function (err) {
                alert(err.msg);
            }
        })
    }

    async function handleFiles(e) {

        // STEP 2: 得到該檔案的 Blob, i.e., e.target.files
        let fileList = document.querySelector("input[type=file]").files[0]
        const arrayBuffer = await getDataURL(fileList);

        let type = arrayBuffer.substring(0, arrayBuffer.indexOf("base64") - 1).split("/")[1]
        let imgBase64 = arrayBuffer.substring(arrayBuffer.indexOf("base64") + 7, arrayBuffer.length)
        uploadImg(type, imgBase64)
        console.log('type', type)
        console.log('data', imgBase64)
        // a = Array.from(new Uint8Array(arrayBuffer));
        // console.log('a', a);
    }

    function getDataURL(file) {
        return new Promise((resolve, reject) => {
            // 轉成 DataURL, i.e., reader.result
            const reader = new FileReader();
            console.log('reader', reader.result)
            reader.addEventListener('load', () => {
                console.log(reader)
                resolve(reader.result);
            });
            // reader.readAsArrayBuffer(file);
            reader.readAsDataURL(file) // 使用 readAsDataURL()
        })
    }

    // let name1 = document.querySelector("#name").value
    // let price1 = document.querySelector("#price").value
    // let date1 = document.querySelector("#date").value
    let errIcon = msg => '<i class="error far fa-times-circle">' + msg + '</i>'
    let correctIcon = '<i class="success far fa-check-circle">正確</i>'

    function submit() {
        let checkAll = checkName() && checkPrice() && checkDesc()
        console.log('checkAll', checkAll)
        if (checkAll) {
            let data = {
                name: $("#name").val(),
                price: $("#price").val(),
                description: $("#description").val(),
                imgPath: filePathTemp
            }
            $.ajax({
                type: "post",//傳送方式
                url: "<%=request.getContextPath()%>/ProductServlet",// 路徑
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data),
                success: function (res) {
                    location.href = "<%=request.getContextPath()%>/list.jsp"
                    filePathTemp = ''
                },
                error: function (err) {
                    alert(err.msg);
                }
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

    function checkDesc() {
        let description = document.querySelector("#description").value
        let descriptionTip = document.querySelector(".descriptionTip")

        if (!description) {
            descriptionTip.innerHTML = errIcon("產品描述不可空白")
            return false
        } else {
            descriptionTip.innerHTML = correctIcon
            return true
        }
    }

    // function checkDate() {
    //     let date = document.querySelector("#date").value
    //     let dateTip = document.querySelector(".dateTip")
    //     let reg = /^([0-9]{4})[/]{1}([0-9]{1,2})[/]{1}([0-9]{1,2})$/g
    //     let valArr = date.split('/')
    //     if (!date) {
    //         dateTip.innerHTML = errIcon("日期不可空白")
    //         return false
    //     } else if (!reg.test(date)) {
    //         dateTip.innerHTML = errIcon("日期格式錯誤")
    //         return false
    //     } else if (Number(valArr[1]) < 1 || Number(valArr[1]) > 12) {
    //         dateTip.innerHTML = errIcon("月份區間錯誤")
    //         return false
    //     } else if (Number(valArr[2]) < 1 || Number(valArr[2]) > 31) {
    //         dateTip.innerHTML = errIcon("日期區間錯誤")
    //         return false
    //     } else {
    //         dateTip.innerHTML = correctIcon
    //         return true
    //     }
    // }

    // function submit() {
    //   // document.myForm.submit()
    //   return false
    // }
</script>
</body>
</html>
