//监控奖学金是否选中使用
$('#checks').change(function(){
	if($(this).is(':checked')){
		var jxj = $(this).next('span').html().replace(/\D|^0/g,'')/100;
		$('#jxjMoney').html('-￥'+jxj);
		lastmoney();
	}else{
		$('#jxjMoney').html('-￥00.00');
		lastmoney();
	}

});

//最后的总计金额
lastmoney();
function lastmoney(){
	var oldmoney = $('#oldMoney').html().replace(/\D|^0/g,'');
	var zhmoney = $('#zhMoney').html().replace(/\D|^0/g,'');
	var jxjmoney = $('#jxjMoney').html().replace(/\D|^0/g,'');
	var lastmoney = (oldmoney - zhmoney -jxjmoney)/100;
	$('#lastMoney').html('￥'+lastmoney);
}

