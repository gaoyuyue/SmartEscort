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
                                    <th><button class="btn btn-danger " id="deleteFeedBack">删除</button></th>
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
<script>
    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            console.log(resultList);
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#FeedBack").append(
                    "<tr>"+
                    "<td>" + result.user +
                    "</td>" +
                    "<td>" + result.content +
                    "</td>"+
                    "<td>" + result.submitTime +
                    "</td>"+
                    "</tr>"
                );

            }

        };
        Paging("/FeedBackManagement/getFeedBack", "FeedBack", uploadTable, pageNumber, 10);
    };


    //点击删除
    $("#deleteFeedBack").click(function() {
        swal({
                title: "确定？",
                text: "你确定删除吗？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                cancelButtonText: "取消",
                closeOnConfirm: false,
                closeOnCancel: false
            },
            function (isConfirm) {
                if (isConfirm) {
                    var checkBoxes = $("input[class='checkMe']:checked");
                    for (var i = 0; i < checkBoxes.length; i++) {
                        AjaxDeleteRequest("/FeedBackManagement/delete/FeedBack/id/" + checkBoxes[i].id);
                    }
                    swal({
                        title: "成功",
                        text: "删除完毕",
                        type: "success",
                        confirmButtonText: "知道了"
                    });
                    //重新设置为不可点击
                    setUnAvaliable();
                    var pageNumber = $(".pagination .active")[0].innerText;
                    loadPage(pageNumber);
                } else {
                    swal("已取消", "未作任何操作", "info");
                }
            });
    });

    $(document).ready(
        function () {
            loadPage(1);
        });
</script>
</html>
