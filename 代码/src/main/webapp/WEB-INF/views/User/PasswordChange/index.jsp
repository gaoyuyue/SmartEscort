<%--
  Created by IntelliJ IDEA.
  User: StevenJack
  Date: 2017/3/26/026
  Time: 18:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    .pwd{width:40px;height:20px;line-height:14px;padding-top:2px;}
    .pwd_f{color:#BBBBBB;}
    .pwd_c{background-color:#F3F3F3;border-top:1px solid #D0D0D0;border-bottom:1px solid #D0D0D0;border-left:1px solid #D0D0D0;}
    .pwd_Weak_c{background-color:#FF4545;border-top:1px solid #BB2B2B;border-bottom:1px solid #BB2B2B;border-left:1px solid #BB2B2B;}
    .pwd_Medium_c{background-color:#FFD35E;border-top:1px solid #E9AE10;border-bottom:1px solid #E9AE10;border-left:1px solid #E9AE10;}
    .pwd_Strong_c{background-color:#3ABB1C;border-top:1px solid #267A12;border-bottom:1px solid #267A12;border-left:1px solid #267A12;}
    .pwd_c_r{border-right:1px solid #D0D0D0;}
    .pwd_Weak_c_r{border-right:1px solid #BB2B2B;}
    .pwd_Medium_c_r{border-right:1px solid #E9AE10;}
    .pwd_Strong_c_r{border-right:1px solid #267A12;}
</style>

<div id="frame">
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">修改密码</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <form action="/Account/Register" method="post" name="form1">
        <div class="weui-cell">
            <div class="weui-cell__hd" style="float: left"><label class="weui-label" for="newPassword">新密码:</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="password" name="newPassword" id="newPassword" placeholder="请输入新密码" onKeyUp="CheckIntensity(this.value)"><tr></tr>
            </div>
        </div>
        <div class="weui-cell">
            <div style="padding-left: 100px;">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr align="center">
                        <td id="pwd_Weak" class="pwd pwd_c"> </td>
                        <td id="pwd_Medium" class="pwd pwd_c pwd_f">无</td>
                        <td id="pwd_Strong" class="pwd pwd_c pwd_c_r"> </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="weui-cell">
            <div class="weui-cell__hd"><label for="password" class="weui-label">确认新密码:</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" type="password" name="passWord" id="reNewPassword" placeholder="请再次输入密码">
            </div>
        </div>

        <div class="weui-cell">
            <div id="msg" style="color:red;"></div>
        </div>
        <div class="weui-btn-area">
            <button type="submit" class="weui-btn weui-btn_primary" id="passwordSubmitButton">确定</button>
        </div>
    </form>
</div>

<script src="/assets/js/sha256.min.js"></script>

<script type="text/javascript">
    /**
     * 验证密码强度
     * @param pwd
     * @constructor
     */
    function CheckIntensity(pwd){
        var Mcolor,Wcolor,Scolor,Color_Html;
        var m=0;
        var Modes=0;
        for(i=0; i<pwd.length; i++){
            var charType=0;
            var t=pwd.charCodeAt(i);
            if(t>=48 && t <=57){charType=1;}
            else if(t>=65 && t <=90){charType=2;}
            else if(t>=97 && t <=122){charType=4;}
            else{charType=4;}
            Modes |= charType;
        }
        for(i=0;i<4;i++){
            if(Modes & 1){
                m++;
            }
            Modes>>>=1;
        }
        if(pwd.length<=4){
            m=1;
        }
        if(pwd.length<=0){
            m=0;
        }
        switch(m){
            case 1 :
                Wcolor="pwd pwd_Weak_c";
                Mcolor="pwd pwd_c";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="弱";
                break;
            case 2 :
                Wcolor="pwd pwd_Medium_c";
                Mcolor="pwd pwd_Medium_c";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="中";
                break;
            case 3 :
                Wcolor="pwd pwd_Strong_c";
                Mcolor="pwd pwd_Strong_c";
                Scolor="pwd pwd_Strong_c pwd_Strong_c_r";
                Color_Html="强";
                break;
            default :
                Wcolor="pwd pwd_c";
                Mcolor="pwd pwd_c pwd_f";
                Scolor="pwd pwd_c pwd_c_r";
                Color_Html="无";
                break;
        }
        document.getElementById('pwd_Weak').className=Wcolor;
        document.getElementById('pwd_Medium').className=Mcolor;
        document.getElementById('pwd_Strong').className=Scolor;
        document.getElementById('pwd_Medium').innerHTML=Color_Html;
    }

    /**
     * 判断密码两次是否输入正确
     * @returns {boolean}
     */
    function checkpwd() {
        var p1 = $("#newPassword").val();
        var p2 = $("#reNewPassword").val();
        if(p1 ==""){
            alert("请输入密码");
            document.form1.password.focus();
        }
        if(p1!=p2){
            document.getElementById("msg").innerHTML = "两次输入密码不一致，请重新输入";
            document.getElementById("submit").disabled =true;
        } else{
            document.getElementById("msg").innerHTML = "";
            document.getElementById("submit").disabled =false;
        }
    }

    /**
     * 给确认密码一个焦点事件
     */
    $("#reNewPassword").focus(function () {
        $(this).val("");
    });

</script>
<%@include file="/user_footer.jsp"%>
