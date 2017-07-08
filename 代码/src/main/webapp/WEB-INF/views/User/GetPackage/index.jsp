<%--#e15400  color--%>
<%@include file="/user_header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="/assets/js/classie.js"></script>
<script type="text/javascript" src="/assets/js/modernizr.custom.js"></script>
<script type="text/javascript">
    $(document.body).pullToRefresh().on("pull-to-refresh", function() {
        setTimeout(function() {
            $(document.body).pullToRefreshDone();
        }, 2000);
    });/*
    $(function() {
        FastClick.attach(document.body);
    });*/
</script>
<div class="searchNav" id="top" >
    <%--<input type="text" placeholder="Search...">--%>
    <%--<img src="/assets/img/Search.png" class="searchA">--%>
    <img src="/assets/img/filter.png" id="filter-btn">
</div>
<div ontouchstart class="weui-panel weui-panel_access " >
    <div class="weui-form-preview" id="packageTable">
    </div>
</div>

<%--筛选菜单--%>
<div class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2" style="OVERFLOW-Y: auto;height: auto">

    <div>
        <h4>筛选</h4>
        <div class="weui-cells">
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label class="weui-label">区域</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <option value="1">中国</option>
                        <option value="2">美国</option>
                        <option value="3">英国</option>
                    </select>
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label class="weui-label">快递类型</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <option value="1">申通</option>
                        <option value="2">申通</option>
                        <option value="3">申通</option>
                    </select>
                </div>
            </div>
            <div class="weui-cell weui-cell_select weui-cell_select-after">
                <div class="weui-cell__hd">
                    <label class="weui-label">包裹大小</label>
                </div>
                <div class="weui-cell__bd">
                    <select class="weui-select" name="select2">
                        <option value="1">大</option>
                        <option value="2">中</option>
                        <option value="3">小</option>
                    </select>
                </div>
            </div>
            <div style="float: right">
                <button id="reSet" class="weui-btn weui-btn_mini weui-btn_primary" style="background-color: #FF6905">重置
                </button>
                <button id="Ok" class="weui-btn weui-btn_mini weui-btn_primary" style="background-color: #FF6905">确定
                </button>
                &nbsp;
            </div>

        </div>
    </div>

</div>

<script>
    $(document).ready(function () {
//        tryTime = 0;
        $("#getPackage").addClass("weui-bar__item_on");
    });


    //订单详情
    //    $(".weui-form-preview__item").on('click', function () {
    //        var packageSize = $("#packageSize").val();
    //        var packageType = "";
    //        var price = $("#price").val();
    //        var remakers = "";
    //
    //        $.confirm({
    //            title: '确定要接单吗？',
    //            text: '大小' + packageSize + '<br/>' +
    //            '类型' + packageType + '<br/>' +
    //            '价格' + price + '<br/>' +
    //            '备注:' + '<br/>' +
    //            '<textarea rows="5" cols="10"></textarea>',
    //            onOK: function () {
    //                //点击确认
    //            },
    //            onCancel: function () {
    //            }
    //        });
    //    });
    //
    //    //获取
    //    $("#filter-btn").click(function () {
    //
    //        var areaList = function (data) {
    //            for (var i = 0; i < data.length; i++) {
    //                $("#areaList").append(
    //                    "<li>" + data[i] +
    //                    "</li>");
    //            }
    //        };
    //        var packageTypeList = function (data) {
    //            for (var i = 0; i < data.length; i++) {
    //                $("#packageType").append(
    //                    "<li>" + data[i] +
    //                    "</li>");
    //            }
    //        };
    //        var standardList = function (data) {
    //            for (var i = 0; i < data.length; i++) {
    //                $("#standard").append(
    //                    "<li>" + data[i] +
    //                    "</li>");
    //            }
    //        };
    //        if (tryTime == 0) {
    //            Get("/User/GetPackage/courierList", packageTypeList);
    //            Get("/User/GetPackage/standardList", standardList);
    //            Get("/User/GetPackage/areaList", areaList);
    //            tryTime++;
    //        }
    //
    //    });
    //
    //
    //    //滑动菜单
    var menuRight = document.getElementById('cbp-spmenu-s2');
    var showRight = document.getElementById('filter-btn');
    showRight.onclick = function () {
        classie.toggle(this, 'active');
        classie.toggle(menuRight, 'cbp-spmenu-open');
    };
    Ok.onclick = function () {
        classie.toggle(menuRight, 'cbp-spmenu-open');
    };



    $("#standard").click(function () {
        this.addClass("adds");
    });


    var updateTable = function (data) {
        const results = data.results;
        var prefix = "/assets/img/";
        var suffix = ".jpg";
        results.forEach(function (element) {
            $("#packageTable").append(
                `<div +class="weui-panel__bd">
                   <a href="#" class="weui-media-box weui-media-box_appmsg confirmation packageOne" packageId=` + element.id + `>
                       <div style="clear: both">
                          <div class="weui-media-box__hd">
                               <img class="weui-media-box__thumb" src=` + prefix + element.courierCompany.companyName + suffix + `>
                           </div>
                           <div class="weui-form-preview__item">
                               <span class="weui-form-preview__value" >` + element.delegation.nickName + `</span>
                               <%--<span class="weui-form-preview__value">男</span>--%>
                               <img +src="/assets/img/boy.png" width="51" height="51">
                           </div>
                       </div>
                       <div style="clear: both">
                           <div class="weui-form-preview__item">
                               <label class="weui-form-preview__label">发布日期</label>
                               <span class="weui-form-preview__value">` + element.publishTime + `</span>
                          </div>
                           <div class="weui-form-preview__item">
                               <label class="weui-form-preview__label">区域</label>
                               <span class="weui-form-preview__value">` + element.area.areaName + `</span>
                           </div>
                           <div class="weui-form-preview__item" id="packageSize">
                             <label class="weui-form-preview__label">大小</label>
                                   <span class="weui-form-preview__value" >` + element.standard.description + `</span>
                                        </div>
                       <div class="weui-form-preview__item" id="price">
                               <label class="weui-form-preview__label">价格</label>
                               <span class="weui-form-preview__value" >` + element.standard.price + `</span>
                           </div>
                </div>
                </a>
                </div>
                    <hr>
            `);
        });

        $(".packageOne").click(function () {
            const packageId = $(this).attr("packageId");
            console.log(packageId);
            $.ajax({
                url: "/User/GetPackage/receive/packageId/" + packageId,
                type: "GET",
                success: function () {
                    window.location.reload();
                },
                error: function (XMLHttpRequest) {
                    if (XMLHttpRequest.status === 404) alert("未认证用户不能使用此功能！");
                    else alert("此任务已被接收！");
                }
            });
        });
    };

    $(document).ready(function () {
        Loadings("/User/GetPackage/allList", updateTable, 10);
    });

    var pageNumber = 0;
    var Loadings = function (url, updateTable, pageSize) {
        "use strict";
        $.ajax({
            url: url + "/pageNumber/" + pageNumber + "/pageSize/" + pageSize,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var nextPageNumber = data["nextPage"];
                if (nextPageNumber <= pageNumber) {
                    // $("#loadingText").html("没有更多了");
                    return;
                }
                updateTable(data);
                pageNumber = nextPageNumber;
            },
            error: function (XMLHttpRequest) {

            }
        });
    };
</script>

<%@include file="/user_footer.jsp" %>