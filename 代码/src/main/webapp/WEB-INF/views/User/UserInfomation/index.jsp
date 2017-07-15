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
                <a class="open-popup" data-target="#updateName" id="unUpdate">
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
                        <div class="weui-cell__ft sex" id="sex"></div>
                    </div>
            </div>

            <div class="weui-cells">
                <a class="weui-cell open-popup" data-target="#updateSchool">
                    <div class="weui-cell__bd">
                        <p style="font-family: SimSun;color: black">学校</p>
                    </div>
                    <div class="weui-cell__ft" id="school"></div>
                </a>
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
                    <input class="weui-input" id="updateName_other" type="text">
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
                    <input class="weui-input" id="updatePhoneNumber_other" type="number">
                </div>
            </div>
        </div>
    </div>
    <%--修改学校--%>
    <div id="updateSchool" class='weui-popup__container'>
        <div class="weui-popup__overlay"></div>
        <div class="weui-popup__modal">
            <div class="top_other">
                <span class="list_other"><a class="close-popup refresh_page">取消</a></span>
                <span><a class="logo_other show-warning update_school">保存</a></span>
            </div>
            <div class="weui-cell" style="border-bottom: 1px solid #cbcbcb">
                <div class="weui-cell__bd">
                    <input class="weui-input schoolNameList" id="updateSchool_other" type="text">
                </div>
            </div>
        </div>
    </div>
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
    $(".refresh_page").click(function () {
       window.location.href = "/User/UserInfomation/";
    });
    $(document).ready(function () {
        $("#personalCenter").addClass("weui-bar__item_on");
    });
</script>

<script type="text/javascript">
    var success = function (data) {
        $(".schoolNameList").select({
            title: "选择区域",
            items: data
        });
    };
    $(document).ready(function () {
        Get("/User/ManageAddress/schoolNameList",success);
    });
</script>

<%--修改用户信息--%>
<script>
    var loadPage=function loadPage() {
        var success = function success(data) {
            $("#userName").empty();
            $("#name").empty();
            $("#phoneNumber").empty();
            $("#sex").empty();
            $("#school").empty();

            $("#userName").text(data.nickName);
            $("#name").text(data.name);
            $("#phoneNumber").text(data.phoneNumber);
            $("#school").text(data.school.schoolName)
            if(data.sex == false){
                $("#sex").text("女");
            } else {
                $("#sex").text("男");
            }

            var updateName = data.name;
            var updatePhoneNumber = data.phoneNumber;
            var updateSchool = data.school.schoolName;
            $("#updateName_other").val(updateName);
            $("#updatePhoneNumber_other").val(updatePhoneNumber);
            $("#updateSchool_other").val(updateSchool);
            if(data.authStatus === "已认证"){
                $("#isVerify").text("已认证");
                $("#isdisabled").removeAttr('href');
                $("#unUpdate").removeAttr('data-target');
            }else if(data.authStatus === "审核中"){
                $("#isVerify").text("审核中");
                $("#isdisabled").removeAttr('href');
                $("#unUpdate").removeAttr('data-target');
            } else{
                $("#isVerify").text("未认证");
            }
        }
        Get("/User/UserInfomation/current",success);
    };
    /**
     * 修改手机和姓名
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
                        window.location.href = "/User/UserInfomation/";
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
                cancelClick();
        }
    });
    /**
     * 修改学校
     */
    $(".update_school").click(function () {
        var updateSchool_other = $("#updateSchool_other").val();
        if(
            isNullOrEmpty(updateSchool_other)
        ){
            $(document)
                .on('click', '.show-warning', function() {
                    $.toptip('内容不能为空', 'warning');
                })
        } else {
            $.confirm("修改学校后，需要重新认证！", "提示", function() {
                $.ajax({
                    type: "Put",
                    url: "/User/UserInfomation/school/" + updateSchool_other,
                    success: function () {
                        window.location.href = "/User/UserInfomation/";
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                    }
                });
                cancelClick();
            }, function() {

            });

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

<%@include file="/user_footer.jsp"%>
