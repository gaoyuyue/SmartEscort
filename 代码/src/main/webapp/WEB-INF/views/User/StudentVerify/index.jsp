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
    #fileUpload{
        display: none;
    }
    #CardUpload{
        background-color: #eeeeee;
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
                    <div class="weui-cell" style="border-bottom: 1px solid #ebebeb">
                        您好，请上传学生证照片进行认证。
                    </div>
                <div class="weui-cell" style="border-bottom: 1px solid #ebebeb">
                    <div class="weui-cell__ft" >请确保学号及姓名清晰可见</div>
                </div>

                <%--<form>--%>
                <div>

                    <div  id="CardUpload">
                         <img src="/assets/img/goback.png"></img>
                    </div>
                    <input type="file" id="fileUpload" accept="image/gif,image/jpg,image/png,image/jpeg">
                </div>
                <%--</form>--%>

            </div>
        </div>
    </div>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">确认提交</a>
    </div>


<script type="text/javascript">

    $("#CardUpload").click(function () {
        $("#fileUpload").click();
    })






</script>



<%@include file="/user_footer.jsp"%>