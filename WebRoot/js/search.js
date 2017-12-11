//切换最新最热
$('.search-tabs a:first-child').addClass('search-active');
$('.search-tabs a').on('click',function(){
	$('.search-tabs a').removeClass('search-active');
	$(this).addClass('search-active');
	$('.search-con').hide();
	$('.search-con').eq($(this).index()).show();
});
