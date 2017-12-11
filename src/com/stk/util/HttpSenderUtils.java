package com.stk.util;

import javax.servlet.http.HttpSession;

import com.aliyun.mns.model.BatchSmsAttributes;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.stk.entity.OrderSms;

public class HttpSenderUtils
{
  public static String createRandomVcode()
  {
    String vcode = "";
    for (int i = 0; i < 6; i++) {
      vcode = vcode + (int)(Math.random() * 9.0D);
    }
    System.out.println(vcode);
    
    return vcode;
  }
  
  /**封装发送短信方法*/
  public static void fasong(String telephone,HttpSession session) throws Exception{
	    System.out.println("短信验证码");
	    String vcode = HttpSenderUtils.createRandomVcode();
	    session.setAttribute("vcode", vcode);
	    OrderSms sms = new OrderSms();
	    
	    System.setProperty("sun.net.client.defaultConnectTimeout", "10000");
	    System.setProperty("sun.net.client.defaultReadTimeout", "10000");
	    
	    String product = "Dysmsapi";
	    String domain = "dysmsapi.aliyuncs.com";
	    
	    String accessKeyId = "aJjWwUSjpYtA25g3";
	    String accessKeySecret = "naQPJcccQEYDoBJlRnO3TcmojNrCRL";
	    
	    IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", 
	      "aJjWwUSjpYtA25g3", "naQPJcccQEYDoBJlRnO3TcmojNrCRL");
	    DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi", 
	      "dysmsapi.aliyuncs.com");
	    IAcsClient acsClient = new DefaultAcsClient(profile);
	    
	    SendSmsRequest request1 = new SendSmsRequest();
	    
	    request1.setMethod(MethodType.POST);
	    
	    request1.setPhoneNumbers(telephone);
	    
	    request1.setSignName("手提课");
	    
	    request1.setTemplateCode("SMS_97010046");
	    request1.setTemplateParam("{\"code\":\"" + vcode + "\"}");
	    BatchSmsAttributes.SmsReceiverParams smsReceiverParams = new BatchSmsAttributes.SmsReceiverParams();
	    
	    smsReceiverParams.setParam("code", vcode);
	    
	    request1.setOutId("yourOutId");
	    
	    SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request1);
	    if ((sendSmsResponse.getCode() != null) && 
	      (sendSmsResponse.getCode().equals("OK"))) {
	    }
  }
}
  