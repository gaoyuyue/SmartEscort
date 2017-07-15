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
                                <th>昵称</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>学(工)号</th>
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
                <form class="">
                    <label>
                        <input type="radio" name="optionsRadios" id="optionsRadiosOk" value="option1" checked>通过
                    </label>
                    <label>
                    <input type="radio" name="optionsRadios" id="optionsRadiosNo" value="option2">不通过
                </label>
                </form>
            </div>
            <div class="text-center">
            </div>
            <small class="font-bold">
                <div class="modal-footer">
                    <input type="text" class="form-control" id="reason" placeholder="请输入原因" style="display: none;width: 80%;margin-top: -1px;">
                    <button class="btn btn-success Author" name="">提交</button>
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
                $('input:radio[id="optionsRadios2"]:checked')
                $("#optionsRadiosNo").click(function () {
                   $("#reason").css("display","inline");
                });
                $("#optionsRadiosOk").click(function () {
                    $("#reason").css("display","none");
                });
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

        $(".Author").click(function () {
            var status=$('input:radio:checked').val();
            switch (status){
                case "option1":{
                    //通过认证
                    var userName = this["name"];
                    AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/" + "true"+"/reason/"+null);
                    loadThis();
                    $(".sr-only").click();
                    break;
                }
                case "option2":{
                    //不通过
                    var reason=$("#reason").val();
                    var userName = this["name"];
                    if(reason.length<1){
                        alert("请输入不通过审核原因！");
                    }else {
                        AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/" + "false"+"/reason/"+reason);
                        loadThis();
                        $(".sr-only").click();
                        $("#reason").val("");
                    }
                    break;
                }
                default:{
                    alert("请重试！");
                    $(".sr-only").click();
                    $("#reason").val("");
                }
            }
        });

</script>
