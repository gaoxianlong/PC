//点击组合课程
$('.mytc').each(function(){
	$(this).on('click',function(){
		$('.model_bg').css('display','block');
		$('.my_zhkc').css('display','block');
    });
});
//点击组合切换不同套餐
$('.zhkc-tabs p a').each(function(){
	$(this).on('click',function(){
		$('.zhkc-tabs p a').removeClass('zhkc-active');
		$(this).addClass('zhkc-active');
		$('.zhkc-main').css('display','none');
		$('.zhkc-main').eq($(this).index()).css('display','block');
    });
});
//点击关闭组合套餐窗口
$('.zhkc-close').on('click',function(){
	$('.model_bg').css('display','none');
	$('.my_zhkc').css('display','none');
});
//点击结算跳转到确认订单页面
$('.calBtn a').on('click',function(){
	if($(this).hasClass('btn_sty')){
		$(this).attr('href','../views/orders.html');
	}else{
		return;
	}
});

