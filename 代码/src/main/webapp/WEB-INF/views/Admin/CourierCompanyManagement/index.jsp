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
                    <h5>自定义响应式表格</h5>
                    <div class="ibox-tools">
                        <%--<a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>--%>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_basic.html#">选项1</a>
                            </li>
                            <li><a href="table_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <%--<a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>--%>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal5" >新建</button>
                        <button type="button" class="btn btn-warning" id="editButton" disabled="disabled">修改</button>
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
                            <tbody id="">
                            <tr>
                                <td>
                                    <div class="icheckbox_square-green checked"><input
                                            type="checkbox" value="" name="" class=""/>
                                        <%--<ins class="iCheck-helper"
                                             style="top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: rgb(255, 255, 255); border: 0px; opacity: 0;"></ins>--%>
                                    </div>
                                </td>
                                <td>米莫说｜MiMO Show</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal inmodal fade in" id="myModal5" tabindex="-1" role="dialog" aria-hidden="true" style="display: none ; padding-right: 17px;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">新建快递类型</h4>
                <small class="font-bold">这里可以显示副标题。
                </small></div><small class="font-bold">
            <div class="modal-body" align="center">
                <input type="text" placeholder="请输入快递类型名称" class="form-control" name="min" id="content"  style="width: 8cm;">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal" id="createCancelButton">关闭</button>
                <button type="button" class="btn btn-primary" id="createButton">保存</button>
            </div>
        </small></div><small class="font-bold">
    </small></div><small class="font-bold">
</small></div>

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
    var loadPage=function (pageNumber) {
        var uploadTable=function (data) {
            var resultList=data["results"];
            for(var i=0;i<data["totalCount"];i++){
                var result=resultList[i];
                $("#CourierTable").append(
                    "<tr><td>" +
                    "<div class='icheckbox_square-green checked'>" +
                    "<input type='checkbox' class='checkMe' value='" +result.id+ "'/>" +
                    "</div>" +
                    "</td>" +
                    "<td>" + result.companyName+
                    "</td>" +
                    "</tr>"
                )
            }
            CheckMe();
        };
        Paging("/CourierCompanyManagement/getCourierCompanyList","CourierTable",uploadTable,pageNumber,10);
    };
    $(document).ready(
        function () {
            loadPage(1);
        });

    //新增
    $("#createButton").click(function () {
        $("#content").val()
    })

</script>
