//课程内容移入 mask动画变高度和 加边框阴影 
//主页 课程效果
kchover($('.wrapp-main li'));
kchover($('.only'));

//二级页面 课程内容效果
kchover($('.rightfloat li'));

//扶贫主页课程效果
kchover($('.fp-xq li'));
kchover($('.fp-xx li'));


function kchover01(obj){
	obj.each(function(){
//		var start = $(this)
		$(this).hover(function(){
			$(this).children('.kc').children('.kcmask').stop().animate({height:'32px'});
			$(this).children('.kc').children('.kcmask').show();
			
			$(this).children('.texts').css('background','#fff');
			$(this).children('.texts').css('border-bottom-left-radius','10px');
			$(this).children('.texts').css('border-bottom-right-radius','10px');
			$(this).children('.texts').css('-webkit-border-bottom-left-radius','10px');
			$(this).children('.texts').css('-webkit-border-bottom-right-radius','10px');
			$(this).children('.kc').css('border-bottom-left-radius','0px');
			$(this).children('.kc').css('border-bottom-right-radius','0px');
			$(this).children('.kc').css('-webkit-border-bottom-left-radius','0px');
			$(this).children('.kc').css('-webkit-border-bottom-right-radius','0px');
			$(this).children('.kc').children('img').css('border-bottom-left-radius','10px');
			$(this).children('.kc').children('img').css('border-bottom-right-radius','10px');
			$(this).children('.kc').children('img').css('-webkit-border-bottom-left-radius','10px');
			$(this).children('.kc').children('img').css('-webkit-border-bottom-right-radius','10px');
			$(this).css('box-shadow','5px 0px 10px rgba(0,0,0,0.2)');
			$(this).css('-webkit-box-shadow','5px 0px 10px rgba(0,0,0,0.2)');
		},function(){
			$(this).children('.kc').children('.kcmask').animate({height:'0px'});
			$(this).children('.kc').children('.kcmask').hide();
			$(this).children('.texts').css('background','');
			$(this).children('.texts').css('border-bottom-left-radius','0px');
			$(this).children('.texts').css('border-bottom-right-radius','0px');
			$(this).children('.texts').css('-webkit-border-bottom-left-radius','0px');
			$(this).children('.texts').css('-webkit-border-bottom-right-radius','0px');
			$(this).children('.kc').css('border-bottom-left-radius','10px');
			$(this).children('.kc').css('border-bottom-right-radius','10px');
			$(this).children('.kc').css('-webkit-border-bottom-left-radius','10px');
			$(this).children('.kc').css('-webkit-border-bottom-right-radius','10px');
			$(this).children('.kc').children('img').css('border-bottom-left-radius','10px');
			$(this).children('.kc').children('img').css('border-bottom-right-radius','10px');
			$(this).children('.kc').children('img').css('-webkit-border-bottom-left-radius','10px');
			$(this).children('.kc').children('img').css('-webkit-border-bottom-right-radius','10px');
			$(this).css('box-shadow','');
			$(this).css('-webkit-box-shadow','');
		});
	});
	
}
function kchover(obj){
	obj.each(function(){
//		var start = $(this)
		$(this).hover(function(){
			$(this).find('.kcmask').stop().animate({height:'32px'});
			$(this).find('.kcmask').show();
			
			$(this).find('.texts').css('background','#fff');
			$(this).find('.texts').css('border-bottom-left-radius','10px');
			$(this).find('.texts').css('border-bottom-right-radius','10px');
			$(this).find('.texts').css('-webkit-border-bottom-left-radius','10px');
			$(this).find('.texts').css('-webkit-border-bottom-right-radius','10px');
			$(this).find('.kc').css('border-bottom-left-radius','0px');
			$(this).find('.kc').css('border-bottom-right-radius','0px');
			$(this).find('.kc').css('-webkit-border-bottom-left-radius','0px');
			$(this).find('.kc').css('-webkit-border-bottom-right-radius','0px');
			$(this).find('img').css('border-bottom-left-radius','0px');
			$(this).find('img').css('border-bottom-right-radius','0px');
			$(this).find('img').css('-webkit-border-bottom-left-radius','0px');
			$(this).find('img').css('-webkit-border-bottom-right-radius','0px');
			$(this).css('box-shadow','5px 0px 10px rgba(0,0,0,0.2)');
			$(this).css('-webkit-box-shadow','5px 0px 10px rgba(0,0,0,0.2)');
			$(this).find('.titles').css('color','#d21213');
			$(this).find('.kcsm p em').css('color','#333');
		},function(){
			$(this).find('.kcmask').animate({height:'0px'});
			$(this).find('.kcmask').hide();
			$(this).find('.texts').css('background','');
			$(this).find('.texts').css('border-bottom-left-radius','0px');
			$(this).find('.texts').css('border-bottom-right-radius','0px');
			$(this).find('.texts').css('-webkit-border-bottom-left-radius','0px');
			$(this).find('.texts').css('-webkit-border-bottom-right-radius','0px');
			$(this).find('.kc').css('border-bottom-left-radius','10px');
			$(this).find('.kc').css('border-bottom-right-radius','10px');
			$(this).find('.kc').css('-webkit-border-bottom-left-radius','10px');
			$(this).find('.kc').css('-webkit-border-bottom-right-radius','10px');
			$(this).find('img').css('border-bottom-left-radius','10px');
			$(this).find('img').css('border-bottom-right-radius','10px');
			$(this).find('img').css('-webkit-border-bottom-left-radius','10px');
			$(this).find('img').css('-webkit-border-bottom-right-radius','10px');
			$(this).css('box-shadow','');
			$(this).css('-webkit-box-shadow','');
			$(this).find('.titles').css('color','#333');
			$(this).find('.kcsm p em').css('color','#666');
		});
	});
	
}
