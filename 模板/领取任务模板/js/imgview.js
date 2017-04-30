var imgView = (function($,undefined){
	var tapevent = $.support.touch ? 'tap' : 'click';
	var pos = {},
		mask = $('<div class="imgview-mask"></div>'),
		wrap = $('<div class="imgview"></div>');
	wrap.on('touchstart',function(e){
		e.preventDefault();
	}).on(tapevent,function(){
		wrap.animate({
			'top':pos.top,
			'left':pos.left,
			'width':pos.width,
			'height':pos.height,
			'opacity':0
		},{
			duration:200,
			complete:function(){
				wrap.hide();
			}
		});
		mask.animate({
			'opacity':0
		},{
			duration:200,
			complete:function(){
				mask.hide();
			}
		});
	});
	return function(selector){
		var imgs = $(selector),
			html = "";
		imgs.each(function(i){
			var pic = this.getAttribute('data-pic');
			if(pic){
				html += '<div><img lazyload="'+pic+'"></div>';
			}
			imgs.eq(i).on(tapevent,function(){
				var screenWidth = window.innerWidth,
					screenHeight = window.innerHeight;
				wrap.slider('slideTo',i);
				pos = this.getBoundingClientRect();
				mask.css({
					'top':document.body.scrollTop,
					'left':0,
					'opacity':0,
					'width':screenWidth,
					'height':screenHeight,
					'display':'block'
				}).animate({
					'opacity':1
				});
				wrap.css({
					'top':pos.top,
					'left':pos.left,
					'width':pos.width,
					'height':pos.height,
					'opacity':0
				}).show()
				.animate({
					'top':document.body.scrollTop,
					'left':0,
					'width':screenWidth,
					'height':screenHeight,
					'opacity':1
				},200);
			});
		});
		mask.appendTo(document.body).hide();
		wrap.html(html)
		.appendTo(document.body)
		.slider({
		    autoPlay:false,
		    arrow:false,
		    imgZoom:true,
		    viewNum:1
		}).hide();
	}
})(Zepto);