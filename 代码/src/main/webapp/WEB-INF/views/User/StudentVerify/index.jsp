<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/23
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>管理收货地址</title>

    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>
    <script src="/app/js/mobile.utils.js"></script>

    <!-- 引入 WeUI -->
    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link href="/assets/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

</head>
<body style="background-color: #eeeeee">
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.location.href='/User/PersonalCenter/'"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">学生认证</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
    <div class="page list js_show">
        <div class="page__bd">
            <div class="weui-cells">
                <div class="" style="border-bottom: 1px solid #ebebeb;padding: 10px">
                    <div>您好，请上传学生证照片进行认证。</div>
                    <div style="color: grey">请确保学号及姓名清晰可见</div>

                </div>
                <form method="post" action="${pageContext.request.contextPath }/User/StudentVerify/upLoad">
                    <div>
                        <br>
                        <div id="cardUpload" style="text-align: center;">
                            <img id="previewer" src="/assets/img/unmaned.png" style="width: 250px;height: 250px"/>
                        </div>
                        <input type="file" style="display: none" id="filechooser">
                        <br>
                    </div>
                    <input type="hidden" id="dataUrl" name="dataUrl"/>
                    <div class="weui-btn-area" disabled="true">
                        <input class="weui-btn weui-btn_primary" type="submit" onclick="if(filechooser.files.length === 0){alert('请选择图片！');return false;}"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$("#cardUpload").click(function () {
    $("#filechooser").click();
});

//图片预览
var filechooser = document.getElementById('filechooser');
var previewer = document.getElementById('previewer');

// 200 KB 对应的字节数
var maxsize = 200 * 1024;

filechooser.onchange = function() {
    var files = this.files;
    var file = files[0];

    // 接受 jpeg, jpg, png 类型的图片
    if (!/\/(?:jpeg|jpg|png)/i.test(file.type)) return;

    var reader = new FileReader();
    reader.onload = function() {
        var result = this.result;
        var img = new Image();

        // 如果图片小于 200kb，不压缩
        if (result.length <= maxsize) {
            toPreviewer(result);
            return;
        }

        img.onload = function() {
            var compressedDataUrl = compress(img, file.type);
            toPreviewer(compressedDataUrl);
            img = null;
        };

        img.src = result;
    };

    reader.readAsDataURL(file);
};

function toPreviewer(dataUrl) {
    previewer.src = dataUrl;
    $("#dataUrl").val(dataUrl);
}

function compress(img, fileType) {
    var canvas = document.createElement("canvas");
    var ctx = canvas.getContext('2d');

    var width = img.width;
    var height = img.height;

    canvas.width = width;
    canvas.height = height;

    ctx.fillStyle = "#fff";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.drawImage(img, 0, 0, width, height);

    // 压缩
    var base64data = canvas.toDataURL(fileType, 0.75);
    canvas = ctx = null;

    return base64data;
}

</script>
</body>

