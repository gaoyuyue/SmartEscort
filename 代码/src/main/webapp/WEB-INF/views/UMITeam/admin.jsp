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
                    <h5>团队接单管理</h5>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class=" m-b-xs col-lg-8">
                            <select class="input-sm   " title="请选择发布方式" id="theWay">
                                <option value="qq">qq</option>
                                <option value="wechat">微信</option>
                            </select>
                            &nbsp;
                            <select id="packageType" class="input-sm input-s-sm inline" title="请选择快递类型">
                            </select>
                            &nbsp;
                            <select id="school" class="input-sm input-s-sm inline" title="请选择学校">
                            </select>
                            &nbsp;
                            <select id="area" class="input-sm input-s-sm inline" title="请选择区域">
                            </select>
                            &nbsp;
                            <select class="input-sm   " title="请选择订单状态" id="packageStatus">
                                <option value="待领取">待领取</option>
                                <option value="待送达">待送达</option>
                                <option value="已完成">已完成</option>
                            </select>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped" >
                            <thead id="tableTop">
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
    var loadPage=function (pageNumber) {
        $("#tableTop").empty();
        $("#tableTop").append(`
                <tr>
                    <th>发布人</th>
                    <th>手机号码</th>
                    <th>详细地址</th>
                    <th>短信内容</th><th>
                    `+(($("#packageStatus").val() == "待领取")?`发布时间</th><th>操作</th>`:($("#packageStatus").val() == "待送达")?`领取时间</th><th>操作</th>`:`完成时间</th>`)
            +`
                </tr>
            `);
        var updatePackageTable=function (data) {
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#packageList").append(`
                    <tr>
                        <td>`+result.receiverName+`</td>
                        <td>`+result.receiverPhoneNumber+`</td>
                        <td>`+result.addressDetail+`</td>
                        <td>`+result.message+`</td>
                        <td>`+getLocalTime(result.publishTime)+`</td>
                        <td>`+((result.packageStatus === "待领取")?
                        `<a packageId=`+result.id+` href="#" class="getLink">领取</a>`:
                        (result.packageStatus === "待送达")?
                            `<a packageId=`+result.id+` href="#" class="accomplishLink">完成</a>`:``)+`</td>
                    </tr>
                `);
            }
        };
        var updateUMIPackageTable=function (data) {
            var resultList = data["results"];
            for (var i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $("#packageList").append(`
                    <tr>
                        <td>`+result.name+`</td>
                        <td>`+result.phoneNumber+`</td>
                        <td>`+result.detailAddress+`</td>
                        <td>`+result.message+`</td>
                        <td>`+getLocalTime(result.createDate)+`</td>
                        <td>`+ ((result.packageStatus === "待领取")?
                                `<a packageId=`+result.orderNumber+` href="#" class="getULink">领取</a>&nbsp;<a packageId=`+result.orderNumber+` href="#" class="deleteULink">撤销</a>`:
                            (result.packageStatus === "待送达")?
                                `<a packageId=`+result.orderNumber+` href="#" class="accomplishULink">完成</a>&nbsp;<a packageId=`+result.orderNumber+` href="#" class="deleteULink">撤销</a>`:``)
                        +`</td>
                    </tr>
                `);
            }
        };
        if($("#theWay").val() === "qq"){
            Paging("/UMITeam/umiPackageList/packageType/"+$("#packageType").val()+"/areaId/"+$("#area").val()+"/packageStatus/" + $("#packageStatus").val(),"packageList",updateUMIPackageTable,pageNumber,10);
        }else {
            Paging("/UMITeam/packageList/packageType/"+$("#packageType").val()+"/areaId/"+$("#area").val()+"/packageStatus/" + $("#packageStatus").val(),"packageList",updatePackageTable,pageNumber,10);
        }
        $(".getULink").click(function () {
            AjaxPutRequest("/UMITeam/getUMIPackage/packageId/"+$(this).attr("packageId"));
            loadThis();
        });
        $(".accomplishULink").click(function () {
            AjaxPutRequest("/UMITeam/accomplishUMIPackage/packageId/"+$(this).attr("packageId"));
            loadThis();
        });
        $(".deleteULink").click(function () {
            AjaxPutRequest("/UMITeam/deleteUMIPackage/packageId/"+$(this).attr("packageId"));
            loadThis();
        });
        $(".getLink").click(function () {
            AjaxPutRequest("/UMITeam/getPackage/packageId/"+$(this).attr("packageId"));
            loadThis();
        });
        $(".accomplishLink").click(function () {
            AjaxPutRequest("/UMITeam/accomplishPackage/packageId/"+$(this).attr("packageId"));
            loadThis();
        });
    };

    $(document).ready(
        function () {
            loadSchool("school");
            loadArea("area", $("#school").val());
            loadPackageType("packageType");
            loadPage(1);
            $("#packageType").change(function () {
                loadPage(1);
            });
            $("#theWay").change(function () {
                $("#packageStatus").html("");
                if($("#theWay").val()=="wechat"){
                    $("#packageStatus").append(`
                    <option value="待领取">待领取</option>
                    <option value="已撤销">已撤销</option>
                    <option value="待签收">待签收</option>
                    <option value="待送达">待送达</option>
                    <option value="已完成">已完成</option>
            `);
                }else {
                    $("#packageStatus").append(`
                    <option value="待领取">待领取</option>
                    <option value="待送达">待送达</option>
                    <option value="已完成">已完成</option>
            `)
                }
                loadPage(1);
            });
            $("#packageStatus").change(function () {
                loadPage(1);
            });
            $("#school").change(function () {
                loadArea("area",$("#school").val());
                loadPage(1);
            });
            $("#area").change(function () {
                loadPage(1);
            });
        });
</script>
