/**
 * Created by arthurme on 2017/3/31.
 */

/**
 * 分页
 * @param url url，不带 pageNumber和pageSize
 * @param updateTable
 * @param pageSize
 * @constructor
 */
var pageNumber = 0;
var Loading = function (url, updateTable, pageSize) {
    "use strict";
    $(document).ajaxStart(function () {
        Pace.restart();
    });
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

var Get = function (url,success) {
    "use strict";

    $.ajax({
        url:url,
        type:"GET",
        success:function (data) {
            success(data);
        },
        error:function (XMLHttpRequest) {

        }
    });
};

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

var Put = function (url,data) {
    "use strict";

    $.ajax({
        url:url,
        type:"PUT",
        contentType: "application/json",
        data: JSON.stringify(data),
        success:function () {
        },
        error:function (XMLHttpRequest) {
        }
    });
};

var Delete = function (url) {
    "use strict";

    $.ajax({
        url:url,
        type:"DELETE",
        success:function () {
        },
        error:function (XMLHttpRequest) {
        }
    });
};