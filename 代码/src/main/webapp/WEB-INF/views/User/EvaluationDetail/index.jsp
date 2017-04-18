<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/4/15/015
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style type="text/css">
    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    .clearfix:after{content:".";display:block;height:0;clear:both;visibility:hidden}
    .clearfix{display:inline-table}
    *html .clearfix{height:1%}
    .clearfix{display:block}
    *+html .clearfix{min-height:1%}
    .fl{float:left;}
    .gradecon{
        width: 250px;
        height: 25px;
    }
    .rev_pro li{line-height:20px;height:20px;}
    .rev_pro li .revtit{text-align:right;display:block;float:left;margin-right:10px;width:70px;}
    .revinp{float:left;display:inline;}
    .level .level_solid,.level .level_hollow{float:left;background-image:url("/assets/img/star.png");background-repeat:no-repeat;display:inline-block;width:40px;height:30px;}
    .level .level_solid{background-position:6px 0px;}
    .level .level_hollow{background-position:-40px 0px;}
    .revgrade{margin-left:20px;}
</style>
<div id="frame">
    <div id="top">
        <span id="list">
            <a href="/User/WaitingEvaluation/"><img src="/assets/img/goback.png" align="top"></a>
        </span>
        <a id="title">发表评价</a>
        <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__hd" style="position: relative;margin-right: 10px;">
            <img src="/assets/img/a7.jpg" style="width: 50px;display: block">
        </div>
        <div class="weui-cell__bd">
            <p>联系人名称:<b>高语越</b></p>
            <p style="font-size: 13px;color: #888888;">hahahahahah</p>
        </div>
    </div>
    <br>

    <div class="weui-tab">
        <div class="weui-navbar">
            <a class="weui-navbar__item weui-bar__item--on border_Evaluation_color font_color" href="#good">
                <img src="/assets/img/good.png" alt="" style="width:15px;margin-right:10px;">
                好评
            </a>
            <a class="weui-navbar__item font_color" href="#order">
                <img src="/assets/img/order.png" alt="" style="width:15px;margin-right:10px;">
                中评
            </a>
            <a class="weui-navbar__item font_color" href="#poor">
                <img src="/assets/img/poor.png" alt="" style="width:15px;margin-right:10px;">
                差评
            </a>
        </div>
        <%--<div class="weui-tab__bd">--%>
            <%--<div id="good" class="weui-tab__bd-item">--%>
                <%--<h1>dsfsdfsdfds</h1>--%>
            <%--</div>--%>
            <%--<div id="order" class="weui-tab__bd-item">--%>
                <%--<h1>页面二</h1>--%>
            <%--</div>--%>
            <%--<div id="poor" class="weui-tab__bd-item weui-tab__bd-item--active">--%>
                <%--<h1>页面三</h1>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell" >
            <div class="weui-cell__bd" >
                <textarea class="weui-textarea textarea" id="counts" placeholder="请输入您的意见" rows="3"></textarea>
                <div class="weui-textarea-counter"><span id="remainingwords">0</span>/100</div>
            </div>
        </div>
    </div>

    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>服务态度</p>
        </div>
        <div class="weui-cell__ft">
            <div class="gradecon">
                <ul class="rev_pro clearfix">
                    <li>
                        <div class="revinp">
				<span class="level">
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
				</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="weui-cell">
        <div class="weui-cell__bd">
            <p>送货速度</p>
        </div>
        <div class="weui-cell__ft">
            <div class="gradecon">
                <ul class="rev_pro clearfix">
                    <li>
                        <div class="revinp">
				<span class="level">
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
					<i class="level_hollow" cjmark=""></i>
				</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="weui-cells weui-cells_form">
        <div class="weui-cell weui-cell_switch">
            <div class="weui-cell__bd">是否匿名</div>
            <div class="weui-cell__ft">
                <label for="switchCP" class="weui-switch-cp">
                    <input id="switchCP" class="weui-switch-cp__input" type="checkbox" checked="checked">
                    <div class="weui-switch-cp__box"></div>
                </label>
            </div>
        </div>
    </div>

    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips" style="background-color: #ff850e">提交评论</a>
    </div>
</div>
<script>
    $(function(){
        $('.weui-navbar__item').on('click', function () {
            $(this).addClass('weui-bar__item_on').siblings('.weui-bar__item_on').removeClass('weui-bar__item_on');
            $(this).addClass('border_Evaluation_color').siblings('.border_Evaluation_color').removeClass('border_Evaluation_color');
            $(this).css("color",$(this).css("color"));
        });
    });
</script>
<script language="javascript" type="text/javascript">
    $("#counts").keyup(function(){
        if($("#counts").val().length > 100){
            $("#counts").val( $("#counts").val().substring(0,100) );
        }
        $("#remainingwords").text( 100 - $("#counts").val().length ) ;
    });
</script>

<script type="text/javascript">
    $(function(){
        //点星星
        $(document).on('mouseover','i[cjmark]',function(){
            var num = $(this).index();
            var pmark = $(this).parents('.revinp');

            var list = $(this).parent().find('i');
            for(var i=0;i<=num;i++){
                list.eq(i).attr('class','level_solid');
            }
            for(var i=num+1,len=list.length-1;i<=len;i++){
                list.eq(i).attr('class','level_hollow');
            }
        })
    })
</script>
<%@include file="/user_footer.jsp"%>
