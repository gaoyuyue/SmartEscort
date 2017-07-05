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
                    <h5>学生认证管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-2 m-b-xs">
                            <select id="school" class="input-sm input-s-sm inline">

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
                                <th>学工号</th>
                                <th>验证</th>
                                <%--<th>信誉积分</th>--%>
                                <%--<th>状态</th>--%>
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

    var loadPage = function loadPage(pageNumber) {
        var uploadTable = function (data) {
            var resultList = data["results"];
            $("#userTable").empty();
            for (var i = 0; i < resultList.length; i++) {
                var item = resultList[i];
                if (item.authed == false&&item.stuCardUrl!=null) {
                    $("#userTable").append(
                        '<tr>' +
                        '<td>' + item.userName +
                        '</td>' +
                        '<td>' + item.name +
                        '</td>' +
                        '<td>' + item.phoneNumber +
                        '</td>' +
                        '</td>' +
                        '<td>' + item.studentId +
                        '</td>' +
                        '<td>' + "!" +
                        '</td>' +
                        '<td><a onclick="Author(this.id)"  class="btn btn-success Author" id="'+item.userName+
                        '">通过</a>&nbsp;<a onclick="NoAuthor(this.id)"  class="btn btn-warning" id="'+
                        '">不通过</a></td>' +
                        '</tr>'
                    )
                }
            }
        };
        Paging("/UserManagement/userPageResults/school/" + $("#school option:selected").val(), "userTable", uploadTable, pageNumber, 10);
    };


    //绑定事件
    function checkMe() {
        $(".Author").click(function () {
            var id=
        })
    }

    //是否认证
    function Author(id) {
        alert(id);
        var userName = id;
        AjaxPutRequest("/VerifyManagement/Authored/userName/" + userName);
        swal({
            title: "成功",
            text: "操作成功",
            type: "success",
            confirmButtonText: "知道了"
        });
        loadThis();
    }


    function NoAuthor(id) {
        alert("Developing!");
    }

    $(document).ready(
        function () {
            loadSchool("school");
            loadPage(1);
            $("#school").change(function () {
                loadPage(1)
            })
        }
    );

</script>
