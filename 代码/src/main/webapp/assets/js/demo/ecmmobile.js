$(function(){
setTimeout(function(){scrollTo(0,1)},0);
var toolbar = $(".toolbar");
toolbar.toolbar({useFix:false});
var productSlider =  new gmu.Slider($(".picslider"),{
    autoPlay:true,
    arrow:false,
    imgZoom:true,
    viewNum:1
});

$(".button").button();
$(".pagination > a").button();
$(".prop-img .ui-btn").each(function(){
    this.style.backgroundImage = "url("+this.getAttribute("data-img")+")";
});
$(".filterbar a").button();

$(".gotop a")[app.tapevent](function(e){
	e.preventDefault();
	scrollTo(0,0);
});

$("#globalmenu").fix({bottom:5,left:5});

function Pathmenu(option){
	var csstext = '',
	opt = {
		distance : 100,
		duration : '.3s',
		btnclass : '.gbm-btn',
		itemclass : '.gbm-sub'
	};
	$.extend(opt,option);
	var subitems = $(opt.itemclass + ' a'),
		angle = (Math.PI/180) * 90/(subitems.length <= 1 ? 1 : subitems.length - 1);
	for(var i=0; i<subitems.length; i++){
		var x1 = ((opt.distance + 5) * Math.sin(angle * i)).toFixed(10),
			y1 = -((opt.distance + 5) * Math.cos(angle * i)).toFixed(10),
			x2 = ((opt.distance - 5) * Math.sin(angle * i)).toFixed(10),
			y2 = -((opt.distance - 5) * Math.cos(angle * i)).toFixed(10),
			x3 = (opt.distance * Math.sin(angle * i)).toFixed(10),
			y3 = -(opt.distance * Math.cos(angle * i)).toFixed(10);
		csstext += opt.itemclass + '.pathmenu-opened a:nth-child('+ (i+1) +'){-webkit-transform: translate('+x3+'px,'+y3+'px);}';
		csstext += opt.itemclass + '.pathmenu-opening a:nth-child('+ (i+1) +'){-webkit-animation:pathmenu-open-'+ (i+1) +' '+ opt.duration +' 1 Ease-out; -webkit-animation-fill-mode:both; -webkit-animation-delay:'+i*.04+'s;}';
		csstext += '@-webkit-keyframes pathmenu-open-'+ (i+1) +'{\
			0% { -webkit-transform: translate(0,0) rotate(0deg);}\
			60% { -webkit-transform: translate('+x1+'px,'+y1+'px) rotate(-200deg);}\
			80% { -webkit-transform: translate('+x2+'px,'+y2+'px) rotate(-280deg);}\
			100% { -webkit-transform: translate('+x3+'px,'+y3+'px) rotate(-360deg);}\
		}';
		csstext += opt.itemclass + '.pathmenu-closing a:nth-child('+ (i+1) +'){-webkit-animation:pathmenu-close-'+ (i+1) +' '+ opt.duration +' 1 Ease-out; -webkit-animation-fill-mode:both; -webkit-animation-delay:'+(subitems.length - i)*.04+'s;}';
		csstext += '@-webkit-keyframes pathmenu-close-'+ (i+1) +'{\
			0% { -webkit-transform: translate('+x3+'px,'+y3+'px) rotate(0deg);}\
			70% { -webkit-transform: translate('+x3+'px,'+y3+'px) rotate(350deg);}\
			100% { -webkit-transform: translate(0,0) rotate(360deg);}\
		}';
	}

	$('<style></style>').html(csstext).appendTo($('head'));
	var btn = $(opt.btnclass),
	mask = $('<div class="mask"></div>').css({
		height : document.body.scrollHeight
	}).click(function(){
		btn.trigger(app.tapevent);
	});
	btn[app.tapevent](function(){
		var itemwrap = $(opt.itemclass);
		if(itemwrap.hasClass('pathmenu-opened')){
			btn.removeClass('pathmenu-btn-act');
			itemwrap.removeClass('pathmenu-opened').addClass('pathmenu-closing');
			subitems.first().one('webkitAnimationEnd',function(){
				itemwrap.removeClass('pathmenu-closing');
			});
			mask.remove();
		}else{
			btn.addClass('pathmenu-btn-act');
			itemwrap.removeClass('pathmenu-closing').addClass('pathmenu-opening');
			subitems.last().one('webkitAnimationEnd',function(){
				itemwrap.removeClass('pathmenu-opening').addClass('pathmenu-opened');
			});
			mask.appendTo(document.body);
		}
	}).highlight();
}
if($("#globalmenu")[0]){
	Pathmenu();
}
});


////////////////////////////////系统工具集////////////////////////////////////////////////////////////

var app = {};
app.tapevent = $.support.touch ? "tap" : "click";
app.helper = {
	contextPath: "",
	mergeArray: function(array1, array2){
		var array = new Array();
		if(typeof array1 != "undefined"){
			if($.type(array1) == "array"){
				for(var i=0;i<array1.length;i++){
					array.push(array1[i]);
				}
			}else array.push(array1);
		}
		if(typeof array2 != "undefined"){
			if($.type(array2) == "array"){
				for(var i=0;i<array2.length;i++){
					array.push(array2[i]);
				}
			}else array.push(array2);
		}
		return array;
	},
	getContextPath: function(){
          var contextPath = location.pathname;
          var index =contextPath.substr(1).indexOf("/");
          contextPath = contextPath.substr(0,index+1);
          delete index;
          return contextPath;
     },
     getFullContextPath: function(){
          var contextPath = app.helper.getContextPath();
          return location.protocol+"//"+location.host+contextPath;
     },
     removeArray: function(array, delObj) { //扩展Array.prototype与jquery冲突，故采用此法
    	 var index = -1;
    	 for (var i = 0; i < array.length; i++) {
	        if (array[i] == delObj) {
	        	index = i;
	        }
	     }
    	 if (index > -1) {
    		 array.splice(index, 1);
	     }
    	 return array;
     },
     formatDate: function(dateString, pattern) {
    	 var date;
    	 if(dateString) date = new Date(dateString);
    	 else return "";
 		 return date.pattern(pattern?pattern : 'yyyy-MM-dd');
     },
     formatCurrentDate: function(pattern) {
    	 var date = new Date();
 		 return date.pattern(pattern?pattern : 'yyyy-MM-dd');
     },
     safeRender: function(s){
    	 return (s && s !="" && s != '_NA_') ? s : "无";
     },
     loadStatus: function(id, status, defaultValue){
    	var e = $("#"+id);
    	if(e.size() > 0){
    		e.empty();
    		$("<option value=''>请选择</option>").appendTo(e);
    		for(var s in status){
    			var str = "<option value='" + s + "' ";
    			if(defaultValue && defaultValue==s) str += "selected";;
    			str += ">" +  status[s] + "</option>";
    			$(str).appendTo(e);
    		}
    	}
     }
};

app.handlerServiceResponse = function(data){
	if(typeof data.result == "undefined"){
		app.showError({messages:["数据格式错误"]});
		return false;
	}else if(data.result == "success"){
		return true;
	}else if(data.result == "error"){
		var message = data.message || "系统错误";
		app.showError({messages:[message]});
		return false;
	}else if(data.result == "nosession"){
		app.confirm({message:"长时间未操作，请重新登录！",sure:function(){
			top.location.reload();
		}});
		return false;
	}else{
		app.showError({messages:["数据格式错误"]});
		return false;
	}
};

app.showError = function(options){
	var op = {
			messages:["处理失败，请重试！"]
		};
	
	$.extend(op, options);
	var messages = app.helper.mergeArray([],op.messages);
	alert(messages.join(";"));
};

app.ajaxHelper = {
	submitRequest: function(options){
		var settings = $.extend(true,{data:{}},options);
		if(!settings.url) settings.url = "";
		if(!settings.type) settings.type = 'POST';
		if(!settings.dataType) settings.dataType = "json";
		if(!settings.traditional) settings.traditional = true;
		$.ajax({
			type: settings.type,  
			dataType: settings.dataType,
			traditional: settings.traditional,
			url: settings.url, 
			data: settings.data,
			success: settings.success
		});
	},
	confirm: function(options){
		var settings = $.extend(true,{},options);
		if(!settings.url) settings.url = "";
		if(!settings.url) settings.url = "";
		if(!settings.type) settings.type = 'POST';
		if(!settings.dataType) settings.dataType = "json";
		if(!settings.traditional) settings.traditional = true;
		var sure = function(){
			$.ajax({
				type: settings.type,  
				dataType: settings.dataType,
				traditional: settings.traditional,
				url: settings.url, 
				data: settings.data,
				success: settings.success
			});
		};
		
		if(confirm(settings.message)){
			sure();
		}
		return false;
	}
};
app.showLoginDialog=function(toUrl){
    var dialog = gmu.Dialog({
        autoOpen: false,
        closeBtn: false,
        buttons: {
            '取消': function(){
                this.close();
            },
            '确定': function(){
                this.close();
                location.href = toUrl;
            }
        },
        title: '登录提示',
        content: '<p>您未登录，请先登陆</p>'
    });
    dialog.open();
};