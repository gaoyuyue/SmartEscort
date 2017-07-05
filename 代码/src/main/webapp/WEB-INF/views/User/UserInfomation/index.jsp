<%--
  Created by IntelliJ IDEA.
  User: StevenJack
  Date: 2017/3/25/025
  Time: 21:05
  To change this template use File | Settings | File Templates.
  设置页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">设置</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>
    <div class="page list js_show">
        <div class="page__bd">
            <div class="weui-cells">
                <a class="open-popup" >
                    <div class="weui-cell Prompt_bubble" style="border-bottom: 1px solid #ebebeb">
                        <div class="weui-cell__bd">
                            <p style="font-family: SimSun">昵称</p>
                        </div>
                        <div class="weui-cell__ft" id="userName" title="修改用户名，请联系客服">
                        </div>
                        <span class="tooltip">
                                <span class="top">
                                </span>
                                <span class="middle">修改用户名，请联系客服
                                </span>
                                <span class="bottom">
                                </span>
                        </span>
                    </div>
                </a>
                <a class="open-popup" data-target="#updateName">
                    <div class="weui-cell" style="border-bottom: 1px solid #ebebeb">
                        <div class="weui-cell__bd">
                            <p style="font-family: SimSun">姓名</p>
                        </div>
                        <div class="weui-cell__ft" id="name"></div>
                    </div>
                </a>
                <a class="open-popup" data-target="#updatePhoneNumber">
                    <div class="weui-cell" style="border-bottom: 1px solid #f0f0f0">
                        <div class="weui-cell__bd">
                            <p style="font-family: SimSun">手机号</p>
                        </div>
                        <div class="weui-cell__ft" id="phoneNumber"></div>
                    </div>
                </a>
                    <div class="weui-cell" style="border-bottom: 1px solid #ebebeb">
                        <div class="weui-cell__bd">
                            <p style="font-family: SimSun">性别</p>
                        </div>
                        <div class="weui-cell__ft sex">男</div>
                    </div>
            </div>

            <div class="weui-cells">
                <%--<a class="weui-cell weui-cell_access open-popup" data-target="#updatePassword">--%>
                    <%--<div class="weui-cell__bd">--%>
                        <%--<p style="font-family: SimSun">修改密码</p>--%>
                    <%--</div>--%>
                    <%--<div class="weui-cell__ft">--%>
                    <%--</div>--%>
                <%--</a>--%>
                <a class="weui-cell open-popup" href="/User/StudentVerify/" id="isdisabled">
                    <div class="weui-cell__bd">
                        <p style="font-family: SimSun;color: black">学生认证</p>
                    </div>
                    <div class="weui-cell__ft" id="isVerify" style="color: red"></div>
                </a>
            </div>
        </div>
    </div>

    <%--修改姓名--%>
    <div id="updateName" class='weui-popup__container'>
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal">
            <div class="top_other">
                <span class="list_other"><a class="close-popup refresh_page">取消</a></span>
                <span><a class="logo_other show-warning update">保存</a></span>
            </div>
            <div class="weui-cell" style="border-bottom: 1px solid #cbcbcb">
                <div class="weui-cell__bd">
                    <input class="weui-input updatetextfocus" id="updateName_other" type="text">
                </div>
            </div>
        </div>
    </div>
    <%--修改手机号--%>
    <div id="updatePhoneNumber" class='weui-popup__container'>
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal">
            <div class="top_other">
                <span class="list_other"><a class="close-popup refresh_page">取消</a></span>
                <span><a class="logo_other show-warning update">保存</a></span>
            </div>
            <div class="weui-cell" style="border-bottom: 1px solid #cbcbcb">
                <div class="weui-cell__bd">
                    <input class="weui-input updatetextfocus" id="updatePhoneNumber_other" type="number">
                </div>
            </div>
        </div>
    </div>
    <%--&lt;%&ndash;修改密码&ndash;%&gt;--%>
    <%--<div id="updatePassword" class='weui-popup__container'>--%>
        <%--<div class="weui-popup__overlay"></div>--%>
        <%--<div class="weui-popup__modal">--%>
            <%--<div class="top_other">--%>
                <%--<span class="list_other"><a class="close-popup refresh_page">取消</a></span>--%>
                <%--<span><a class="logo_other" id="editPassWord">保存</a></span>--%>
            <%--</div>--%>
            <%--<div class="weui-cell">--%>
                <%--<div class="weui-cell__bd">--%>
                    <%--<input class="weui-input updatetextfocus" type="password" id="newPassword" placeholder="请输入新密码" onKeyUp="CheckIntensity(this.value)"><tr></tr>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="weui-cell">--%>
                <%--<div style="padding-left: 100px;">--%>
                    <%--<table border="0" cellpadding="0" cellspacing="0">--%>
                        <%--<tr align="center">--%>
                            <%--<td id="pwd_Weak" class="pwd pwd_c"> </td>--%>
                            <%--<td id="pwd_Medium" class="pwd pwd_c pwd_f">无</td>--%>
                            <%--<td id="pwd_Strong" class="pwd pwd_c pwd_c_r"> </td>--%>
                        <%--</tr>--%>
                    <%--</table>--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="weui-cell">--%>
                <%--<div class="weui-cell__bd">--%>
                    <%--<input class="weui-input" type="password" id="reNewPassword" placeholder="请再次输入密码">--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="weui-cell">--%>
                <%--<div id="msg" style="color:red;"></div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
</div>

<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    <%--嵌套页面--%>
    $(document).on("open", ".weui-popup-modal", function() {
        console.log("open popup");
    }).on("close", ".weui-popup-modal", function() {
        console.log("close popup");
    });
    $(".updatetextfocus").focus(function () {
        $(this).val("");
    });
    $(".refresh_page").click(function () {
       window.location.href = "/User/UserInfomation/";
    });
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>

<%--修改用户信息--%>
<script>
    var loadPage=function loadPage() {
        var success = function success(data) {
            $("#userName").empty();
            $("#name").empty();
            $("#phoneNumber").empty();

            $("#userName").text(data.nickName);
            $("#name").text(data.name);
            $("#phoneNumber").text(data.phoneNumber);

            var updateName = data.name;
            var updatePhoneNumber = data.phoneNumber;
            $("#updateName_other").val(updateName);
            $("#updatePhoneNumber_other").val(updatePhoneNumber);
            if(data.authed == true){
                $("#isVerify").text("已认证");
                $("#isdisabled").removeAttr('href');
            } else {
                $("#isVerify").text("未认证");
            }
        }
        Get("/User/UserInfomation/current",success);
    };
    /**
     * 修改
     */
    $(".update").click(function () {
        var updateName_other = $("#updateName_other").val();
        var updatePhoneNumber_other = $("#updatePhoneNumber_other").val();
        if(
                isNullOrEmpty(updateName_other) ||
                isNullOrEmpty(updatePhoneNumber_other)
        ){
            $(document)
                    .on('click', '.show-warning', function() {
                        $.toptip('内容不能为空', 'warning');
                    })
        } else {
            $.ajax({
                type: "Put",
                url: "/User/UserInfomation/name/" + updateName_other + "/phoneNumber/" +updatePhoneNumber_other,
                success: function () {
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                }
            });
            cancelClick();
        }
    });
    //点击取消，并重新加载个人信息
    var cancelClick=function () {
        $(".close-popup").click(
                function () {
                    loadPage()
                }
        );
        $(".close-popup").trigger("click");
    };

    $(document).ready(function () {
        loadPage()
    });
</script>

<%--<script type="text/javascript">--%>
    <%--/**--%>
     <%--* 验证密码强度--%>
     <%--* @param pwd--%>
     <%--* @constructor--%>
     <%--*/--%>
    <%--function CheckIntensity(pwd){--%>
        <%--var Mcolor,Wcolor,Scolor,Color_Html;--%>
        <%--var m=0;--%>
        <%--var Modes=0;--%>
        <%--for(i=0; i<pwd.length; i++){--%>
            <%--var charType=0;--%>
            <%--var t=pwd.charCodeAt(i);--%>
            <%--if(t>=48 && t <=57){charType=1;}--%>
            <%--else if(t>=65 && t <=90){charType=2;}--%>
            <%--else if(t>=97 && t <=122){charType=4;}--%>
            <%--else{charType=4;}--%>
            <%--Modes |= charType;--%>
        <%--}--%>
        <%--for(i=0;i<4;i++){--%>
            <%--if(Modes & 1){--%>
                <%--m++;--%>
            <%--}--%>
            <%--Modes>>>=1;--%>
        <%--}--%>
        <%--if(pwd.length<=4){--%>
            <%--m=1;--%>
        <%--}--%>
        <%--if(pwd.length<=0){--%>
            <%--m=0;--%>
        <%--}--%>
        <%--switch(m){--%>
            <%--case 1 :--%>
                <%--Wcolor="pwd pwd_Weak_c";--%>
                <%--Mcolor="pwd pwd_c";--%>
                <%--Scolor="pwd pwd_c pwd_c_r";--%>
                <%--Color_Html="弱";--%>
                <%--break;--%>
            <%--case 2 :--%>
                <%--Wcolor="pwd pwd_Medium_c";--%>
                <%--Mcolor="pwd pwd_Medium_c";--%>
                <%--Scolor="pwd pwd_c pwd_c_r";--%>
                <%--Color_Html="中";--%>
                <%--break;--%>
            <%--case 3 :--%>
                <%--Wcolor="pwd pwd_Strong_c";--%>
                <%--Mcolor="pwd pwd_Strong_c";--%>
                <%--Scolor="pwd pwd_Strong_c pwd_Strong_c_r";--%>
                <%--Color_Html="强";--%>
                <%--break;--%>
            <%--default :--%>
                <%--Wcolor="pwd pwd_c";--%>
                <%--Mcolor="pwd pwd_c pwd_f";--%>
                <%--Scolor="pwd pwd_c pwd_c_r";--%>
                <%--Color_Html="无";--%>
                <%--break;--%>
        <%--}--%>
        <%--document.getElementById('pwd_Weak').className=Wcolor;--%>
        <%--document.getElementById('pwd_Medium').className=Mcolor;--%>
        <%--document.getElementById('pwd_Strong').className=Scolor;--%>
        <%--document.getElementById('pwd_Medium').innerHTML=Color_Html;--%>
    <%--}--%>
    <%--/**--%>
     <%--* 给确认密码一个焦点事件--%>
     <%--*/--%>
    <%--$("#reNewPassword").focus(function () {--%>
        <%--$(this).val("");--%>
        <%--$("#msg").html("");--%>
    <%--});--%>
<%--</script>--%>

<%--&lt;%&ndash;修改密码&ndash;%&gt;--%>
<%--<script src="/assets/js/sha256.min.js"></script>--%>
<%--<script>--%>
    <%--$("#editPassWord").click(function () {--%>
        <%--var edit = function success(data) {--%>
            <%--var userNameId = data.userName;--%>
            <%--var newPassword = $("#newPassword").val();--%>
            <%--var reNewPassword = $("#reNewPassword").val();--%>
            <%--var passWord = null;--%>
            <%--if(newPassword != reNewPassword){--%>
                <%--$("#msg").html("两次输入密码不一致，请重新输入");--%>
                <%--$("#editPassWord").disabled = true;--%>
            <%--} else {--%>
                <%--$("#editPassWord").disabled = false;--%>
                <%--passWord = hex_sha256(userNameId + newPassword);--%>
                <%--$.ajax({--%>
                    <%--type:"Put",--%>
                    <%--url:"/User/UserInfomation/userName/" + userNameId +"/password/" +passWord,--%>
                    <%--success:function () {--%>
                    <%--},--%>
                    <%--error: function (XMLHttpRequest, textStatus, errorThrown) {--%>
                    <%--}--%>
                <%--});--%>


                <%--$("#newPassword").val("");--%>
                <%--$("#reNewPassword").val("");--%>
                <%--cancelClick();--%>
            <%--}--%>
        <%--}--%>
        <%--Get("/User/UserInfomation/current",edit);--%>
    <%--});--%>
<%--</script>--%>

<%@include file="/user_footer.jsp"%>
