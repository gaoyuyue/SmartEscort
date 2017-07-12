<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="shortcut icon" href="assets/img/logo.png">
    <title>校园快递后台管理系统</title>
    <%@include file="admin_css.jsp" %>
</head>
<body class="pace-done">
<div class="pace  pace-inactive"><div class="pace-progress" data-progress-text="100%" data-progress="99" style="width: 100%;">
    <div class="pace-progress-inner"></div>
</div>
    <div class="pace-activity"></div></div>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">

                    <div class="dropdown profile-element" style="text-align: center"> <span>
                                <img alt="image" class="img-circle" src="/assets/img/profile_small.jpg"/>
                                 </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span class="clear">
                                        <span class="block m-t-xs">
                                        <strong class="font-bold" id="userName"></strong>
                                        </span>
                                        <span class="text-muted text-xs block">管理员<b class="caret"></b></span>
                                    </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <li><a href="">修改头像</a>
                            </li>
                            <li><a href="">个人资料</a>
                            </li>
                            <li><a href="">联系我们</a>
                            </li>
                            <li><a href="">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/Account/LogOut">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">
                        <strong>镖</strong>
                    </div>
                </li>
                <li class="li">
                    <a href="#" url="/UserManagement/" class="redirect"><i class="fa fa-users"></i><span class="nav-label">用户管理</span> </a>
                </li>
                <li class="li">
                    <a href="#" url="/VerifyManagement/" class="redirect"><i class="fa fa-check-circle-o"></i> <span class="nav-label">学生认证</span> </a>
                </li>
                <li class="li">
                <a href="#" url="/AddressManagement/" class="redirect"><i class="fa fa-map-marker"></i> <span class="nav-label">区域管理</span> </a>
                </li>
                <li class="li">
                    <a href="#" url="/PackageListManagement/" class="redirect"><i class="fa fa-th-list"></i> <span class="nav-label">任务列表管理</span></a>
                </li>
                <li class="li">
                    <a href="#" url="/CourierCompanyManagement/" class="redirect"><i class="fa fa-truck"></i> <span class="nav-label">快递类型管理</span> </a>
                </li>
                <li class="li">
                    <a href="#" url="/StandardManagement/" class="redirect"><i class="fa fa-street-view"></i> <span class="nav-label">取件收费标准管理</span> </a>
                </li>
                <li class="li">
                    <a href="#" url="/FeedBackManagement/" class="redirect"><i class="fa fa-thumbs-up"></i> <span class="nav-label">用户反馈</span> </a>
                </li>
                <li class="li">
                    <a href="#" url="/UMITeam/admin" class="redirect"><i class="fa fa-tasks"></i> <span class="nav-label">团队接单</span> </a>
                </li>
            </ul>
        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg dashoard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                            class="fa fa-bars"></i> </a>
                    <%--<form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search"
                                   id="top-search">
                        </div>
                    </form>--%>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message"><a href="#" title="返回首页"><i
                                class="fa fa-home"></i></a>欢迎使用智慧镖局后台管理系统</span>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">16</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                                <div class="dropdown-messages-box">
                                    <%--<a href="#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a7.jpg">
                                    </a>--%>
                                    <div class="media-body">
                                        <small class="pull-right">46小时前</small>
                                        <strong>小四</strong> 项目已处理完结
                                        <br>
                                        <small class="text-muted">3天前 2014.11.8</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                    <%--<a href="#" class="pull-left">
                                        <img alt="image" class="img-circle" src="img/a4.jpg">
                                    </a>--%>
                                    <div class="media-body ">
                                        <small class="pull-right text-navy">25小时前</small>
                                        <strong>国民岳父</strong> 这是一条测试信息
                                        <br>
                                        <small class="text-muted">昨天</small>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有消息</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="">
                            <i class="fa fa-bell"></i> <span class="label label-primary">8</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i> 您有16条未读消息
                                        <span class="pull-right text-muted small">4分钟前</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="">
                                    <div>
                                        <i class="fa fa-qq fa-fw"></i> 3条新回复
                                        <span class="pull-right text-muted small">12分钟钱</span>
                                    </div>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    <a href="">
                                        <strong>查看所有 </strong>
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <%--<li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i> 退出
                        </a>
                    </li>--%>
                </ul>

            </nav>
        </div>
        <div id="mainPage">
        </div>
    </div>
</div>
</body>
<%@include file="admin_script.jsp" %>
<%@include file="admin_footer.jsp" %>
<script type="text/javascript">
    bindRedirect();
    var fillUser = function fillUser(data) {
        $("#userName").text(data.name);
    };
    AjaxGetRequest("/UserManagement/UserInfo", fillUser);

    $(".li").click(function () {
        $(".active").removeClass("active");
        $(this).addClass("active");
    });
</script>

</html>
