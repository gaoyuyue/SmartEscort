<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/26
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户反馈管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-3" style="float: right">
                            <%--<div class="input-group">--%>
                                <%--<input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span--%>
                                    <%--class="input-group-btn">--%>
                                        <%--<button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <div class="row">
                                    <th class="">用户名</th>
                                    <th class="">反馈内容</th>
                                    <th class="">反馈时间</th>
                                    <th><button class="btn btn-danger ">删除</button></th>
                                 </div>
                            </tr>
                            </thead>
                            <tbody id="FeedBack">
                            </tbody>
                        </table>
                    </div>
                </div>
                <ul class="pagination" id="pagination"></ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
