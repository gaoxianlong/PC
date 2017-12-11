//banner
var num = 0;
var timer;
//循环焦点 批量绑定鼠标移入移出事件
$('.iconlist .icon-item').each(function(){
	$(this).on('mouseover',function(){
		//移入时清除定时器
		clearInterval(timer);
		//记录移入当前的文字焦点的下标 赋值给num
		num = $(this).index();
//		console.log(num);
        //清除所有 添加当前焦点
        $('.banner-item').each(function(){
			$(this).removeClass('banneractive');
		});
		
			$(this).addClass('iconactive');
			$(this).siblings().removeClass('iconactive');
		
		//添加当前的轮播图和文字焦点的属性和动画
		$('.banner-item').eq(num).addClass('banneractive');
		$('.banner-item').eq(num).animate({opacity:'1'});
		
		
	});
	//移出时开启定时器
	$(this).on('mouseout',function(){
		
        setbanner();
	});
});
//定时器 轮播图自动播放
setbanner();
function setbanner(){
	timer = setInterval(function(){
		num++;
		num = num%($('.banner-item').length);
//		console.log(num)
		//清除所有焦点class
        $('.banner-item').each(function(){
			$(this).removeClass('banneractive');
		});
		$('.iconlist .icon-item').each(function(){
			$(this).removeClass('iconactive');
			
		});
	
		//添加当前的轮播图和文字焦点的属性和动画
		$('.banner-item').eq(num).css('opacity','0');
		$('.banner-item').eq(num).addClass('banneractive');
		$('.banner-item').eq(num).animate({opacity:'1'});
//		$('.icon-item').eq(num).css('height','80px;');
		$('.iconlist .icon-item').eq(num).addClass('iconactive');
		
	},3000);
}


//根据tabs里的内容多少 设置宽度
$('.tabs').each(function(i,e){
	var $tabsWidth = 0;
	$(e).children().each(function(i,e){
		$tabsWidth += $(e).outerWidth(true);
	});
	$(e).css('width',$tabsWidth);
//	console.log($(e).width());
});
//内容部分轮播效果
conBanner($('#next1'),$('#prev1'));
conBanner($('#next2'),$('#prev2'));
conBanner($('#next3'),$('#prev3'));
conBanner($('#next4'),$('#prev4'));
conBanner($('#next5'),$('#prev5'));
conBanner($('#next6'),$('#prev6'));
conBanner($('#next7'),$('#prev7'));
conBanner($('#next8'),$('#prev8'));
conBanner($('#next9'),$('#prev9'));
conBanner($('#next10'),$('#prev10'));

//内容部分点击下一个上一个
function conBanner(obj1,obj2){
	var page = 0;
	obj1.on('click',function(){
		page++;
		var $left = $('.stk-body').width();
		var $bann = $(this).siblings('.stk-body').children('.tabs');
		//获取当前容器的tabs的宽度
		var $bannerWidth = $bann.width();
	//	根据容器的宽度/点击移动的宽度 得出移动的次数
		var $bannLength = Math.ceil($bannerWidth/$left);
	//	console.log($bannLength);
	//	判断如果page等于$bannLength 说明是最后一张 不能在移动了;
		if(page > $bannLength-1){
			page = $bannLength-1;
			return;
		}
		console.log(page)
		$bann.animate({left: '-'+$left*page+'px'},1000);
	    obj2.css('display','block');
	});
	
	obj2.on('click',function(){
		page--;
		var $bann = $(this).siblings('.stk-body').children('.tabs');
		var $left = $('.stk-body').width();
	    if(page <= 0){
	//  	console.log(page)
			obj2.css('display','none');
		}else{
			obj2.css('display','block');
		}
		$bann.animate({left: '-'+$left*page+'px'},1000);
	});
	
	//下一组的显示隐藏状态
	//判断是否显示
	var $tabsWidth = obj1.siblings('.stk-body').children('.tabs').width();
	var $stkbodyWidth = obj1.siblings('.stk-body').width();
	//如果内容的宽度大于容器的宽度 就出现
	if($tabsWidth/$stkbodyWidth > 1){
		obj1.show();
	}else{
		obj1.hide();
	}

}

//右侧边栏导航效果
//把body提前储存起来 方便下次查找  给锚点跳转添加动画 
var $root = $('html, body');
$('#myNavbar a').click(function() {
    $root.animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    return false;
});
$('#mynav a').click(function() {
    $root.animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    return false;
});
/*判断当在第一屏的时候，回到顶部按钮的时候隐藏*/
$(window).scroll(function(){
    if($(window).scrollTop()>100){ //垂直滚动条offset
        $("#mynav").show();
    }else{
        $("#mynav").hide();
    }
}); 


//课程分类鼠标移入效果

$('.kc_mask').hover(function(){
	$(this).prev('img').css('transform','scale(1.4)');
	$(this).css('background','rgba(0,0,0,.3)');
},function(){
	$(this).prev('img').css('transform','');
	$(this).css('background','');
});

