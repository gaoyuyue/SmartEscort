<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/25
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>区域管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <button type="button" class="btn btn-w-m btn-primary" data-toggle="modal"
                                data-target="#myModal1">添加学校
                        </button>
                        <button type="button" class="btn btn-w-m btn-info" data-toggle="modal" data-target="#myModal2" id="addArea">
                            添加区域
                        </button>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>学校名称</th>
                                <th>区域名称</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="AddressTable">
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" id="pagination"></ul>
                </div>

            </div>
        </div>
    </div>
</div>
<%--弹窗新增学校--%>
<div class="modal inmodal fade in" id="myModal1" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">新建学校名称</h4>
                <small class="font-bold">这里可以显示副标题
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body" align="center">
                    <form class="form-horizontal" role="form">

                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">学校</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="请输入学校名称" name="schoolName"
                                       id="schoolName">

                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="schoolCancelButton">取消</button>
                    <button type="button" class="btn btn-primary" id="schoolCreateButton">确认</button>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
    <small class="font-bold">
    </small>
</div>
<%--弹窗新增学校的区域--%>
<div class="modal inmodal fade in" id="myModal2" tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title">新增学校区域</h4>
                <small class="font-bold">这里可以显示副标题
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body" align="center">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">选择学校</label>
                            <div class="col-sm-6">
                                <select class="form-control" id="school" data-placeholder="选择学校">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">区域</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="请输入区域" name="areaName"
                                       id="areaName">

                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal" id="areaCancelButton">关闭</button>
                    <button type="button" class="btn btn-primary" id="areaCreateButton">保存</button>
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

    //绑定点击事件
    var deleteMe = function deleteMe() {
        $(".md-delete").click(function () {
            var id = this["id"];
            var idArr = id.split("/");
            var areaId = idArr[0];
            var schoolId = idArr[1];
            AjaxDeleteRequest("/AddressManagement/deleteAreaBySchool/schoolId/" + schoolId + "/areaId/" + areaId);
            loadThis();
        });
    };

    //分页加载页面
    var loadPage = function (pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            $("#AddressTable").empty();
            for (var i = 0; i < resultList.length; i++) {
                var result = resultList[i];
                $("#AddressTable").append(
                    '<tr>' +
                    '<td >' + result.school.schoolName +
                    '</td>' +
                    '<td>' + result.areaName +
                    '</td>' +
                    '<td><a class="md-delete" id="' + result.id + "/" + result.school.id +
                    '">删除</a></td>' +
                    '</tr>'
                );
            }
            deleteMe();
        };
        Paging("/AddressManagement/getAddressList", "AddressTable", uploadTable, pageNumber, 5);

    };

    //新增学校
    $("#schoolCreateButton").click(function () {
        var schoolName = $("#schoolName").val();
        if (isNullOrEmpty(schoolName)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            AjaxPostRequest("/AddressManagement/createSchool/schoolName/" + schoolName);
            $("#schoolCancelButton").click();
            loadThis();
        }
        $("#schoolName").val("");
    });

    //点击新增区域加载学校
    $("#addArea").click(function () {
        loadSchool("school");
    });

    //新增区域
    $("#areaCreateButton").click(function () {

        var areaName = $("#areaName").val();
        var schoolId = $("#school").val();
        if (isNullOrEmpty(areaName) || isNullOrEmpty(schoolId)) {
            swal({
                title: "错误",
                text: "不可为空",
                type: "error",
                confirmButtonText: "知道了"
            });
        } else {
            AjaxPostRequest("/AddressManagement/createArea/areaName/"+ areaName +"/schoolId/" + schoolId);
            $("#areaCancelButton").click();
        }
        loadThis();
        $("#areaName").val("");
    });

    $(document).ready(
        function () {
            loadPage(1);
        }
    );


</script>
