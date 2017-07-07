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
                <img id="test" src="" width="300px">
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
                if (item.stuCardUrl!=null) {
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
                        '<td><a class="stuCard" name="'+item.userName+
                        '"><i class="fa fa-search"></i></a></td>'+
                        '<td><a class="btn btn-success Author" name="'+item.userName+
                        '">通过</a>&nbsp;<a class="btn btn-warning NoAuthor" name="'+item.userName+
                        '">不通过</a>' +
                        '</td>' +
                        '</tr>'
                    )
                }
            }
            checkMe();
        };
        Paging("/VerifyManagement/userPageResults/school/" + $("#school option:selected").val(), "userTable", uploadTable, pageNumber, 5);
    };

    //绑定事件
    function checkMe() {
        var pre = document.getElementById("test");

        //通过认证
        $(".Author").click(function () {
            var userName = this["name"];
            AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/"+"true");
            loadThis();
        });

        //不通过
        $(".NoAuthor").click(function () {
            var userName = this["name"];
            AjaxPutRequest("/VerifyManagement/Author/userName/" + userName + "/isPass/"+"false");
            loadThis();
        });

        //查看图片
        $(".stuCard").mouseover(function () {
            var id=this["name"];
            AjaxGetRequest("/VerifyManagement/CardImg/userName/"+id,loadImg);
            function loadImg(data) {
                pre.src=data;
            }
        })
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
