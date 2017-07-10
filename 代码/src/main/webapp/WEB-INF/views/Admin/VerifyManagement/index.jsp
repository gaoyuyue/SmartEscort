<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/21
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<scrip></scrip>
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
                                <th>昵称</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>学(工)号</th>
                                <%--<th>验证</th>--%>
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
<div class="modal inmodal fade in" role="dialog" tabindex="-1" aria-labelledby="addUserModalLabel" id="myModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content animated bounceInRight">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">关闭</span>
                </button>
                <img id="preview" src="" width="300px">
                <h4 class="modal-Name"></h4>
                <h4  class="modal-Id"> </h4>
            </div>
            <small class="font-bold">
                <div class="modal-footer">
                    <button class="btn btn-success Author" name="">通过</button>
                    <button class="btn btn-warning NoAuthor" name="">不通过</button>
                    <%--<button id="cancel" type="button" class="btn btn-white" data-dismiss="modal">关闭</button>--%>
                </div>
            </small>
        </div>
        <small class="font-bold">
        </small>
    </div>
</div>

    <script type="text/javascript">

        var loadPage = function loadPage(pageNumber) {
            var uploadTable = function (data) {
                var resultList = data["results"];
                $("#userTable").empty();
                for (var i = 0; i < resultList.length; i++) {
                    var item = resultList[i];
                    $("#userTable").append(
                        '<tr>' +
                        '<td>' + item.nickName +
                        '</td>' +
                        '<td>' + item.name +
                        '</td>' +
                        '<td>' + item.phoneNumber +
                        '</td>' +
                        '</td>' +
                        '<td>' + item.studentId +
                        '</td>' +
                        '<td><a data-toggle="modal" data-target="#myModal" class="stuCard" name="' + item.userName +
                        '">认证</a></td>' +
//                        <i class="fa fa-search"></i>
//                        '<td><a class="btn btn-success Author" name="' + item.userName +
//                        '">通过</a>&nbsp;<a class="btn btn-warning NoAuthor" name="' + item.userName +
//                        '">不通过</a>' +
                        '</td>' +
                        '</tr>'
                    );
                }
                checkMe();
            };
            Paging("/VerifyManagement/userPageResults/school/" + $("#school option:selected").val(), "userTable", uploadTable, pageNumber, 5);
        };

        //绑定事件
        function checkMe() {
            var pre = document.getElementById("preview");

            //通过认证
            $(".Author").click(function () {
                var userName = this["name"];
                AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/" + "true");
                loadThis();
                $(".sr-only").click();
            });

            //不通过
            $(".NoAuthor").click(function () {
                var userName = this["name"];
                AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/" + "false");
                loadThis();
                $(".sr-only").click();
            });


            //查看图片
            $(".stuCard").click(function () {
                pre.src="";
                var id = this["name"];
                var stuId=$(this).parent().prev().text();
                var stuName=$(this).parent().prev().prev().prev().text();
                AjaxGetRequest("/VerifyManagement/CardImg/userName/" + id, loadImg);
                $(".modal-footer").children().attr("name",id);
                $(".modal-Name").text("姓名："+stuName);
                $(".modal-Id").text("学（工）号："+stuId);
                function loadImg(data) {
                    pre.src = data;
                }
            });
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
