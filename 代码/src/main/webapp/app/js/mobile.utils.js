/**
 * Created by arthurme on 2017/3/31.
 * 手机端交互js
 */

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

/**
 * 是不是数字？
 * @param value
 * @returns {*}
 */
var checkNaN = function (value) {
    "use strict";
    value = $.trim(value);

    if (isNaN(value) || isNullOrEmpty(value)) {
        return 0;
    } else {
        return value;
    }
};

/**
 * 分页
 * @param url url，不带 pageNumber和pageSize
 * @param updateTable
 * @param pageSize
 * @constructor
 */
var pageNumber = 0;
var Loading = function (url, updateTable, pageSize) {
    alert("");
    "use strict";
    $.ajax({
        url: url + "/pageNumber/" + pageNumber + "/pageSize/" + pageSize,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success:function (data) {
            var nextPageNumber = data["nextPage"];
            if(nextPageNumber <= pageNumber){
                $("#loadingText").html("没有更多了");
                return;
            }
            updateTable(data);
            pageNumber = nextPageNumber;
        },
        error:function (XMLHttpRequest) {
            
        }
    });
};

/**
 * Get方法
 * @param url
 * @param success
 * @constructor
 */
var Get = function (url,success) {
    "use strict";

    $.ajax({
        url:url,
        type:"GET",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success:function (data) {
            success(data);
        },
        error:function (XMLHttpRequest) {
        }
    });
};

/**
 * Post方法
 * @param url
 * @param data
 * @param success
 * @constructor
 */
var Post = function (url,data,success) {
    "use strict";

    $.ajax({
        url:url,
        type:"POST",
        contentType: "application/json",
        data: JSON.stringify(data),
        success:function () {
            success();
        },
        error:function (XMLHttpRequest) {
        }
    });
};

/**
 * Put方法
 * @param url
 * @param data
 * @param success
 * @constructor
 */
var Put = function (url,data,success) {
    "use strict";

    $.ajax({
        url:url,
        type:"PUT",
        contentType: "application/json",
        data: JSON.stringify(data),
        success:function () {
            success();
        },
        error:function (XMLHttpRequest) {
        }
    });
};

/**
 * Delete方法
 * @param url
 * @param success
 * @constructor
 */
var Delete = function (url,success) {
    "use strict";

    $.ajax({
        url:url,
        type:"DELETE",
        success:function () {
            success();
        },
        error:function (XMLHttpRequest) {
        }
    });
};