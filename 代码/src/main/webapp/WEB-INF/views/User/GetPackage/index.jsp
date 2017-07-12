<%@include file="/user_header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="top" style="background-color:#08ddff">
    <h3 style="color: white">任务列表</h3>
</div>
<div ontouchstart class="weui-panel weui-panel_access weui-pull-to-refresh" style="overflow-y:auto; overflow-x:hidden; width:100%; height:100%;" id="mainDiv">
    <div class="weui-pull-to-refresh__layer">
        <div class='weui-pull-to-refresh__arrow'></div>
        <div class='weui-pull-to-refresh__preloader'></div>
        <div class="down">下拉刷新</div>
        <div class="up">释放刷新</div>
        <div class="refresh">正在刷新</div>
    </div>
    <div class="weui-form-preview">
        <div class="weui-panel__bd" id="packageTable">
        </div>
    </div>
    <div class="weui-loadmore" id="loadingText">
        <i class="weui-loading"></i>
        <span class="weui-loadmore__tips">正在加载</span>
    </div>
</div>

<script>
    $("#mainDiv").pullToRefresh().on("pull-to-refresh", function() {
        pageNumber = 1;
        $("#packageTable").empty();
        Loadings("/User/GetPackage/allList",updateTable, 4,function () {
            $("#mainDiv").pullToRefreshDone();
        });
        $("#loadingText").html(`
            <i class="weui-loading"></i>
            <span class="weui-loadmore__tips">正在加载</span>
        `);
        loading = false;
        $("#mainDiv").infinite();
    });

    var loading = false;
    $("#mainDiv").infinite().on("infinite", function() {
        if(loading) return;
        loading = true;
        Loadings("/User/GetPackage/allList", updateTable, 4,function () {
            loading = false;
        });
    });

    var updateTable = function (data) {
        const results = data.results;
        results.forEach(function (element) {
            $("#packageTable").append(`
                 <a class="packageOne" href="javascript:void(0);" packageId=`+element.id+`>
                    <div class="weui-media-box">
                        <div class="weui-media-box_appmsg">
                            <div class="weui-media-box__hd">
                                <img class="weui-media-box__thumb" src="`+element.delegation.headImageUrl+`" alt="">
                            </div>
                            <div class="weui-media-box__bd">
                                <div class="weui-form-preview__item">
                                    <label style="color: #0d0d0d;font-size: 16px">` + element.delegation.nickName + `</label>
                                    <span style="margin-top: 2px;float: right;color:#cecece;font-size:13px">` + getLocalTime(element.publishTime) +`</span>
                                </div>
                                <ul class="weui-media-box__info">
                                    <li class="weui-media-box__info__meta">`+((element.delegation.sex)?`<i class="fa fa-mars" style="color: #00a2d4"></i>`:`<i class="fa fa-venus" style="color: #BB2B2B"></i>`)+`</li>
                                    <li class="weui-media-box__info__meta">`+element.area.areaName+`</li>
                                    <li class="weui-media-box__info__meta weui-media-box__info__meta_extra">`+element.courierCompany.companyName+`</li>
                                    <li class="weui-media-box__info__meta" style="float: right;color: red;font-size: 14px;font-weight: bold">`+element.price+`</li>
                                </ul>
                            </div>
                        </div>
                        <div class="weui-form-preview__item" style="margin-top: 5px">
                            <label class="weui-form-preview__label" style="font-size: 15px">详细地址</label>
                            <span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">`+element.addressDetail+`</span>
                        </div>
                        <div class="weui-form-preview__item">
                            <label class="weui-form-preview__label" style="font-size: 15px">备注</label>
                            <span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">`+element.note+`</span>
                        </div>
                    </div>
                    <div style="height: 15px;background-color: #eeeeee;"></div>
                </a>
            `);
        });

        $(".packageOne").click(function () {
            const packageId = $(this).attr("packageId");
            $.confirm({
                title: '提示',
                text: '确认领取本任务？',
                onOK: function () {
                    $.ajax({
                        url: "/User/GetPackage/receive/packageId/" + packageId,
                        type: "GET",
                        success: function () {
                            $.toast("领取成功",function () {
                                window.location.reload();
                            });
                        },
                        error: function (XMLHttpRequest) {
                            if (XMLHttpRequest.status === 404) alert("未认证用户不能使用此功能！");
                            else alert("此任务已被接收！");
                        }
                    });
                },
                onCancel: function () {
                    $.toast("取消操作", "cancel");
                }
            });
        });
    };

    $(document).ready(function () {
        $("#getPackage").addClass("weui-bar__item_on");
        Loadings("/User/GetPackage/allList", updateTable, 4,function () {
        });
    });

    var pageNumber = 1;
    var Loadings = function (url,updateTable,pageSize,success) {
        "use strict";
        $.ajax({
            url: url + "/pageNumber/" + pageNumber + "/pageSize/" + pageSize,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var nextPageNumber = data["nextPage"];
                if(data["pageCount"]<=1){
                    $("#mainDiv").destroyInfinite();
                    $("#loadingText").html("没有更多了");
                }
                if (nextPageNumber < pageNumber) {
                    $("#mainDiv").destroyInfinite();
                    $("#loadingText").html("没有更多了");
                    return;
                }
                updateTable(data);
                success();
                pageNumber = pageNumber+1;
            },
            error: function (XMLHttpRequest) {
            }
        });
    };
</script>

<%@include file="/user_footer.jsp" %>