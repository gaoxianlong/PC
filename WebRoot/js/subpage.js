//筛选条件
fn($("[name='mode']"));
fn($("[name='stage']"));
fn($("[name='board']"));
function fn(arr){
	arr.each(function(){
		//console.log($(this).attr('data-id')+$(this).attr('value'));
		if($(this).attr('data-id')==$(this).attr('value')){
			//console.log(55);
			
			$(this).addClass('on');
			
		}
	});
}

//左侧边栏 热门精品微课
$('.sidebar li').first().addClass('side-active');
$('.sidebar li').hover(function(){
	$('.sidebar li').removeClass('side-active');
	$(this).addClass('side-active');
},function(){
	$(this).addClass('side-active');
});

//右边内容tabs切换效果
$(".tabs").on('click',function(){
	$(".tabs").removeClass('tabs-active');
	$(this).addClass('tabs-active');
	$('.tabs-con').css('display','none');
	$('.tabs-con').eq($(this).index()).css('display','block');
});
