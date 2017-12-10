<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/21/021
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"><meta name="renderer" content="webkit">

    <title>完善信息</title>

    <%--引进WeUI插件--%>
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>

    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

</head>

<body class="gray-bg">
<div class="page input js_show">
        <div class="weui-cells__title">
            <h2>完善信息</h2>
        </div>
        <form action="/Account/Register" method="post" name="form1">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="nameLimit">
                <div class="weui-cell__hd"><label class="weui-label" for="name">真实姓名</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="text" name="name" id="name" placeholder="请输入真实姓名">
                </div>
            </div>

            <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="phoneLimit">
                <div class="weui-cell__hd">
                    <label class="weui-label">手机号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'')" placeholder="请输入手机号" name="phoneNumber" id="phoneNumber">
                </div>
            </div>

            <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="studentIdLimit">
                <div class="weui-cell__hd">
                    <label class="weui-label">学/工号</label>
                </div>
                <div class="weui-cell__bd">
                    <input class="weui-input" type="tel" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " placeholder="学/工号" name="studentId" id="studentId">
                </div>
            </div>

            <div class="weui-cell check" style="clear:both;border: 1.5px solid white" id="schoolNameTypeLimit" >
                <div class="weui-cell__hd"><label for="name" class="weui-label">学校</label></div>
                <div class="weui-cell__bd">
                    <input class="weui-input" name="schoolName" id="schoolName" placeholder="请选择学校" type="text" value="">
                </div>
            </div>

        </div>
        <div class="weui-btn-area">
            <button type="submit" class="weui-btn weui-btn_primary" id="submit">提交</button>
        </div>
        </form>
    </div>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>

<script type="text/javascript">
    var success = function (data) {
        $("#schoolName").select({
            title: "选择区域",
            items: data
        });
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/schoolNameList",success);
        check();
    });
</script>
<script>
    $("#submit").click(function () {
       var name = $("#name").val();
       var phoneNumber = $("#phoneNumber").val();
       var studentId = $("#studentId").val();
       var schoolName = $("#schoolName").val();

       if(name == ""){
           $("#nameLimit").css({"borderColor": "red"});
           return false;
       }
       if(phoneNumber == ""||!(/^1[34578]\d{9}$/.test(phoneNumber))){
           $("#phoneLimit").css({"borderColor": "red"});
           return false;
       }
       if(studentId == ""){
           $("#studentIdLimit").css({"borderColor": "red"});
           return false;
       }
       if(schoolName == ""){
           $("#schoolNameTypeLimit").css({"borderColor": "red"});
           return false;
       }
    });
</script>

</body>
</html>
