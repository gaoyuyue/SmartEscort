<%--#e15400  color--%>
<%@include file="/user_header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="searchNav" id="top" >
    <img src="/assets/img/filter.png" id="filter-btn">
</div>
<div ontouchstart class="weui-panel weui-panel_access " >
    <div class="weui-form-preview">
        <div class="weui-panel__bd" id="packageTable">
            <%--<a href="javascript:void(0);">--%>
                <%--<div class="weui-media-box">--%>
                    <%--<div class="weui-media-box_appmsg">--%>
                        <%--<div class="weui-media-box__hd">--%>
                            <%--<img class="weui-media-box__thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="weui-media-box__bd">--%>
                            <%--<div class="weui-form-preview__item">--%>
                                <%--<label style="color: #0d0d0d;font-size: 16px">标题标题</label>--%>
                                <%--<span style="margin-top: 2px;float: right;color:#cecece;font-size:13px">7月10日</span>--%>
                            <%--</div>--%>
                            <%--<ul class="weui-media-box__info">--%>
                                <%--<li class="weui-media-box__info__meta"><i class="fa fa-mars" style="color: #00a2d4"></i></li>--%>
                                <%--<li class="weui-media-box__info__meta">梅园</li>--%>
                                <%--<li class="weui-media-box__info__meta weui-media-box__info__meta_extra">申通</li>--%>
                            <%--</ul>--%>
                            <%--<p class="weui-media-box__desc"></p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="weui-form-preview__item" style="margin-top: 5px">--%>
                        <%--<label class="weui-form-preview__label" style="font-size: 15px">详细地址</label>--%>
                        <%--<span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">梅四北327</span>--%>
                    <%--</div>--%>
                    <%--<div class="weui-form-preview__item">--%>
                        <%--<label class="weui-form-preview__label" style="font-size: 15px">备注</label>--%>
                        <%--<span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">啦啦啦啦啦啦啦</span>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div style="height: 15px;background-color: #eeeeee;"></div>--%>
            <%--</a>--%>
            <%--<a href="javascript:void(0);">--%>
                <%--<div class="weui-media-box">--%>
                    <%--<div class="weui-media-box_appmsg">--%>
                        <%--<div class="weui-media-box__hd">--%>
                            <%--<img class="weui-media-box__thumb" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAAB4CAMAAAAOusbgAAAAeFBMVEUAwAD///+U5ZTc9twOww7G8MYwzDCH4YcfyR9x23Hw+/DY9dhm2WZG0kbT9NP0/PTL8sux7LFe115T1VM+zz7i+OIXxhes6qxr2mvA8MCe6J6M4oz6/frr+us5zjn2/fa67rqB4IF13XWn6ad83nxa1loqyirn+eccHxx4AAAC/klEQVRo3u2W2ZKiQBBF8wpCNSCyLwri7v//4bRIFVXoTBBB+DAReV5sG6lTXDITiGEYhmEYhmEYhmEYhmEY5v9i5fsZGRx9PyGDne8f6K9cfd+mKXe1yNG/0CcqYE86AkBMBh66f20deBc7wA/1WFiTwvSEpBMA2JJOBsSLxe/4QEEaJRrASP8EVF8Q74GbmevKg0saa0B8QbwBdjRyADYxIhqxAZ++IKYtciPXLQVG+imw+oo4Bu56rjEJ4GYsvPmKOAB+xlz7L5aevqUXuePWVhvWJ4eWiwUQ67mK51qPj4dFDMlRLBZTqF3SDvmr4BwtkECu5gHWPkmDfQh02WLxXuvbvC8ku8F57GsI5e0CmUwLz1kq3kD17R1In5816rGvQ5VMk5FEtIiWislTffuDpl/k/PzscdQsv8r9qWq4LRWX6tQYtTxvI3XyrwdyQxChXioOngH3dLgOFjk0all56XRi/wDFQrGQU3Os5t0wJu1GNtNKHdPqYaGYQuRDfbfDf26AGLYSyGS3ZAK4S8XuoAlxGSdYMKwqZKM9XJMtyqXi7HX/CiAZS6d8bSVUz5J36mEMFDTlAFQzxOT1dzLRljjB6+++ejFqka+mXIe6F59mw22OuOw1F4T6lg/9VjL1rLDoI9Xzl1MSYDNHnPQnt3D1EE7PrXjye/3pVpr1Z45hMUdcACc5NVQI0bOdS1WA0wuz73e7/5TNqBPhQXPEFGJNV2zNqWI7QKBd2Gn6AiBko02zuAOXeWIXjV0jNqdKegaE/kJQ6Bfs4aju04lMLkA2T5wBSYPKDGF3RKhFYEa6A1L1LG2yacmsaZ6YPOSAMKNsO+N5dNTfkc5Aqe26uxHpx7ZirvgCwJpWq/lmX1hA7LyabQ34tt5RiJKXSwQ+0KU0V5xg+hZrd4Bn1n4EID+WkQdgLfRNtvil9SPfwy+WQ7PFBWQz6dGWZBLkeJFXZGCfLUjCgGgqXo5TuSu3cugdcTv/HjqnBTEMwzAMwzAMwzAMwzAMw/zf/AFbXiOA6frlMAAAAABJRU5ErkJggg==" alt="">--%>
                        <%--</div>--%>
                        <%--<div class="weui-media-box__bd">--%>
                            <%--<div class="weui-form-preview__item">--%>
                                <%--<label style="color: #0d0d0d;font-size: 16px">标题标题</label>--%>
                                <%--<span style="margin-top: 2px;float: right;color:#cecece;font-size:13px">7月10日</span>--%>
                            <%--</div>--%>
                            <%--<ul class="weui-media-box__info">--%>
                                <%--<li class="weui-media-box__info__meta"><i class="fa fa-venus" style="color: #BB2B2B"></i></li>--%>
                                <%--<li class="weui-media-box__info__meta">梅园</li>--%>
                                <%--<li class="weui-media-box__info__meta weui-media-box__info__meta_extra">申通</li>--%>
                            <%--</ul>--%>
                            <%--<p class="weui-media-box__desc"></p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="weui-form-preview__item" style="margin-top: 5px">--%>
                        <%--<label class="weui-form-preview__label" style="font-size: 15px">详细地址</label>--%>
                        <%--<span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">梅四北327</span>--%>
                    <%--</div>--%>
                    <%--<div class="weui-form-preview__item">--%>
                        <%--<label class="weui-form-preview__label" style="font-size: 15px">备注</label>--%>
                        <%--<span class="weui-form-preview__value" style="color: #0d0d0d;font-size: 15px">啦啦啦啦啦啦啦</span>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div style="height: 15px;background-color: #eeeeee;"></div>--%>
            <%--</a>--%>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $("#getPackage").addClass("weui-bar__item_on");
    });

    var updateTable = function (data) {
        const results = data.results;
        results.forEach(function (element) {
            $("#packageTable").append(`
                 <a href="javascript:void(0); packageId=`+element.id+`">
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
                                    <li class="weui-media-box__info__meta" style="float: right;color: red;font-size: 16px;font-weight: bold">`+element.price+`</li>
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