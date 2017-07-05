<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/3/21
  Time: 16:02
  To change this template use File | Settings | File Templates.
  发布任务页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<link href="/assets/css/jquery-weui.min.css" rel="stylesheet" type="text/css">
<div id="addressTable" style="width: 100%;background-color: #ffffff">

</div>

<%--<HR style="width: 100%" color=#E57E2A SIZE=5>--%>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">包裹大小</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageSize" placeholder="请选择包裹大小" type="text" value="">
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__hd"><label class="weui-label">快递类型</label></div>
        <div class="weui-cell__bd">
            <input class="weui-input" id="packageType" placeholder="请选择快递类型" type="text" value="">
        </div>
    </div>
</div>

<div class="weui-cells">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="price" class="weui-input" type="text" placeholder="请输入价格（元）">
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <input id="note" class="weui-input" type="text" placeholder="请输入备注信息">
        </div>
    </div>
</div>

<div class="weui-cells weui-cells_form">
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <textarea class="weui-textarea" id="message" placeholder="短信内容" rows="4"></textarea>
        </div>
    </div>
</div>

<div class="weui-btn-area weui-cells_form">
    <a class="weui-btn weui-btn_warn" href="javascript:postPackage()" id="showTooltips">发布</a>
</div>

<script src="/assets/js/jquery-weui.min.js"></script>
<script src="/assets/js/fastclick.js"></script>
<script src="/app/js/mobile.utils.js"></script>
<script>
    $(document).ready(function () {
        $("#postPackage").addClass("weui-bar__item_on");
        Get("/User/PostPackage/addressAndCache",getData);
        Get("/User/PostPackage/standardList",getStandard);
        Get("/User/PostPackage/courierList",getCourier);
    });

    function postPackage() {
        var data = {
            addressDetail:$("#cacheLink").attr("detail"),
            receiverPhoneNumber:$("#cacheLink").attr("phoneNumber"),
            receiverName:$("#receiverName").attr("receiverName"),
            area:{
                id:$("#cacheLink").attr("areaId")
            },
            standard:{
                description:$("#packageSize").val()
            },
            courierCompany:{
                companyName:$("#packageType").val()
            },
            price:$("#price").val(),
            note:$("#note").val(),
            message:$("#message").val()
        };
        $.ajax({
            url:"/User/PostPackage/",
            type:"POST",
            contentType: "application/json",
            data: JSON.stringify(data),
            success:function () {
                window.location.href = "/User/PostPackage/success";
            },
            error:function (XMLHttpRequest) {
                if(XMLHttpRequest.status === 404){
                    alert("未认证用户不能使用该功能！");
                }else {
                    window.location.href = "/User/PostPackage/failure";
                }
            }
        });
    }

    $(function() {
        FastClick.attach(document.body);
    });

    const getStandard = function (data) {
        $("#packageSize").select({
            title: "选择包裹大小",
            items: data
        });
    };

    const getCourier = function (data) {
        $("#packageType").select({
            title: "选择快递类型",
            items: data
        });
    };

    const getData = function (data) {
        if (data.hasCache){
            $("#packageSize").val(data.packageSize);
            $("#packageType").val(data.packageType);
            $("#price").val(data.price);
            $("#note").val(data.note);
            $("#message").val(data.message);
        }
        if (data.address == null){
            $("#addressTable").append(
                `<a class="weui-cell_access" href="/User/PostPackage/addAddress" id="cacheLink">
                    <label class="weui-cell weui-check__label">
                        <div style="float: left;width: 10%">
                            <div class="address_icon">
                            </div>
                        </div>
                        <div style="width: 80%;text-align: center" class="weui-cell__bd">
                            <span >+  </span>
                            <span >添加收货地址</span>
                        </div>
                         <div class="weui-cell__ft" style="width: 5%">
                         </div>
                    </label>
                </a>
                `
            );
        }else {
            $("#addressTable").append(
                `<a class="weui-cell_access" href="/User/PostPackage/selectAddress" id="cacheLink" receiverName="`
                +data.address.receiverName+`" phoneNumber="`+data.address.phoneNumber+`" areaId="`
                +data.address.area.id+`" detail="`+data.address.detail+`">
                    <label class="weui-cell weui-check__label">
                        <div style="float: left;width: 10%">
                            <div class="address_icon">
                            </div>
                        </div>
                      <div style="width: 80%" class="weui-cell__bd" >
                         <div>
                            <span >`+data.address.receiverName+`</span>
                            <span > </span>
                            <span style="float: right">`+data.address.phoneNumber+`</span>
                        </div>
                        <div>
                            <span>`+data.address.area.areaName+`</span>
                            <span>`+data.address.detail+`</span>
                        </div>
                      </div>
                      <div class="weui-cell__ft" style="width: 5%">
                      </div>
                    </label>
                </a>`
            );
        }
        $("#cacheLink").click(function () {
            var data = {
                packageSize:$("#packageSize").val(),
                packageType:$("#packageType").val(),
                price:$("#price").val(),
                note:$("#note").val(),
                message:$("#message").val()
            };
            Post("/User/PostPackage/cache",data,function () {
            });
        });
    };

</script>
<%@include file="/user_footer.jsp"%>