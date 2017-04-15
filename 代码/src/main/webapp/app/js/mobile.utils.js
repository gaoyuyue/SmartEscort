/**
 * Created by arthurme on 2017/3/31.
 */
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