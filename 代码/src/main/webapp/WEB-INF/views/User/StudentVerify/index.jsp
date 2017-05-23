<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/23
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/user_header.jsp"%>
<script src="/assets/js/fastclick.js"></script>
<%--学生认证页面--%>
<div >
    <div id="top">
        <a id="title" >学生认证</a>
    </div>


    <%--<div class="weui-cells weui-cells_form">--%>
        <%--<div class="weui-cell">--%>
            <%--<div class="weui-cell__bd">--%>
                <%--<div class="weui-uploader">--%>
                    <%--<div class="weui-uploader__hd">--%>
                        <%--<p class="weui-uploader__title">您好，请上传学生证照片进行学生认证</p>--%>
                    <%--</div>--%>
                    <%--<br>--%>
                    <%--<div class="weui-uploader__bd">--%>
                        <%--<div class="weui-uploader__input-box">--%>
                            <%--<input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple="">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <%--<div class="weui-btn-area">--%>
                        <%--<a class="weui-btn weui-btn_primary" href="javascript:" id="showTooltips">提交</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>



    <div class="container">
        <div class="weui_cells_title">您好，请上传学生证照片进行认证</div>
        <div class="weui_cells weui_cells_form">
            <div class="weui_cell">
                <div class="weui_cell_bd weui_cell_primary">
                    <div class="weui_uploader">
                        <div class="weui_uploader_hd weui_cell">
                            <div class="weui_cell_bd weui_cell_primary">图片上传</div>
                        </div>
                        <div class="weui_uploader_bd">
                            <ul class="weui_uploader_files ">
                                <!-- 预览图插入到这 --> </ul>
                            <div class="weui_uploader_input_wrp">
                                <input class="weui_uploader_input js_file" id="uploaderInput" type="file" accept="image/jpg,image/jpeg,image/png,image/gif" multiple=""></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="weui_dialog_alert" style="display: none;">
        <div class="weui_mask"></div>
        <div class="weui_dialog">
            <div class="weui_dialog_hd"> <strong class="weui_dialog_title">警告</strong>
            </div>
            <div class="weui_dialog_bd">弹窗内容，告知当前页面信息等</div>
            <div class="weui_dialog_ft">
                <a href="javascript:;" class="weui_btn_dialog primary">确定</a>
            </div>
        </div>
    </div>
    <%--<script src="https://cdn.bootcss.com/zepto/1.1.6/zepto.min.js"></script>--%>
    <script>
        $.weui = {};
        $.weui.alert = function(options){
            options = $.extend({title: '警告', text: '警告内容'}, options);
            var $alert = $('.weui_dialog_alert');
            $alert.find('.weui_dialog_title').text(options.title);
            $alert.find('.weui_dialog_bd').text(options.text);
            $alert.on('touchend click', '.weui_btn_dialog', function(){
                $alert.hide();
            });
            $alert.show();
        };

        $(function () {
            // 允许上传的图片类型
            var allowTypes = ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'];
            // 1024KB，也就是 1MB
            var maxSize = 4096 * 4096;
            // 图片最大宽度
            var maxWidth = 3000;
            // 最大上传图片数量
            var maxCount = 1;
            $('.js_file').on('change', function (event) {
                var files = event.target.files;

                // 如果没有选中文件，直接返回
                if (files.length === 0) {
                    return;
                }

                for (var i = 0, len = files.length; i < len; i++) {
                    var file = files[i];
                    var reader = new FileReader();

                    // 如果类型不在允许的类型范围内
                    if (allowTypes.indexOf(file.type) === -1) {
                        $.weui.alert({text: '该类型不允许上传'});
                        continue;
                    }

                    if (file.size > maxSize) {
                        $.weui.alert({text: '图片太大，不允许上传'});
                        continue;
                    }

                    if ($('.weui_uploader_file').length >= maxCount) {
                        $.weui.alert({text: '最多只能上传' + maxCount + '张图片'});
                        return;
                    }

                    reader.onload = function (e) {
                        var img = new Image();
                        img.onload = function () {
                            // 不要超出最大宽度
                            var w = Math.min(maxWidth, img.width);
                            // 高度按比例计算
                            var h = img.height * (w / img.width);
                            var canvas = document.createElement('canvas');
                            var ctx = canvas.getContext('2d');
                            // 设置 canvas 的宽度和高度
                            canvas.width = w;
                            canvas.height = h;
                            ctx.drawImage(img, 0, 0, w, h);
                            var base64 = canvas.toDataURL('image/png');

                            // 插入到预览区
                            var $preview = $('<li class="weui_uploader_file weui_uploader_status" style="background-image:url(' + base64 + ')"><div class="weui_uploader_status_content">0%</div></li>');
                            $('.weui_uploader_files').append($preview);
                            var num = $('.weui_uploader_file').length;
                            $('.js_counter').text(num + '/' + maxCount);

                            // 然后假装在上传，可以post base64格式，也可以构造blob对象上传，也可以用微信JSSDK上传

                            var progress = 0;
                            function uploading() {
                                $preview.find('.weui_uploader_status_content').text(++progress + '%');
                                if (progress < 100) {
                                    setTimeout(uploading, 30);
                                }
                                else {
                                    // 如果是失败，塞一个失败图标
                                    //$preview.find('.weui_uploader_status_content').html('<i class="weui_icon_warn"></i>');
                                    $preview.removeClass('weui_uploader_status').find('.weui_uploader_status_content').remove();
                                }
                            }
                            setTimeout(uploading, 30);
                        };

                        img.src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
        //# sourceURL=pen.js
    </script>













    <script>
        $(function() {
            FastClick.attach(document.body);
        });
    </script>
<div>








<%@include file="/user_footer.jsp"%>