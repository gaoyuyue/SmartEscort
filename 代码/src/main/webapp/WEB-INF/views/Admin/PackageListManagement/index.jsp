<%--
  Created by IntelliJ IDEA.
  User: hujian
  Date: 2017/3/24
  Time: 21:06
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
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                        <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><a href="table_basic.html#">选项1</a>
                            </li>
                            <li><a href="table_basic.html#">选项2</a>
                            </li>
                        </ul>
                        <a class="close-link">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-5 m-b-xs">
                            <select class="input-sm form-control input-s-sm inline" title="choose" id="packageStatus">
                                <option value="0">请选择订单类型</option>
                                <option value="1">待领取</option>
                                <option value="2">已领取</option>
                                <option value="3">已撤销</option>
                                <option value="3">待签收</option>
                                <option value="3">待评价</option>
                                <option value="3">已评价</option>
                            </select>
                        </div>
                        <div class="col-sm-4 m-b-xs">
                            <div data-toggle="buttons" class="btn-group">
                                <label class="btn btn-sm btn-white">
                                    <input type="radio" id="option1" name="options">天</label>
                                <label class="btn btn-sm btn-white active">
                                    <input type="radio" id="option2" name="options">周</label>
                                <label class="btn btn-sm btn-white">
                                    <input type="radio" id="option3" name="options">月</label>
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="input-group">
                                <input type="text" placeholder="请输入关键词" class="input-sm form-control"> <span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead>
                            <tr>
                                <th>发布人</th>
                                <th>接受人</th>
                                <th>快递类型</th>
                                <th>快递大小</th>
                                <th>发布时间</th>
                                <th>执行时间</th>
                                <th>完成时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="packageList">
                            <tr>
                                <td> </td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>
<script>
    var loadPage=function (pageNumber) {
        var updateTable=function (data) {
            console.log(data);
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                    $("#packageList").append(
                        '<tr>' +
                        '<td >' + result.delegation.userName +
                        '</td>' +
                        '<td>' + result.agency.userName+
                        '</td>' +
                        '<td>' + result.courierCompany.companyName +
                        '</td>'+
                        '<td>' + result.standard.description +
                        '</td>'+
                        '<td>' + result.publishTime +
                        '</td>'+
                        '<td>' + result.beginTime +
                        '</td>'+
                        '<td>' + result.endTime +
                        '</td>'+
                        '<td><a class="md-delete" id="' + result.id+
                        '">删除</a></td>' +
                        '</tr>'
                    )
                }
            };
        Paging("/PackageListManagement/PackageList/","packageList",updateTable,pageNumber,10);
//        Paging("/PackageListManagement/PackageList/" + $("#packageStatus option:selected").val(),"packageList",updateTable,pageNumber,10);
        deleteOne();
    };

    //删除订单
    function deleteOne() {
        $(".md-delete").click(function () {
            var id = this["id"];
            AjaxDeleteRequest("/PackageListManagement/deletePackage/id/" + id);
            var pageNumber = $(".pagination .active")[0].innerText;
            loadPage(pageNumber);
        });
    }

    $(document).ready(
        function () {
            loadPage(1);
            $("#packageStatus").change(function () {
                loadPage(1);
            })
        });


</script>
