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
    <%--<script src="/assets/js/jquery-2.1.1.min.js"></script>--%>
    <link rel="stylesheet" href="/assets/css/mobile.css">
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
                        <table class="table table-striped" style="table-layout: fixed">
                            <thead>
                            <tr>
                                <div class="row">
                                    <th width="15%">用户名</th>
                                    <th width="30%">反馈内容</th>
                                    <th width="20%">反馈时间</th>
                                    <th >选择</th>
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

<div class="modal  fade" tabindex="-1" role="dialog" id="modal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h2 class="modal-title" id="myModalLabel">
                   <b> 反馈内容</b>
                </h2>
            </div>
            <div class="modal-body">
                <p id="feedDetail" style="font-size: large">

                </p>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
            </div>
        </div>
    </div>
</div>

</body>
<script>
    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            resultList = data["results"];
            console.log(resultList);
            for (i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#FeedBack").append(
                    "<tr>"+
                    "<td>" + result.user.userName +
                    "</td>" +
                    "<td class='feedContent active avoidOverflow' data-toggle='modal' data-target='#modal' onclick='feedBackDetail(this.innerText)' " +
                    "title='点击查看内容'>" +result.content +
                    "</td>"+
                    "<td>" + result.submitTime +
                    "</td><td>"+
                    "<div class='icheckbox_square-green checked'>" +
                    "<input type='checkbox' class='checkMe' id='" + result.id + "' value='option1'/>" +
                    "</div>" +
                    "</td>"+
                    "</tr>"
                );


            }
            CheckMe();setUnAvaliable()
        };
        Paging("/FeedBackManagement/getFeedBack", "FeedBack", uploadTable, pageNumber, 10);
    };




    function deleteButton() {
        if ($("input[class='checkMe']:checked").length) {
            $('#deleteFeedBack').removeAttr("disabled");
        } else {
            $('#deleteFeedBack').attr('disabled', "true");
        }
    }

    //让button不可用
    function setUnAvaliable() {
        $('#deleteFeedBack').attr('disabled', "true");
    }

    //为checkMe绑定点击事件 重新加载列表后需要重新绑定点击事件
    function CheckMe() {
        $(".checkMe").click(function () {
            deleteButton();
        });
    }

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
                        AjaxDeleteRequest("/FeedBackManagement/deleteFeedBack/id/" + checkBoxes[i].id);
                    }
                    swal({
                        title: "成功",
                        text: "删除完毕",
                        type: "success",
                        confirmButtonText: "知道了"
                    });

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

    function feedBackDetail(a){
        $("#feedDetail").text(a);
    }




</script>
</html>
