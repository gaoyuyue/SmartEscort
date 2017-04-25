<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/25
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>快递类型管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">新建
                        </button>
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"
                                id="editButton" disabled="disabled">修改
                        </button>
                        <button type="button" class="btn btn-danger" id="deleteButton" disabled="disabled">删除</button>

                        <div class="col-sm-3" style="float: right">
                            <div class="input-group">
                                <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span
                                    class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>选择</th>
                                <th>快递名称</th>
                            </tr>
                            </thead>
                            <tbody id="CourierTable">
                            </tbody>
                        </table>
                    </div>
                </div>
                <ul class="pagination" id="pagination"></ul>
            </div>
        </div>
    </div>
</div>
<%--弹窗新增--%>
<div class="modal inmodal fade in" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">新建快递类型</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body" align="center">
                    <input type="text" placeholder="请输入快递类型名称" class="form-control" name="min" id="content" style="
                width: 8cm;">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="createCancelButton">关闭</button>
                    <button type="button" class="btn btn-primary" id="createButton">保存</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>
<%--弹窗修改--%>
<div class="modal inmodal fade in" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">新建快递类型</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body" align="center">
                    <input type="text" placeholder="请输入快递类型名称" class="form-control" name="min" id="updateDescription" style="
                width: 8cm;">
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="updateCancelButton">取消</button>
                    <button type="button" class="btn btn-primary" id="updateSubmitButton">确认</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>

<script type="text/javascript">
    function updateButton() {
        if ($("input[class='checkMe']:checked").length == 1) {
            $('#editButton').removeAttr("disabled");
        } else {
            $('#editButton').attr('disabled', "true");
        }
    }
    function deleteButton() {
        if ($("input[class='checkMe']:checked").length) {
            $('#deleteButton').removeAttr("disabled");
        } else {
            $('#deleteButton').attr('disabled', "true");
        }
    }

    //让这两个button不可用
    function setUnAvaliable() {
        $('#editButton').attr('disabled', "true");
        $('#deleteButton').attr('disabled', "true");
    }

    //为checkMe绑定点击事件 重新加载列表后需要重新绑定点击事件
    function CheckMe() {
        $(".checkMe").click(function () {
            updateButton();
            deleteButton();
        });
    }

    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            console.log(resultList);
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#CourierTable").append(
                    "<tr><td>" +
                    "<div class='icheckbox_square-green checked'>" +
                    "<input type='checkbox' class='checkMe' id='" + result.id + "' value='option1'/>" +
                    "</div>" +
                    "</td>" +
                    "<td>" + result.companyName +
                    "</td>" +
                    "</tr>"
                );
                CheckMe();
            }

        };
        Paging("/CourierCompanyManagement/getCourierCompanyList", "CourierTable", uploadTable, pageNumber, 10);
    };

    //新增
    $("#createButton").click(function () {
        var content = $("#content").val();
        if (isNullOrEmpty(content)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",

                confirmButtonText: "知道了"
            });
        } else {

            AjaxPostRequest("/CourierCompanyManagement/createCourier/companyName/" + $("#content").val());

            $("#createCancelButton").click();
            var pageNumber = $(".pagination .active")[0].innerText;
            loadPage(pageNumber);
        }
        $("#content").val("");
    });

    //修改时给input设置值
    $("#editButton").click(function () {
        var id = $("input[class='checkMe']:checked").attr("id");
        var thisElement = $("#" + id).parent().parent().next();
        $("#updateDescription").val(thisElement.text());
    });

    //修改
    $("#updateSubmitButton").click(function () {
        var updateDescriptionVal = $("#updateDescription").val();
        var id = $("input[class='checkMe']:checked").attr("id");
        if (isNullOrEmpty(updateDescriptionVal)) {
            swal({
                title: "错误",
                text: "必填项不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            AjaxPutRequest("/CourierCompanyManagement/updateCourierCompany/id/" + id + "/updateDescription/" + updateDescriptionVal);
            $("#updateCancelButton").click();
            var pageNumber = $(".pagination .active")[0].innerText;
            loadPage(pageNumber);
        }
        setUnAvaliable();
    });

    //删除
    $('#deleteButton').click(function () {
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
                        AjaxDeleteRequest("/CourierCompanyManagement/deleteCourierCompany/id/" + checkBoxes[i].id);
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
