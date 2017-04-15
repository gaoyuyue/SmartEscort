<%--
  Created by IntelliJ IDEA.
  User: arthurme
  Date: 2017/4/10
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增收获地址</title>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <link rel="stylesheet" href="/assets/css/weui.min.css"/>
    <link rel="stylesheet" href="/assets/css/jquery-weui.min.css"/>
    <link href="/assets/css/mobile.css" rel="stylesheet" type="text/css">
    <script src="/assets/js/jquery-2.1.1.min.js"></script>

</head>
<body>
    <div id="top">
        <span id="list">
            <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">新增收货地址</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <input class="weui-input" id="name" type="text" placeholder="收货人姓名">
            </div>
        </div>
    </div>
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <input class="weui-input" id="phone" type="number" placeholder="手机号码">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__hd"><label for="home-city" class="weui-label">学校/区域</label></div>
            <div class="weui-cell__bd">
                <input class="weui-input" id="home-city" type="text">
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell">
            <div class="weui-cell__bd">
                <textarea class="weui-textarea" id="address" placeholder="详细地址" rows="4"></textarea>
            </div>
        </div>
    </div>

    <a href="javascript:;" class="weui-btn weui-btn_warn">保存</a>

    <script src="/assets/js/jquery-weui.min.js"></script>
    <script src="/assets/js/fastclick.js"></script>
    <script src="/assets/js/city-picker.js"></script>
    <script>
        $(function() {
            FastClick.attach(document.body);
        });
    </script>
    <script>
        $.rawCitiesData.push(
                {
                    "name":"北京",
                    "code":"110000",
                    "sub": [
                        {
                            "name": "北京市",
                            "code": "110000",
                            "sub":[
                                {
                                    "name":"东城区",
                                    "code":"110101"
                                },
                                {
                                    "name":"西城区",
                                    "code":"110102"
                                },
                                {
                                    "name":"朝阳区",
                                    "code":"110105"
                                },
                                {
                                    "name":"丰台区",
                                    "code":"110106"
                                },
                                {
                                    "name":"石景山区",
                                    "code":"110107"
                                },
                                {
                                    "name":"海淀区",
                                    "code":"110108"
                                },
                                {
                                    "name":"门头沟区",
                                    "code":"110109"
                                },
                                {
                                    "name":"房山区",
                                    "code":"110111"
                                },
                                {
                                    "name":"通州区",
                                    "code":"110112"
                                },
                                {
                                    "name":"顺义区",
                                    "code":"110113"
                                },
                                {
                                    "name":"昌平区",
                                    "code":"110114"
                                },
                                {
                                    "name":"大兴区",
                                    "code":"110115"
                                },
                                {
                                    "name":"怀柔区",
                                    "code":"110116"
                                },
                                {
                                    "name":"平谷区",
                                    "code":"110117"
                                },
                                {
                                    "name":"密云县",
                                    "code":"110228"
                                },
                                {
                                    "name":"延庆县",
                                    "code":"110229"
                                }
                            ]
                        }
                    ]
                }
        );
        $("#home-city").cityPicker({
            title: "选择学校和区域",
            showDistrict: false,
            onChange: function (picker, values, displayValues) {
                console.log(values, displayValues);
            }
        });
    </script>

</body>
</html>



