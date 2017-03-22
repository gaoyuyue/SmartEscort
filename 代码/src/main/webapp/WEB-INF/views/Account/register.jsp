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

    <title>注册</title>

    <link href="/assets/css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <link href="/assets/css/animate.css" rel="stylesheet">
    <link href="/assets/css/style.css?v=2.2.0" rel="stylesheet">

    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/assets/js/bootstrap.min.js?v=3.4.0"></script>
</head>

<body class="blue-bg">
<div class="middle-box text-center loginscreen  animated fadeInDown">
    <div>
        <div>
            <h3>镖师/发镖人注册</h3>
        </div>

        <form class="m-t-md" role="form" action="/Account/Register" method="post">
            <div class="form-group">
                <div class="col-lg-12">
                    <label for="UserName">江湖人称</label>
                    <input type="text" class="form-control" placeholder="昵称" required="" name="UserName" id="UserName">
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-12">
                    <label for="Name">尊姓大名</label>
                    <input type="text" class="form-control" placeholder="真实姓名" required="" name="Name" id="Name">
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-12">
                    <label for="PhoneNumber">千里传音</label>
                    <input type="text" class="form-control" placeholder="手机号" required="" name="PhoneNumber" id="PhoneNumber">
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-12">
                    <label for="Password">密码</label>
                    <input type="text" class="form-control" placeholder="密码" required="" name="Password" id="Password">
                </div>
            </div>

            <div class="form-group">
                <div class="col-lg-12">
                    <label for="ConfirmPassword">确认密码</label>
                    <input type="text" class="form-control" placeholder="确认密码" required="" name="ConfirmPassword" id="ConfirmPassword">
                </div>
            </div>

            <div class="form-group">
                <div class=" col-lg-6">
                    <div class="">
                        <input class="form-control input-lg" type="text" required="" name="validateCode"
                               placeholder="验证码">
                    </div>
                </div>

                <div class=" col-lg-6">
                    <div class="">
                        <div class="">
                            <img id="validateCodeImg"
                                 src="${pageContext.request.contextPath}/Account/validateCode"/>&nbsp;&nbsp;
                            <a href="#" onclick="javascript:reloadValidateCode();">看不清？</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-12">
                <button type="submit" class="btn btn-primary block full-width m-b" id="submit">进入镖局</button>
            </div>
        </form>

    </div>



</div>

<script src="/assets/js/sha256.min.js"></script>
<script>
    function reloadValidateCode() {
        $("#validateCodeImg").attr("src", "/Account/validateCode?data=" + new Date() + Math.floor(Math.random() * 24));
    }
    $("#validateCodeImg").click(function () {
        reloadValidateCode();
    });
</script>

<script type="text/javascript">
    /**
     * 注册
     */
    $("#UserName").focus(function () {

    });
    $("#UserName").blur(function () {
        var searchId = $("#UserName").val();
        if (!isNullOrEmpty(searchId)) {
            $.ajax({
                type: "GET",
                url: "Account/UserName/" + searchId,
                success: function () {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (XMLHttpRequest.status == 409) {
                        swal({
                            title: "出错了！",
                            text: "此用户名已被注册，请更换用户名",
                            type: "error",
                            confirmButtonText: "知道了"
                        });
                    }
                }
            });
        }
    });
    $("#submit").click(function () {
        var UserName = $("#UserName").val();
        var Password = hex_sha256($("#UserName").val() + $("#Password").val());
        var Name = $("#Name").val();
        var PhoneNumber = $("#PhoneNumber").val();

        if (isNullOrEmpty(UserName) ||
                isNullOrEmpty(PassWord) ||
                isNullOrEmpty(Name) ||
                isNullOrEmpty(PhoneNumber)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        }
            var data = {
                "userName": UserName,
                "passWord": passWord,
                "name": Name,
                "phoneNumber":PhoneNumber
            };
            $.ajax({
                type: "POST",
                url: "Accounty/user",
                dataType: "json",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function () {
                    swal({
                        title: "注册成功",
                        text: name + "注册完毕",
                        type: "success",
                        confirmButtonText: "知道了"
                    });
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    if (XMLHttpRequest.status == 201) {
                        swal({
                            title: "注册成功",
                            text: name + "注册完毕",
                            type: "success",
                            confirmButtonText: "知道了"
                        });
                    } else {
                        swal({
                            title: "出错了！",
                            text: "错误信息" + XMLHttpRequest.status,
                            type: "error",
                            confirmButtonText: "知道了"
                        });
                    }
                }
            });

        $("#UserName").val("");
        $("#Password").val("");
        $("#Name").val("");
    })
</script>


</body>
</html>
