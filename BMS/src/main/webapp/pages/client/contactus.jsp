<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>

    <style>

        .main_contact{
            width:100%;
            border-top: 1px solid black;
        }

        .c_list{
            top:20%;
            position:absolute;
            height:630px;
            width:1650px;
            left:20%;
            border:2px solid black;
            text-align:center;
            border-radius:16px;
            background-color:rgba(255,255,255,1);

        }

        .c_list .l_c{

            top:30%;
            width:825px;
            height:400px;
            float:left;
            position:relative;
        }

        h1 {
            text-align:center;
            font-size:100px;
        }
    </style>

    <%@ include file="/pages/common/head.jsp" %>

</head>
<body>
    <div class="header">
        <%@ include file="/pages/common/header_new.jsp" %>
    </div>

    <div class="main_contact">
        <div class="body">

            <div class="c_list">
                <div class="l_c">
                    <a href="https://github.com/cs7eric/iBooks-">
                        <img src="static/img/github.png" style="width:200px;height:200px;" alt="">
                    </a>
                    <a href="https://github.com/cs7eric/iBooks-">
                        <div>本项目源码已开源于github</div>
                    </a>
                </div>
                <div class="l_c">
                    <a href="https://outlook.live.com/mail/0/">
                        <img src="static/img/outlook.png" style="width:200px;height:200px;" alt="">
                    </a>
                    <div>
                        <span>
                            Cs7eric@outlook.com
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>