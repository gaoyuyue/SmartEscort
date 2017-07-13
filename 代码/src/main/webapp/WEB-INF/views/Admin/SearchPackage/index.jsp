<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/7/8
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>订单查询</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class=" m-b-xs col-lg-7">
                            <div class="input-group col-sm-5 form-inline" style="position: relative;left: 5px;float:left ">
                                <input type="text" placeholder="请输入订单编号" class="input-sm form-control" id="content"> <span
                                    class="input-group-btn">
                        <button type="button" class="btn btn-sm btn-primary" id="searchPackage"> 搜索</button> </span>
                            </div>
                            <div class=" m-b-xs col-lg-4 form-inline">
                                <select class="input-sm " title="请选择来源" id="theWay">
                                <option value="wechat">微信</option>
                                <option value="qq">qq</option>
                                </select>
                                &nbsp;
                                <select id="school" class="input-sm input-s-sm inline" title="请选择学校">
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead id="tableTop">
                            <tr>

                            </tr>
                            </thead>
                            <tbody id="packageList">
                            </tbody>
                        </table>
                    </div>
                    <ul class="pagination" id="pagination"></ul>
                </div>
            </div>
        </div>

    </div>
</div>
<script>

    $(document).ready(
        function () {
            loadSchool("school");
        });

    var updateTable=function (data) {
        $("#tableTop").empty();

        var resultList = data["results"];
        //根据订单种类加载
        if($("#theWay").val()=="wechat"){

            switch(resultList[0].packageStatus){
                case "待领取": {
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.delegation.name +
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + result.standard.description +
                            '</td>'+
                            '<td>' + getLocalTime(result.publishTime) +
                            '</tr>'
                        )
                    }
                    break;
                }
                case "已撤销": {
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                    <th>结束时间</th>
                    <th>订单结果</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.delegation.name +
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + result.standard.description +
                            '</td>'+
                            '<td>' + getLocalTime(result.publishTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.endTime) +
                            '</td>'+
                            '<td>' + result.orderResult +
                            '</tr>'
                        )
                    }
                    break;
                }
                case "待送达": {
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>接受人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                    <th>领取时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.delegation.name +
                            '</td>' +
                            '<td>' + result.agency.name+
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + result.standard.description +
                            '</td>'+
                            '<td>' + getLocalTime(result.publishTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.receiveTime) +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;
                }
                case "待签收": {
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>接受人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                    <th>领取时间</th>
                    <th>送达时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.delegation.name +
                            '</td>' +
                            '<td>' + result.agency.name+
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + result.standard.description +
                            '</td>'+
                            '<td>' + getLocalTime(result.publishTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.receiveTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.deliveryTime) +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;
                }
                case "已完成": {
                    $("#tableTop").append(`
                <tr>
                   <th>发布人</th>
                                <th>接受人</th>
                                <th>快递类型</th>
                                <th>快递大小</th>
                                <th>发布时间</th>
                                <th>领取时间</th>
                                <th>送达时间</th>
                                <th>结束时间</th>
                                <th>订单结果</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.delegation.name +
                            '</td>' +
                            '<td>' + result.agency.name +
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + result.standard.description +
                            '</td>'+
                            '<td>' + getLocalTime(result.publishTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.receiveTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.deliveryTime) +
                            '</td>'+
                            '<td>' + getLocalTime(result.endTime) +
                            '</td>'+
                            '<td>' + result.orderResult +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;
                }
            }
        }else {
            switch (resultList[0].packageStatus){
                case "待领取":{
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        var theName=result.agency==null?"":result.agency.name;
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.name +
                            '</td>' +
                            '<td>' + theName+
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + "*" +
                            '</td>'+
                            '<td>' + getLocalTime(result.createDate) +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;
                }
                case "待送达":{
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                    <th>领取时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        var theName=result.agency==null?"":result.agency.name;
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.name +
                            '</td>' +
                            '<td>' + theName+
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + "*" +
                            '</td>'+
                            '<td>' + getLocalTime(result.createDate) +
                            '</td>'+
                            '<td>' + getLocalTime(result.receiveDate) +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;
                }
                case "已完成":{
                    $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>快递类型</th>
                    <th>快递大小</th>
                    <th>发布时间</th>
                    <th>领取时间</th>
                <tr>
`);
                    for (var i = 0; i < data["totalCount"]; i++) {
                        var result = resultList[i];
                        var theName=result.agency==null?"":result.agency.name;
                        $("#packageList").append(
                            '<tr>' +
                            '<td >' + result.name +
                            '</td>' +
                            '<td>' + theName+
                            '</td>' +
                            '<td>' + result.courierCompany.companyName +
                            '</td>'+
                            '<td>' + "*" +
                            '</td>'+
                            '<td>' + getLocalTime(result.createDate) +
                            '</td>'+
                            '<td>' + getLocalTime(result.receiveDate) +
                            '</td>'+
                            '<td>' + getLocalTime(result.endDate) +
                            '</td>'+
                            '</tr>'
                        )
                    }
                    break;

                }
                default:{
                    alert("无记录！");
                }
            }

        }
    };
    //查找
    $("#searchPackage").click(function () {
        var content = $("#content").val();
        if(content.length>0){
            if($("#theWay").val()=="wechat"){
                Paging("/SearchPackage/SearchPackage/packageId/" +content+"/schoolId/"+$("#school").val(),"packageList",updateTable,1,1);
            }else{
                Paging("/SearchPackage/SearchUMIPackage/packageId/" +content+"/schoolId/"+$("#school").val(),"packageList",updateTable,1,1);
            }
        }
    })
</script>
