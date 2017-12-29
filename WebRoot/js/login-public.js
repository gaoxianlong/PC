//搜索框获取焦点
$('.form-text').focus(function(){
	$(this).next().addClass('submit-focus');
});
$('.form-text').blur(function(){
	$(this).next().removeClass('submit-focus');
});
 //登录注册
$('.login-tab span').on('click',function(){
	$('.login-tab span').removeClass('active-title');
	$(this).addClass('active-title');
	$('.login-con').removeClass('logreg-active');
	$('.login-con').eq($(this).index()).addClass('logreg-active');
});
//点击顶部导航的登录 注册效果
$('.nav-login .nav-dlzc').on('click',function(){
//	console.log($('.nav-login .nav-dlzc'));
//	console.log($('.nav-login .nav-dlzc').length);
//	console.log($(this).html());
//	console.log($(this).index()-1);
	$('.login-mask').css('display','block');
	$('.login').css('display','block');
	$('.login-tab span').removeClass('active-title');
	$('.login-tab span').eq($(this).index()-2).addClass('active-title');
	$('.login .login-con').removeClass('logreg-active');
	$('.login .login-con').eq($(this).index()-2).addClass('logreg-active');
});
//点击登录的 关闭按钮
$('.btn-close').on('click',function(){
	$('.login-mask').css('display','none');
	$(this).parent().parent().css('display','none');
});

//点击完善资料中的跳过  提交注册信息后的 函数回调
$('.tjzl span').on('click',function(){
	$('.login-mask').css('display','none');
	$('.login').css('display','none');
	$('.register-next').css('display','none');
});
//手机号栏获得焦点
$("#UserName").focus(function () {
    $(".error").hide();
    $('.error').removeClass("error");
});
 
//用户栏失去焦点 登录
$('#UserName').blur(function(){
	checkPhone($(this));
	
});
 //密码栏失去焦点(mainform1)
$(".password").blur(function () {
    checkPass($(this));
});
//记住我

//每次页面加载时查看之前是否记住用户名和密码

$(document).ready(function(){

//如果cookie存在 那么获取cookie的值
	
	if ($.cookie("rmbUser") == "true") { 
		
				
		$("#rmbUser").attr("checked", true); 
		
		$("#UserName").val($.cookie("username-stk")); 
		
		$("#login-pass").val($.cookie("password-stk")); 
	
	}
	 
});

//点击监控是否勾选记住我

$('#RememberMe').change(function(){
	
	if($(this).is(':checked')){
	
		$(this).attr('data-check','true');
	
	}else{
		
		$(this).attr('data-check','false');
	
	}
});
//登录页面的 点击登录按钮
$('.login-btn').click(function(){
	var phone=$("#UserName").val();
	var pwd=$("#login-pass").val();
	
		if(!checkPhone($("#UserName"))||!checkPass($("#login-pass"))){
			e.preventDefault();
            alert('登录失败');
            console.log(checkPhonedl($("#UserName")),checkPass($("#login-pass")));
		}else{
			$.post("selectphone","telephone="+phone+"&password="+pwd,function(date){
				
				
				if(date.length>4){
					$("#passid").html("您的手机号或者密码输入错误。");
			      
				}else{
				if($('#RememberMe').attr('data-check') == 'true'){
		            	var userName = $("#UserName").val(); 
		                var passWord = $("#login-pass").val(); 
		                //存储一个带7天期限的cookie
		            	$.cookie("rmbUser", "true", { expires: 7 }); 
		            	$.cookie("username-stk", userName, { expires: 7 });
		            	$.cookie("password-stk", passWord, { expires: 7 });
		            }else{
		            	$.cookie("rmbUser", "false", { expire: -1 });
		            	$.cookie("username-stk", "", { expires: -1 });
		            	$.cookie("password-stk", "", { expires: -1 });
		            }
					//location.href ="getmenuindex.action";	
				location.reload();	
				}
			});
		}
	});


//注册效果
//点击获取验证码效果
var jssec = 60;
var iw = 0;
var is = "loading";
var timer;

ControlBinding();
function ControlBinding() {
	//点击获取验证码代码
    $("#getKey").click(function () {
    	
        if ("disabled" == $("#getKey").attr("disabled")) {
 
            return false;
        }
        //发送短信。成功：60秒计时器。到时后才能重发
        SendCode();
        //changes(); 短信成功后 才调用 
    });

    //手机号栏失去焦点
    $('#myUserName').blur(function(){
		checkPhone($(this));
		console.log(checkPhone($(this)));
	});

    //手机号栏获得焦点
    $("#myUserName").focus(function () {
    	 $(".error").hide();
         $('.error').removeClass("error");
    });
    
    //验证码失去焦点
    $('#code').blur(function(){
    	$('#cSpan').show();
		checkCode($("#codeSpan"));
	});
    //验证码获取焦点
    $('#code').focus(function(){
		$('#cSpan').hide();
	});
    
    //短信验证码 获取焦点
    $('#CheckCode').focus(function(){
		$('#randomSpan').html('');
	});
    
	//密码框获得焦点
	$('.password').focus(function(){
        $(".error1").hide();
        $('.error1').removeClass("error1");
	});
    //密码框失去焦点
    $('.password').blur(function(){
		checkPass($(this));
	});
	
    //监控是否接受手提课协议条款
	$('#agree-check').change(function(){
		if($(this).is(':checked')){
			$(this).attr('data-check','true');
			console.log($(this).attr('data-check'));
		}else{
			$(this).attr('data-check','false');
			console.log($(this).attr('data-check'));
		}
	});
	
	//点击注册 提交form表单
	fnzc();
}
//点击获取验证码后 等待发送时 加载状态
function wait() {
    if (iw++ < 3) {
        is += ".";
    } else {
        is = "loading";
        iw = 0;
    }
    $("#getKey").attr("disabled", true);
    $("#getKey").text(is);
    timer = setTimeout('wait()', 1000);//调用自身实现
}
//点击获取验证码后 60秒内效果不能在点击  输入验证码框 可以输入 60秒后才能点击重新发送
function changes() {
	//如果过了60秒后 按钮的disabled为 true  即可再点 否则 为false 不能再点 然后移出输入验证码栏的 disabled 可以输入
   
	var s = jssec + "秒后重发";
    jssec--;
    if (jssec > -1) {
        timer = setTimeout('changes()', 1000);//调用自身实现
        $("#getKey").attr("disabled", true);
    }
    else {
        s = "重新发送";
        $("#getKey").attr("disabled", false);
        clearTimeout(timer);
    }
    //移除
    $("#CheckCode").removeAttr("disabled");
    $("#zc-btn").removeAttr("disabled");

    $("#getKey").text(s);
}

//如果验证码和手机号码都正确 可以点击 获取验证码 然后注册登录
function SendCode() {
	
	var phone=$("#myUserName").val();
	console.log(phone);
	console.log(checkPhone($('#myUserName')));

    if (!checkPhone($('#myUserName'))||!checkCode($("#codeSpan"))) { return; };
   
    clearTimeout(timer);
    wait();
    $.post("SendCodeSMS","telephone="+phone,function (data) {
    	clearTimeout(timer);
    
        if (data) { //如果有返回值 也就是后台接收到数据 就调用 changes 让输入框可以输入 并且 获取验证码按钮不能点击 60秒后 才能点击
       	changes();	
        } else {
        	$('#myUserName').next().addClass("error");
            $(".error").html("请直接登录！");
            $(".error").css("color","red"); 
            $(".error").show();
            $("#getKey").text("获取验证码");
            $("#getKey").attr("disabled", false);
        }
    });
}

//点击注册按钮时 form表单提交
function fnzc(){
	
	$("#zc-btn").click(function () {
        $('#reg-form').submit(function(e){
        	
        	//判断 手机号 验证码 密码 是否同意条款 只要有一个没有填或选中 就注册失败
			if(!checkPhone($("#myUserName"))||!checkPass($("#zc-pass"))||!checkCode($("#codeSpan"))||!$("#agree-check").attr('data-check')||$("#CheckCode").attr("disabled")=="disabled"){
//					console.log(!checkPhone($("#myUserName")),!checkPass($("#zc-pass")),!checkCode(),!$("#agree-check").attr('data-check'));
				alert('注册失败');
				//e.preventDefault();
				
			}else{
				//注册成功跳转到完善资料页面
				//$('#reg-form').submit();
				var phone=$("#myUserName").val();
				var pwd=$("#zc-pass").val();
				$.post("addUsers","telephone="+phone+"&password="+pwd,function(data) {
			   	});
				console.log('注册成功');
				$('.login').css('display','none');
                $('.register-next').css('display','block');
                
                e.preventDefault();
			}
		});
    });
}

//手机号码验证
function checkPhone(obj) {
    reg = /^1[3|4|5|7|8][0-9]\d{4,8}$/i;//验证手机正则(输入前7位至11位)

    if (obj.val().length == 0) {
        obj.next().addClass("error");
        $(".error").html("请输入手机号");
        $(".error").show();
        return false;
    }
    else if (obj.val().length < 11) {
        obj.next().addClass("error");
        $(".error").html("手机号长度有误！");
        $(".error").show();
        return false;
    }
    else if (!reg.test(obj.val())) {
        obj.next().addClass("error");
        $(".error").html("请输入正确的手机号!");
        $(".error").show();
        return false;
    }
    else {
    	return true;

    }
    
}

/*注册创建验证码*/
createCode($('#codeSpan'));
//创建验证码函数封装
function createCode(obj){
	//创建随机四位数字和字母 验证码
    var code = "";
	var codeLength = 4; //验证码的长度 
	var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
		'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //随机数 
	for(var i = 0; i < codeLength; i++) { //循环操作 
		var index = Math.floor(Math.random() * 36); //取得随机数的索引（0~35） 
		code += random[index]; //根据索引取得随机数加到code上 
	}
	obj.html(code); //把code值赋给验证码 
	
}

/*验证码校验*/
function checkCode(obj){
	//获取codeSpan对象 自动生成的验证码
	var wcode = obj.html();
	//获取用户书写的验证码
    var ucode=obj.prev().val().toUpperCase(); //转化为大写
	//获取span对象
	var span=obj.next();
	//开始校验
	if(ucode==""||ucode==null){
		span.html("验证码不能为空");
		span.css('color','red');
		return false;
	}else if(ucode==wcode){
		span.html("验证码OK");
	span.css('color','green');
		return true;
	}else{
		span.html("验证码不正确");
		span.css('color','red');
		return false;
	}
}
//短信校验代码  传到后台验证  注册
	function checkrandomSpan(){
		
		//获取span
		var span = $('#randomSpan');
		//获取用户书写的验证码
		var random=$("#CheckCode").val();
		//开始校验
		if(random==""||random==null){
			span.html("验证码不能为空");
			span.css('color','red');
			return false;
		}else {
			$.post("CheckVcode","vcode="+random,function(data){
				
				if(data.length<5){
				
					span.html("验证码OK");
					span.css('color','green');
					return true;
				}else{
					span.html("验证码不正确");
					span.css('color','red');
					return false;
				}
			});
	}
	}

	//短信校验代码  传到后台验证  忘记
	function checkrandomforget(){
		
		//获取span
		var span = $('#forget-randomSpan');
		//获取用户书写的验证码
		var random=$("#forget-CheckCode").val();
		//开始校验
		if(random==""||random==null){
			span.html("验证码不能为空");
			span.css('color','red');
			return false;
		}else {
			$.post("CheckVcode","vcode="+random,function(data){
				
				if(data.length<5){
				
					span.html("验证码OK");
					span.css('color','green');
					return true;
				}else{
					span.html("验证码不正确");
					span.css('color','red');
					return false;
				}
			});
	}
	}
	function cc(){
		//alert($("#forget-randomSpan").html().length);
		if($("#forget-randomSpan").html().length>6){
			return false;
		}else{
			return true;
		}
	}
//密码验证
function checkPass(obj){
	reg1 = /^.*[\d]+.*$/;
    reg2 = /^.*[A-Za-z]+.*$/;
    reg3 = /^.*[_@#%&^+-/*\/\\]+.*$/;//验证密码
    
    var Pval = obj.val();
    if (Pval == '') {
        obj.next().addClass("error1");
        $(".error1").html("请填写密码");
        $(".error1").show();
    }
    else if (Pval.length > 16 || Pval.length < 8) {
        obj.next().addClass("error1");
        $(".error1").html("密码应为8-16个字符，区分大小写");
        $(".error1").show();
    }
	else if (!((reg1.test(Pval) && reg2.test(Pval)) || (reg1.test(Pval) && reg3.test(Pval)) || (reg2.test(Pval) && reg3.test(Pval)))) {
	    obj.next().addClass("error1");
	    $(".error1").html("需至少包含数字、字母和符号中的两种类型");
	    $(".error1").show();
	}
    else {
       
        return true;
    }
    return false;
}




//找回密码
//点击登录页面的忘记密码 效果
$('.login-forget').click(function(){
	$('.login').css('display','none');
	$('.forgetpass').css('display','block');
});
//手机号栏失去焦点
$('#forget-call').blur(function(){
	checkPhone($(this));
	
});

//手机号栏获得焦点
$("#forget-call").focus(function () {
  $(this).parent().removeClass("error");
  $(this).parent().removeClass("checkedN");
  $(".error").hide();
  $(".error").removeClass('error');
});
//生成验证码
createCode($('#forget-codeSpan'));
//验证码失去焦点
$('#forget-code').blur(function(){
	$('#forget-cSpan').show();
	checkCode($('#forget-codeSpan'));
});
//验证码获取焦点
$('#forget-code').focus(function(){
	$('#forget-cSpan').hide();
});

//短信验证码 获取焦点
$('#forget-CheckCode').focus(function(){
	$('#forget-randomSpan').html('');
});

//密码框获得焦点
$('.password').focus(function(){
	$("#myUserName").parent().removeClass("error");
  $("#myUserName").parent().removeClass("checkedN");
  $(".error1").hide();
  $(".error1").removeClass('error1');
  
});
//密码框失去焦点
$('.password').blur(function(){
	checkPass($(this));
});
//点击获取验证码 获取短信验证
$("#forget-getKey").click(function (e) {
	console.log($(this).html());
	console.log( $("#forget-getKey").attr("disabled"));
  if ("disabled" == $("#forget-getKey").attr("disabled")) {
	  console.log("disabled" == $("#forget-getKey").attr("disabled"));
      return false;
  }
  //发送短信。成功：60秒计时器。到时后才能重发
  forgetSendCode();
  //changes(); 短信成功后 才调用 
});
//点击获取验证码后 等待发送时 加载状态
function waitforget() {	
    if (iw++ < 3) {
        is += ".";
    } else {
        is = "loading";
        iw = 0;
    }
    $("#forget-getKey").attr("disabled", true);
    $("#forget-getKey").text(is);
    timer = setTimeout('waitforget()', 1000);//调用自身实现  
}
//退出
function cookies(){
		$.cookie("password-stk", "", { expires: 0});

}

//提交找回密码 form表单
$('#forget-btn').click(function(){
	var phone=$("#forget-call").val();
	var pwd=$("#forget-pass").val();
	$('#forget-form').submit(function(e){
      	//判断 手机号 验证码 密码 是否同意条款 只要有一个没有填或选中 就注册失败
		
			if(!checkPhone($("#forget-call"))||!checkPass($("#forget-pass"))||!cc()){
//					console.log(!checkPhone($("#forget-call"))||!checkPass($("#forget-pass"))||!checkCode($('#forget-codeSpan')));
				e.preventDefault();
				alert('操作失败');
			}else{
				//提交到 
				$.post("updatepwd.action","telephone="+phone+"&password="+pwd,function(data){
					if(data){
						alert("找回密码成功");
						e.preventDefault();
						console.log('注册成功');
						$('.forgetpass').css('display','none');
						window.location.reload();
					}
					
				});

			}
		});
});

//如果验证码和手机号码都正确 可以点击 获取验证码 然后注册登录
function forgetSendCode() {
	var phone=$("#forget-call").val();
	
	console.log(!checkPhone($('#forget-call')));
	console.log(!checkCode($('#forget-codeSpan')));
  if (!checkPhone($('#forget-call'))||!checkCode($('#forget-codeSpan'))) { return; };
  clearTimeout(timer);
  
  waitforget();
  $.post("forgetpwd","telephone="+phone,function (data) {
      clearTimeout(timer);
   
      if (data) { //如果有返回值 也就是后台接收到数据 就调用 change 让输入框可以输入 并且 获取验证码按钮不能点击 60秒后 才能点击
    	  $('.login-mask').hide();
    	  forgetchanges();
    	  
      } else {
        
          $("#forget-getKey").text("获取验证码");
          $("#gorget-getKey").attr("disabled", false);
      }
  });
}

//点击获取验证码后 60秒内效果不能在点击  输入验证码框 可以输入 60秒后才能点击重新发送
function forgetchanges() {
	//如果过了60秒后 按钮的disabled为 true  即可再点 否则 为false 不能再点 然后移出输入验证码栏的 disabled 可以输入
  var s = jssec + "秒后重发";
  jssec--;
  if (jssec > -1) {
      timer = setTimeout('forgetchanges()', 1000);//调用自身实现
      $("#forget-getKey").attr("disabled", true);
  }
  else {
      s = "重新发送";
      $("#forget-getKey").attr("disabled", false);
      clearTimeout(timer);
  }
  //移除
  $("#forget-CheckCode").removeAttr("disabled");
  $("#forget-btn").removeAttr("disabled");

  $("#forget-getKey").text(s);
}


//优惠码失去焦点
$('#preferential').blur(function(){
	
	yhm($(this));
});
//优惠码获取焦点
$('#preferential').focus(function(){
	$(".error2").hide();
	$(".error2").hide();
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
        $(".error2").css('color','red');
        $(".error2").html("请填写优惠码");
        $(".error2").show();
        $("#preferential").val("");
    }
    else if (Pval.length != 18||!(reg1.test(Pval))) {
        obj.next().addClass("error2");
        $(".error2").css('color','red');
        $(".error2").html("优惠码为以STK开头后面是数字的18个字符");
        $(".error2").show();
        $("#preferential").val("");
    }
    else {
    	$.post("gethelpCode.action","HelpCode="+Pval,function(date){
    	
    		if(date.length<5){
    			 $(".error2").hide();
    		        obj.parent().addClass("checkedN");
    		        obj.next().addClass("error2");
    		        $(".error2").css('color','green');
        	        $(".error2").html("绑定成功");
        	       
        	        $(".error2").show();
    		        return true;	
    		}else{
    			obj.next().addClass("error2");
    			$(".error2").css('color','red');
    	        $(".error2").html("优惠码错误");
    	        $(".error2").show();
    	        $("#preferential").val("");
    		}
    	});
       
    }
    return false;
}
//鼠标移入VIP效果
$('.nav-vip a').hover(function(){
	$(this).css('color','#d21213');
	$(this).next().slideDown();
},function(){
	$(this).css('color','#fff');
	$(this).next().slideUp();
});
