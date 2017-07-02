<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/23
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<script src="/assets/js/fastclick.js"></script>

<%--学生认证页面--%>
<div >
    <div id="top">
        <a id="title" >学生认证</a>
    </div>
    <div class="page list js_show">
        <div class="page__bd">
            <div class="weui-cells">
                <div class="" style="border-bottom: 1px solid #ebebeb;padding: 10px">
                    <div>您好，请上传学生证照片进行认证。</div>
                    <div style="color: grey">请确保学号及姓名清晰可见</div>

                </div>
                <form enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/User/StudentVerify/upLoad">
                    <div>
                        <br>
                        <div id="cardUpload" style="text-align: center;">
                            <img id="previewer" src="/assets/img/unmaned.png" style="width: 250px;height: 250px"/>
                        </div>
                        <input type="file" style="display: none" id="filechooser" accept="image/gif,image/jpg,image/png,image/jpeg">
                        <br>
                    </div>
                    <div class="weui-btn-area" disabled="true">
                        <input class="weui-btn weui-btn_primary" type="submit" onclick="
                        if ($('#file').this==null){
                            alert('未选择照片！');
                            return false;
                        }"/>
                    </div>
                </form>
            </div>
        </div>
    </div>



<script type="text/javascript">
    $("#cardUpload").click(function () {
        $("#filechooser").click();
    });
    
//    function loadFile(target) {
////        $(".weui-btn").removeClass("disabled");
//        var fileSize = target.files[0].size;
//        var size = fileSize / 1024;
//        if(size>5000){
//            alert("照片不能大于5M！");
//            target.value="";
//            $("input").empty();
//        }else {
//            var name = target.value;
//            var fileName = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
//            if (fileName != "jpg" && fileName != "jpeg" && fileName != "png" && fileName != "gif") {
//                alert("不支持的文件格式！");
//                target.value = "";
//                $("input").empty();
//            }else {
//                var fileNames = name.substring(name.lastIndexOf("\\") + 1).toLowerCase();
//                alert("已选择图片"+fileNames);
//
//            }
//        }
//
//
//    }


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
    filechooser.value = '';
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



<%@include file="/user_footer.jsp"%>