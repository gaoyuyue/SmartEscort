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

<style>
    #file{
        display: none;
    }
    #CardUpload{
        /*background-color: #eeeeee;*/
        text-align: center;
    }
</style>
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
                        <div  id="CardUpload">
                             <img id="preview" src="/assets/img/unmaned.png"/>
                        </div>
                        <input type="file" id="file" accept="image/gif,image/jpg,image/png,image/jpeg" onchange="loadFile(this)">
                    </div>
                    <div class="weui-btn-area" disabled="true">
                        <input class="weui-btn weui-btn_primary" type="submit"/>
                    </div>
                </form>
            </div>
        </div>
    </div>



<script type="text/javascript">
$(".weui-btn").click(function () {
   if ($("#file").this==null){
       alert("!");

   }
});

    $("#CardUpload").click(function () {
        $("#file").click();
    });
    
    function loadFile(target) {
//        $(".weui-btn").removeClass("disabled");
        var fileSize = target.files[0].size;
        var size = fileSize / 1024;
        if(size>5000){
            alert("照片不能大于5M！");
            target.value="";
            $("input").empty();
        }else {
            var name = target.value;
            var fileName = name.substring(name.lastIndexOf(".") + 1).toLowerCase();
            if (fileName != "jpg" && fileName != "jpeg" && fileName != "png" && fileName != "gif") {
                alert("不支持的文件格式！");
                target.value = "";
                $("input").empty();
            }else {
                var fileNames = name.substring(name.lastIndexOf("\\") + 1).toLowerCase();
                alert("已选择图片"+fileNames);

            }
        }


    }


</script>



<%@include file="/user_footer.jsp"%>