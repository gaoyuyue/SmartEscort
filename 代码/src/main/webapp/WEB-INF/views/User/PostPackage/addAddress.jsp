<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/4/10
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增收获地址</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>

</head>
<body style="background-color: #eeeeee">
    <div id="top">
        <span id="list">
            <a href="javascript:window.location.href='/User/PostPackage/selectAddress';"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">新增收货地址</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cells">
        <div class="weui-cell" style="clear:both;border: 1.5px solid white" id="inputname" onclick="checkname()">
            <div class="weui-cell__bd">
                <input class="weui-input" id="name" type="text" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" placeholder="收货人姓名(必填)" >
            </div>
        </div>
        <div class="weui-cell" style="clear:both;border: 1.5px solid white" id="inputphone" onclick="checkphone()">
            <div class="weui-cell__bd">
                <input class="weui-input" id="phone" type="text" maxlength="11" onkeyup="this.value=this.value.replace(/[^\d]/g,'') " placeholder="手机号码(必填)">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell" style="clear:both;border: 1.5px solid white" id="inputarea" onclick="checkarea()">
            <div class="weui-cell__hd"><label for="name" class="weui-label">区域</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="area" placeholder="请选择区域(必填)" type="text" value="">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell" style="clear:both;border: 1.5px solid white" id="inputdetail" onclick="checkdetail()">
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" id="detailAddress" placeholder="详细地址(必填)" rows="4"></textarea>
            </div>
        </div>
    </div>

    <div class="weui-cells">
        <a id="saveButton" href="javascript:;" class="weui-btn weui-btn_warn">保存</a>
    </div>
    <script src="/assets/js/jquery-weui.min.js"></script>
    <script src="/assets/js/fastclick.js"></script>
    <script src="/app/js/mobile.utils.js"></script>
    <script>
        $(function() {
            FastClick.attach(document.body);
        });
        var getSuccess = function (data) {
            $("#area").select({
                title: "选择区域",
                items: data
            });
        };
        $(document).ready(function () {
            Get("/User/ManageAddress/areaNameList",getSuccess);
        });
        var postSuccess = function () {
            window.location.href = "/User/PostPackage/";
        };
        function checkname() {
            $("#inputname").css("borderColor","white");
        }
        function checkphone() {
            $("#inputphone").css("borderColor","white");
        }
        function checkarea() {
            $("#inputarea").css("borderColor","white");
        }
        function checkdetail() {
            $("#inputdetail").css("borderColor","white");
        }

        $("#saveButton").click(function () {
            var data = {
                phoneNumber:$("#phone").val(),
                detail:$("#detailAddress").val(),
                receiverName:$("#name").val(),
                area:{
                    areaName:$("#area").val()
                }
            };
            function examphone(data) {
                if(data.phoneNumber =="") {
                    $("#inputphone").css({"borderColor": "red"});
                    return false;
                }
                else return true;
            }
            function examdetail(data) {
                if(data.detail =="") {
                    $("#inputdetail").css({"borderColor": "red"});
                    return false;
                }
                else return true;
            }
            function examname(data) {
                if(data.receiverName =="") {
                    $("#inputname").css({"borderColor": "red"});
                    return false;
                }
                else return true;
            }
            function examarea(data) {
                if(data.area.areaName =="") {
                    $("#inputarea").css({"borderColor": "red"});
                    return false;
                }
                else return true;
            }
            if(examarea(data)&examdetail(data)&examname(data)&examphone(data))
            {
                Post("/User/PostPackage/addAddress",data,postSuccess);
            }
        });

    </script>

</body>
</html>



