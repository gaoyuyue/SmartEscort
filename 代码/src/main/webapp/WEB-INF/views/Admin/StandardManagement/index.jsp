<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/4/25
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>取件收费标准管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">新建
                        </button>
                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal2"
                                id="editButton" disabled="disabled">修改
                        </button>
                        <button type="button" class="btn btn-danger" id="deleteButton" disabled="disabled">删除</button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>选择</th>
                                <th>收费标准描述</th>
                                <%--<th>收费标准</th>--%>
                            </tr>
                            </thead>
                            <tbody id="StandardTable">
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
                <h4 class="modal-title">新增快递取件收费标准</h4>
                <small class="font-bold">
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">收费标准描述</label>
                            <div class="col-sm-6">
                                <input type="text"  class="form-control" placeholder="请输入描述"  id="standardDescription">
                                </input>
                            </div>
                        </div>
                    </form>
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
                <h4 class="modal-title">修改快递取件收费标准</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">收费标准描述</label>
                            <div class="col-sm-6">
                                <input type="text"  class="form-control"   id="newStandardDescription">
                                </input>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="updateCancelButton">关闭</button>
                    <button type="button" class="btn btn-primary" id="updateButton">确认修改</button>
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
    function setUnAvailable() {
        $('#editButton').attr('disabled', "true");
        $('#deleteButton').attr('disabled', "true");
    }

    //为checkMe绑定点击事件 重新加载列表后需要重新绑定点击事件
    function CheckMe() {
        setUnAvailable();
        $(".checkMe").click(function () {
            updateButton();
            deleteButton();
        });
    }

    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                    var result = resultList[i];
                    $("#StandardTable").append(
                        "<tr><td>"+
                    "<div class='icheckbox_square-green checked'>" +
                    "<input type='checkbox' class='checkMe' id='" + result.id + "' value='option1'/>" +
                    "</div>" +
                    "</td>" +
                    "<td >"+ result.description +
                    "</td>" +
                        "</tr>"
                    );
            }
        };
        Paging("/StandardManagement/getStandardList", "StandardTable", uploadTable, pageNumber, 10);
        CheckMe();
    };

    //新增
    $("#createButton").click(function () {
        var description = $("#standardDescription").val();
        if (isNullOrEmpty(description)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",

                confirmButtonText: "知道了"
            });
        } else {
            var data={
                description:description
            };
            Post("/StandardManagement/createStandard",data);
            loadThis();
            $("#createCancelButton").click();
        }
        $("#standardDescription").val("");

    });

    //修改时给input设置值
    $("#editButton").click(function () {
        var id = $("input[class='checkMe']:checked").attr("id");
        var thisElement = $("#" + id).parent().parent().next();
        $("#newStandardPrice").val(thisElement.text());
        $("#newStandardDescription").val(thisElement.text());
    });

    //修改
    $("#updateButton").click(function () {
        var standardDescription = $("#newStandardDescription").val();
        var id = $("input[class='checkMe']:checked").attr("id");
        if (isNullOrEmpty(standardDescription)) {
            swal({
                title: "错误",
                text: "必填项不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            var data={
                id:id,
                description:standardDescription
            };
            Put("/StandardManagement/updateStandard",data);
            $("#updateCancelButton").click();
            loadThis();
        }
        setUnAvailable();
    });

    //删除标准
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
                        AjaxDeleteRequest("/StandardManagement/deleteStandard/standardId/" + checkBoxes[i].id);
                    }
                    loadThis();
                    swal({
                        title: "成功",
                        text: "删除完毕",
                        type: "success",
                        confirmButtonText: "知道了"

                    });
                } else {
                    swal("已取消", "未作任何操作", "info");
                    setUnAvailable();
                }
            });
    });

    $(document).ready(
        function () {
            loadPage(1);
        });



</script>
