var jssec = 60;
var iw = 0;
var is = "loading";
var timer;
$(function () {
    ControlBinding();
})
function ControlBinding() {
    $("#getKey").click(function () {
        if ("disabled" == $("#getKey").attr("disabled")) {
            return false;
        }
        //发送短信。成功：60秒计时器。到时后才能重发
        SendCode();
        //change();
    });

    //手机号栏失去焦点
    $(".phone").blur(function () {
        checkPhone();
    });

    //手机号栏获得焦点
    $(".phone").focus(function () {
        $(".phone").parent().removeClass("errorC");
        $(".phone").parent().removeClass("checkedN");
        $(".error1").hide();
    });
    $("#btnsubmit").click(function () {
        fsubmit();
    })
}
function change() {
    var s = jssec + "秒后重发";
    jssec--;
    if (jssec > -1) {
        timer = setTimeout('change()', 1000);//调用自身实现
        $("#getKey").attr("disabled", true);
    }
    else {
        s = "重新发送";
        $("#getKey").removeAttr("disabled");
        clearTimeout(timer);
    }
    //移除
    $("#CheckCode").removeAttr("disabled");
    $("#btnsubmit").removeAttr("disabled");

    $("#getKey").text(s);
}
function SendCode() {
    if (!checkPhone()) { return };
    clearTimeout(timer);
    $(".phoneisexist").hide();
    wait();
    $.post("SendCodeForForget", { 'telephone': $("#Telephone").val(), '__RequestVerificationToken': $('input[name=__RequestVerificationToken]').val() }, function (data) {
        $(".phoneisexist").hide();
        clearTimeout(timer);
        if (!data) {
            $(".phoneisexist").show();
            $("#getKey").text("获取验证码");
            $("#getKey").removeAttr("disabled");
        } else {
            change();
        }
    });
}
function checkPhone() {
    reg = /^1[3|4|5|8][0-9]\d{4,8}$/i;//验证手机正则(输入前7位至11位)

    if ($(".phone").val() == "") {
        $(".phone").parent().addClass("errorC");
        $(".error1").html("请输入手机号");
        $(".error1").css("display", "block");
    }
    else if ($(".phone").val().length < 11) {
        $(".phone").parent().addClass("errorC");
        $(".error1").html("手机号长度有误！");
        $(".error1").css("display", "block");
    }
    else if (!reg.test($(".phone").val())) {
        $(".phone").parent().addClass("errorC");
        $(".error1").html("请输入正确的手机号!");
        $(".error1").css("display", "block");
    }
    else {
        $(".phone").parent().addClass("checkedN");
        return true;
    }
    return false;
}
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
function fsubmit() {
    if ($("form").valid()) {
        $("form").submit();
        $("#btnsubmit").attr("disabled", true);
    }
}