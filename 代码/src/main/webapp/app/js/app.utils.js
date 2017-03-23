/**
 * Created by hujian on 2016/12/6.
 */
/**
 * 异步加载页面
 * @param href
 * @constructor
 */
var AsynchronousLoading = function AsynchronousLoading(href) {
    "use strict";
    $.ajax({
        type: 'GET',
        url: href,
        success: function (msg) {
            $.ajaxSetup({
                async: false,
                cache: true
            });
            $("#mainPage").empty().append(msg);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            /*swal({
                title: "出错了！",
                text: "错误信息" + XMLHttpRequest.status,
                type: "error",
                confirmButtonText: "知道了"
            });*/
        }
    });
};

/**
 * 手动绑定跳转事件
 */
var bindRedirect = function bindRedirect() {
    "use strict";
    $(".redirect").click(function () {
        console.log(this);
        var attribute = this.getAttribute("url");
        AsynchronousLoading(attribute);
    });
};

/**
 * 是空或null或undefined嘛
 * @param value
 * @returns {boolean}
 */
var isNullOrEmpty = function (value) {
    "use strict";
    value = $.trim(value);

    if (!value && typeof value === "object") {
        return true;
    }


    if (value == "") {
        return true;
    }

    if (value == " ") {
        return true;
    }

    if (typeof(value) === "undefined") {
        return true;
    }
};

/**
 * 如果为Null或空就返回空字符串
 * @param data
 * @returns {*}
 */
var ifIsNullReturnEmptyString = function ifIsNullReturnEmptyString(data) {
    "use strict";
    if (isNullOrEmpty(data)) {
        return "";
    } else {
        return data;
    }
};