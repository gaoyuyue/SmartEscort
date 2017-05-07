<%--#e15400  color--%>
    <%@include file="/user_header.jsp"%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
<script type="text/javascript" src="/assets/js/classie.js"></script>
<script type="text/javascript" src="/assets/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="/assets/css/demo/component.css">


<div id="top" style="background-color: #eeeeee">
    <div class="form-group">
        <input type="text" class="form-control" style="display: inline;width: 70%" value="search">
        <span class="input-group-addon fa fa-search"  style="display: inline;"></span>
        <span >
             <a id="filter-btn" ><img src="/assets/img/filter.png" ></a>
        </span>
    </div>
</div>

<div class="weui-panel weui-panel_access">
    <div class="weui-form-preview">
        <div class="weui-panel__bd">
            <a href="javascript:void(0);" class="weui-media-box weui-media-box_appmsg confirmation">
                <div style="clear: both">
                    <div class="weui-media-box__hd">
                        <img class="weui-media-box__thumb" src="/assets/img/SF.jpg">
                    </div>
                    <div class="weui-form-preview__item">
                        <span class="weui-form-preview__value" >高语越</span>
                        <%--<span class="weui-form-preview__value">男</span>--%>
                        <img src="/assets/img/boy.png" width="51" height="51">

                    </div>
                </div>
                <div style="clear: both">
                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">发布日期</label>
                        <span class="weui-form-preview__value">2016-4-18</span>
                    </div>

                    <div class="weui-form-preview__item">
                        <label class="weui-form-preview__label">区域</label>
                        <span class="weui-form-preview__value">梅园</span>
                    </div>
                    <div class="weui-form-preview__item" id="packageSize">
                        <label class="weui-form-preview__label">大小</label>
                        <span class="weui-form-preview__value" >大（有自行车辣么大）</span>
                    </div>

                    <div class="weui-form-preview__item" id="price">
                        <label class="weui-form-preview__label">价格</label>
                        <span class="weui-form-preview__value" >24元</span>
                    </div>
                </div>
            </a>
        </div>

    </div>
</div>

<%--筛选菜单--%>
<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right" id="cbp-spmenu-s2">

    <h3>筛选</h3>
    <ul id="areaName">
        <li class="menuHeader"><strong>区域</strong></li>
    </ul>
    <ul>
        <li class="menuHeader"><strong>快递类型</strong></li>
    </ul>
    <ul>
        <li class="menuHeader"><strong>包裹大小</strong></li>
    </ul>


    <button id="Ok" class="weui-btn weui-btn_default" style="padding: 1px">确定</button>

</nav>
<%--<div id="filterpanel" style="background-color: #eeeeee">--%>


    <%--<strong >区域</strong>--%>
    <%--<ul id="areaName">--%>
        <%--<li>梅园</li>--%>
    <%--</ul>--%>
    <%--<br>--%>
    <%--<br>--%>
    <%--<br>--%>

    <%--<strong >快递类型</strong>--%>
    <%--<ul id="CourierCompany" >--%>
        <%--<li>顺丰速运</li>--%>
        <%--<li>百世汇通</li>--%>
        <%--<li>圆通快递</li>--%>
        <%--<li>京东快递</li>--%>
    <%--</ul>--%>
    <%--<br>--%>
    <%--<br>--%>
    <%--<br>--%>
    <%--<strong >包裹大小</strong>--%>
    <%--<ul id="pakageSize">--%>
        <%--<li>大</li>--%>
        <%--<li>中</li>--%>
        <%--<li>小</li>--%>
    <%--</ul><br>--%>
    <%--<br>--%>
    <%--<br>--%>
    <%--<hr>--%>
    <%--<div class="btn btn-warning btn-block" id="submitDiv">--%>
        <%--<a href="javascript:void(0);" id="filterSubmit" >确认</a>--%>
    <%--</div>--%>
<%--</div>--%>

<script>
    $(document).ready(function () {
        $("#getPackage").addClass("weui-bar__item_on");
    });


    //订单详情
    $(".weui-form-preview__item").on('click',function () {
        var packageSize = $("#packageSize").val();
        var packageType = "";
        var price = $("#price").val();
        var remakers = "";

        $.confirm({
            title: '确定要接单吗？',
            text:   '大小'+packageSize+'<br/>'+
            '类型'+packageType+'<br/>'+
            '价格'+price+'<br/>' +
            '备注:'+'<br/>'+
            '<textarea rows="5" cols="10"></textarea>',
            onOK: function () {
                //点击确认
            },
            onCancel: function () {
            }
        });
    });

    //加载区域
    function loadAreaName(){
        var uploadTable = function(data) {
            var resultList = data["results"];
            console.log(resultList);
            for (i = 0; i < data["totalCount"]; i++) {
                var result = resultList[i];
                $jq("#areaName").append(
                    "<li>"+"result.areaName"+
                    "</li>"
                );
            }
        };
        Paging("/User/GetPackage/getAreaName","areaName",uploadTable, pageNumber, 10);
    }

    //滑动菜单
    var menuRight = document.getElementById( 'cbp-spmenu-s2' );
     var   showRight = document.getElementById( 'filter-btn' );
        showRight.onclick = function() {
            classie.toggle( this, 'active' );
            classie.toggle( menuRight, 'cbp-spmenu-open' );
        };
    Ok.onclick=function(){
        classie.toggle( menuRight, 'cbp-spmenu-open' );
    }
</script>

<%@include file="/user_footer.jsp"%>