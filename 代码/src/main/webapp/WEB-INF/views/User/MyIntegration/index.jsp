<%--
  Created by IntelliJ IDEA.
  User: Yzf
  Date: 2017/7/9/009
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<style>
    table td{
        border:1px solid #bfbfbf
    }
    td{
        height: 30px;
    }
    .bold{
        font-weight: bold;
        font-size: 15px;
    }
    .red{
        color: red;
    }
    .green{
        color: green;
    }
</style>
<div id="frame">
    <div id="navbarSuspension">
        <div id="top">
            <span id="list">
                <a href="/User/PersonalCenter/"><img src="/assets/img/goback.png" align="top"></a>
            </span>
            <a id="title">我的信用分</a>
            <a id="logo" href="/"><img src="/assets/img/home.png" align="top"></a>
        </div>

        <div class="page navbar js_show">
            <div class="page__bd">
                <div class="back_position">
                    <div style="position: relative;text-align: center">
                        <img class="img_position" src="/assets/img/circle.jpg">

                    </div>
                    <div class="button_sp_area navuser">
                        <a class="weui-btn weui-btn_mini weui-btn_primary open-popup button_style" data-target="#IntegrationRules" style="border-radius: 250px;background-color: white;color: black;border: 1px solid orange">
                            <span>信用分规则</span>
                        </a>
                    </div>

                    <div class="weui-cells">
                        <div class="weui-cells__title"><strong style="font-size: 15px;color: black">信用分变更记录</strong></div>
                        <div id="creditDivisionRecord">

                        </div>


                    </div>
                </div>
            </div>
        </div>
        <div class="text_position" id="integration"></div>


        <div id="IntegrationRules" class='weui-popup__container'>
            <div class="weui-popup__overlay"></div>
            <div class="weui-popup__modal"  style="background-color: #EEEEEE">
                <div class="top_other">
                    <span class="list_other"><a class="close-popup refresh_page"><img src="/assets/img/goback.png" align="top"></a></span>
                    <span ><a class="title_other">我的信用分</a></span>
                    <span><a class="logo_other show-warning update" href="/"><img src="/assets/img/home.png" align="top"></a></span>
                </div>
                <article class="weui-article" style="padding: 0px 0px">
                    <h1 style="color: black;font-weight: bolder;margin-bottom: 0em">信用分规则:</h1>
                    <section>
                        <section style="text-indent: 2em;">
                            <p style="margin: 0 0 0cm">
                                新用户起始信用分为100分，信用分数最低为0分。分数越高，代表您的平台使用越规范，分数越低，表示您存在越多的不恰当使用行为。
                            </p>
                            <p style="margin: 0 0 0cm">
                                当您的信用分数为零时，为了保证大家能拥有良好的使用体验，很抱歉，您将无法使用本平台。
                            </p>
                            <p style="margin: 0 0 0cm">
                                若信用分变化存在错误，请拨打110-110进行申诉。
                            </p>
                        </section>
                    </section>

                    <section style="text-align: left;padding: 0px 0px">
                        <h1 style="color: black;font-weight: bolder;text-align: left;margin-bottom: 0em">信用分变化规则：</h1>
                        <table width="90%" cellpadding="0" cellspacing="0" style="text-align: center;">
                            <thead>双方互评</thead>
                            <tbody>
                            <tr>
                                <td class="bold">评价分数</td>
                                <td class="bold">信用分变化</td>
                            </tr>
                            <tr>
                                <td>90-100</td>
                                <td class="green">+5</td>
                            </tr>
                            <tr>
                                <td>80-90</td>
                                <td class="green">+3</td>
                            </tr>
                            <tr>
                                <td>60-80</td>
                                <td>+0</td>
                            </tr>
                            <tr>
                                <td>40-60</td>
                                <td class="red">-3</td>
                            </tr>
                            <tr>
                                <td>40以下</td>
                                <td class="red">-5</td>
                            </tr>
                            </tbody>
                        </table>
                        <table width="90%" cellpadding="0" cellspacing="0" style="text-align: center">
                            <thead>完成订单</thead>
                            <tbody>
                            <tr>
                                <td class="bold">订单结果</td>
                                <td class="bold">信用分变化</td>
                            </tr>
                            <tr>
                                <td>完善信息</td>
                                <td class="green">+50</td>
                            </tr>
                            <tr>
                                <td>完成认证</td>
                                <td class="green">+50</td>
                            </tr>
                            <tr>
                            <tr>
                                <td>完成发布</td>
                                <td class="green">+1</td>
                            </tr>
                            <tr>
                                <td>完成接单</td>
                                <td class="green">+1</td>
                            </tr>
                            <tr>
                                <td>确认签收</td>
                                <td class="green">+1</td>
                            </tr>
                            <tr>
                                <td>撤销订单</td>
                                <td class="red">-1</td>
                            </tr>
                            <tr>
                                <td>送达超时</td>
                                <td class="red">-20</td>
                            </tr>
                            </tbody>
                        </table>
                    </section>
                </article>
            </div>
        </div>

    </div>
</div>

<script>
    var success = function success(data) {
      $("#creditDivisionRecord").empty();
      var information = function information(array) {
          data.forEach(function (e) {
              if(array.userName == e.user.userName && e.score > 0){
                  $("#creditDivisionRecord").prepend(`
                          <div class="weui-cell weui-cell_access">
                                <div class="weui-cell__bd">`+e.description+`</div>
                                <div style="font-size: 10px">
                                    <span style="vertical-align:middle; font-size: 17px;">信用分</span>
                                    <span style="vertical-align:middle; font-size: 17px;">+</span>
                                    <span style="vertical-align:middle; font-size: 17px;">`+e.score+`</span>
                                </div>
                          </div>
        `)
              } else if(array.userName == e.user.userName && e.score <= 0){
                  $("#creditDivisionRecord").prepend(`
                          <div class="weui-cell weui-cell_access">
                                <div class="weui-cell__bd">`+e.description+`</div>
                                <div style="font-size: 10px">
                                    <span style="vertical-align:middle; font-size: 17px;">信用分</span>
                                    <span style="vertical-align:middle; font-size: 17px;">`+e.score+`</span>
                                </div>
                          </div>
        `)
              }
          });
      };
        Get("/User/MyIntegration/information",information);

    };
    Get("/User/MyIntegration/creditList",success);
</script>

<script src="/assets/js/fastclick.js"></script>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    <%--嵌套页面--%>
    $(document).on("open", ".weui-popup-modal", function() {
        console.log("open popup");
    }).on("close", ".weui-popup-modal", function() {
        console.log("close popup");
    });
</script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
