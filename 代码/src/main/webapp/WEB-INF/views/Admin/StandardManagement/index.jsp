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

                        <div class="col-sm-3" style="float: right" >
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
                                <th>收费标准描述</th>
                                <th>收费标准</th>
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
                <h4 class="modal-title">新增快递取件收费标准</h4>
                <small class="font-bold">这里可以显示副标题。
                </small>
            </div>
            <small class="font-bold">
                <div class="modal-body">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">收费标准</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" placeholder="请输入区域" name="areaName" id="price">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label" style="font-size: medium">收费标准描述</label>
                            <div class="col-sm-6">
                                <textarea style="margin: 0px 0px 0px 0px; height: 54px; width: 404px;"  class="form-control" placeholder="请输入详细描述收费标准"  id="description">
                                </textarea>
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

    //f分页加载页面
    var loadPage=function (pageNumber) {
        var success=function (data) {
            console.log(data)
        };
        AjaxGetRequest("/StandardManagement/getStandard",success);
    }
</script>
