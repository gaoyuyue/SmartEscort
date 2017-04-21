<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/21
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>用户管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-2 m-b-xs">
                            <select id="school" class="input-sm form-control input-s-sm inline">
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>用户名</th>
                                <th>昵称</th>
                                <th>手机号</th>
                                <th>学校</th>
                                <th>学工号</th>
                                <th>信誉积分</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="userTable">
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" id="pagination"></ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var modifyUser = function modifyUser() {
        $(".modifyUser").click(function () {
            var id = this["id"];
            var arr = id.split("_");
            var userName = arr[0];
            var stage = arr[1];
            console.log(userName);
            console.log(stage);
            swal(
                {
                    title: "确定？",
                    text: "请再次确认你的操作",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "确定",
                    cancelButtonText: "取消",
                    closeOnConfirm: false,
                    closeOnCancel: false
                },
                function (isConfirm) {
                    if(isConfirm){
                        AjaxPutRequest("/UserManagement/disabledUser/userName/" + userName + "/stage/" + stage);
                        swal({
                            title: "成功",
                            text: "操作成功",
                            type: "success",
                            confirmButtonText: "知道了"
                        });
                        var pageNumber = $(".pagination .active")[0].innerText;
                        loadPage(pageNumber);
                    }else {
                        swal("已取消", "未作任何操作", "info");
                    }
                }
            )
        })
    };

    var loadPage = function loadPage(pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            $("#userTable").empty();
            for (var i = 0; i < resultList.length; i++) {
                var item = resultList[i];
                if (item.deleted == false) {
                    $("#userTable").append(
                        '<tr>' +
                        '<td>' + item.userName +
                        '</td>' +
                        '<td>' + item.name +
                        '</td>' +
                        '<td>' + item.phoneNumber +
                        '</td>' +
                        '<td>' + item.school.schoolName +
                        '</td>' +
                        '<td>' + item.studentId +
                        '</td>' +
                        '<td>' + item.integration +
                        '</td>' +
                        '<td>' + "正常" +
                        '</td>' +
                        '<td> <a class="modifyUser" id="' + item.userName + "_true" +
                        '">禁用</a></td>' +
                        '</tr>'
                    )
                } else {
                    $("#userTable").append(
                        '<tr>' +
                        '<td>' + item.userName +
                        '</td>' +
                        '<td>' + item.name +
                        '</td>' +
                        '<td>' + item.phoneNumber +
                        '</td>' +
                        '<td>' + item.school.schoolName +
                        '</td>' +
                        '<td>' + item.studentId +
                        '</td>' +
                        '<td>' + item.integration +
                        '</td>' +
                        '<td>' + "已禁用" +
                        '</td>' +
                        '<td> <a class="modifyUser" id="' + item.userName + "_false" +
                        '">取消禁用</a></td>' +
                        '</tr>'
                    )
                }
            }
        };
        Paging("/UserManagement/userPageResults/school/" + $("#school option:selected").val(), "userTable", uploadTable, pageNumber, 10);
        modifyUser();
    };

    $(document).ready(
        function () {
            loadSchool("school");
            loadPage(1);
            $("#school").change(function () {
                loadPage(1)
            })
        }
    )


</script>
