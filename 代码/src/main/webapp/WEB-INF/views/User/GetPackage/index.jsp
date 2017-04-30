<%--#e15400  color--%>
<!doctype html>
<html>
<head>
    <%--<%@include file="/user_header.jsp"%>--%>
    <meta charset="UTF-8">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/assets/css/demo/gmu.css" />
    <link rel="stylesheet" type="text/css" href="/assets/css/demo/ecmmobile.css" />
    <script type="text/javascript" src="/assets/js/demo/zepto.js"></script>
    <script type="text/javascript" src="/assets/js/demo/gmu.js"></script>
    <script type="text/javascript" src="/assets/js/demo/ecmmobile.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/assets/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/assets/css/mobile.css">


</head>
<body>


<div id="page">

    <div class="toolbar">
        <a href="javascript:window.history.back();"><img src="/assets/img/goback.png" ></a>
        <h2>
            <form method="get">
                <div class="searchinput">
                    <input type="text" name="key" value="search">
                </div>
            </form>
        </h2>
        <a href="javascript:void(0);" id="btn_filter" class="button fa fa-list" ></a>
    </div>

    <div id="filterpanel" class="panel" style="height: 100%">

            <h3>筛选</h3>
            <h4>区域</h4>
            <ul id="area">
            </ul>
            <h4>快递类型</h4>
            <ul id="CourierCompany" >
            </ul>
            <div class="mainbtnbar">
                <a href="javascript:void(0);" id="filterSubmit" class="button">Ok</a>
            </div>
    </div>

    <script>

        var filterpanel = $("#filterpanel");
        filterpanel.css({
            'height': window.innerHeight
        }).iScroll()
            .panel({
                contentWrap: $("#page"),
                scrollMode: 'fix',
                display: 'overlay',
                swipeClose: true
            }).on('open', function () {
            filterpanel.iScroll('refresh');
        });

        var isBrandLoad = false;
        $("#btn_filter").on("click", function (e) {
            e.preventDefault();
            if(isBrandLoad){
                filterpanel.panel("toggle");
            }else{
                isBrandLoad = true;
                $.get('products/brands_json', function (response) {
                    if(response.data){
                        showLi([{"id":"","name":"全部"}],"brand-ul",10);
                        showLi(response.data,"brand-ul",10);
                        filterpanel.panel("toggle");
                        bindPanelLiClick();
                        filterpanel.iScroll('refresh');
                    }
                })
            }
        });

    </script>
</body>
</html>
<%@include file="/user_footer.jsp"%>