
//未注册优惠码 点击课程的弹窗效果
$('#fpzc-yhm').blur(function(){
//	alert($(this));
	yhm($(this));
});
$('#fpzc-yhm').focus(function(){
//	alert($(this));
	$(".error2").hide();
	$(".error2").removeClass('error2');
});

//点击提交扶贫优惠码
$('#fpzc-btn').click(function(){
	$('#fpzc-form').submit(function(e){
		if(!yhm($('#fpzc-yhm'))){
				e.preventDefault();
				alert('登录失败');
			}else{
				//注册成功
				
				console.log('注册成功');
				$('.fpzc').css('display','none');
                $('.login-mask').css('display','none');
                e.preventDefault();
			}
	});
});
//小写转大写，函数封装
function toUpperCase(str){
	 str = str.toUpperCase();
	 return str;
	}

//优惠码验证
function yhm(obj){
	var stk=obj.val().substring(0,3);
	var stkold = obj.val().substring(3);
	var Pval = toUpperCase(stk)+stkold;
	
	alert(Pval);
	reg1 = /^STK\d{15}$/;
  
  if (Pval == '') {
      obj.next().addClass("error2");
      $(".error2").html("*请填写优惠码");
      $(".error2").show();
      $("#preferential").val("");
  }
  else if (Pval.length != 18||!(reg1.test(Pval))) {
      obj.next().addClass("error2");
      $(".error2").html("*优惠码为以STK开头后面是数字的18个字符");
      $(".error2").show();
      $("#preferential").val("");
  }
  else {
  	
  	$.post("gethelpCode.action","HelpCode="+Pval,function(date){
  		
  		if(date.length<5){
  			 $(".error2").hide();
  		        obj.parent().addClass("checkedN");
  		        alert("绑定成功。");
  		        $('.fpzc').css('display','none');
                  $('.login-mask').css('display','none');
  		        return true;	
  		}else{
  			obj.next().addClass("error2");
  	        $(".error2").html("优惠码错误");
  	        $(".error2").show();
  	        $("#preferential").val("");
  	       
  		}
  	});
     
  }
  return false;
}

