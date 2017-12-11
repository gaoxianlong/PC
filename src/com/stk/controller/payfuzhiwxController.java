package com.stk.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import test.EncoderHandler;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.stk.entity.Users;
import com.stk.util.CommonUtil;
import com.stk.util.GetWxOrderno;
import com.stk.util.RequestHandler;
import com.stk.util.Sha1Util;
import com.stk.util.TenpayUtil;

@Controller
public class payfuzhiwxController {

	protected Logger log = Logger.getLogger(payfuzhiwxController.class);
	@RequestMapping(value="/pcorder")
	public void topayServletfuzhi(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "vipso",required = false,defaultValue="a") String vipso,
			@RequestParam(value = "seriesID",required = false) Integer seriesID,
			@RequestParam(value = "pric",required = false) String pric,
			@RequestParam(value = "check",required = false,defaultValue="1") String check,
			@RequestParam(value = "ordernum",required = false,defaultValue="1") String ordernum,
			
			 HttpSession session
			) throws WriterException, IOException {
		
		//1
		Users user = (Users) session.getAttribute("u");
		Integer idd=user.getID();
		String uid = String.valueOf(idd);
		//2
		String vipordeb=vipso;
		//3
		Integer serdd=seriesID;
		String serid = String.valueOf(serdd);
		//4
		String uuid = UUID.randomUUID().toString();
		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		String sa = dateFormat.format(date);
		String statu=uuid+sa;
		//5
		String xinprice=pric;
		
		//商户相关资料 		wx1d42fa2fba520d221510223996
		String appid = "wx1d42fa2fba520d22";
		String appsecret = "caf5381cc5b63cb108c0fece2324834c";
		String partner = "1393692002";
		String partnerkey = "caf5381cc5b63cb108c0fece2324834c";
		
		String attac=uid + "," + vipordeb+ "," +serid+ "," +statu+ "," +xinprice+ "," +check;
		
		String orderNo=ordernum;
		
		//String money = "1";
		String money = xinprice;
		
				//金额转化为分为单位
				float sessionmoney = Float.parseFloat(money);
				String finalmoney = String.format("%.2f", sessionmoney);
				finalmoney = finalmoney.replace(".", "");
			
				//获取openId后调用统一支付接口https://api.mch.weixin.qq.com/pay/unifiedorder
						String currTime = TenpayUtil.getCurrTime();
						//8位日期
						String strTime = currTime.substring(8, currTime.length());
						//四位随机数
						String strRandom = TenpayUtil.buildRandom(4) + "";
						//10位序列号,可以自行调整。
						String strReq = strTime + strRandom;
						
						//商户号
						String mch_id = partner;
						//子商户号  非必输
						//String sub_mch_id="";
						//设备号   非必输
						String device_info="";
						//随机数 
						String nonce_str = strReq;
						//商品描述
						//String body = describe;
						
						//商品描述根据情况修改
						String body = "课程";
						//附加数据
						
						String attach = attac;
						//商户订单号
						String out_trade_no = orderNo;
						int intMoney = Integer.parseInt(finalmoney);
						
						//总金额以分为单位，不带小数点
						int total_fee = intMoney;
						//订单生成的机器 IP
						//String spbill_create_ip = request.getRemoteAddr();
						String spbill_create_ip ="222.128.104.246";
						
						//这里notify_url是 支付完成后微信发给该链接信息，可以判断会员是否支付成功，改变订单状态等。
						String notify_url ="http://www.shoutike.com/wx/notifyServlet";
						
						String trade_type = "NATIVE";
					
						//非必输
//						String product_id = "";
						SortedMap<String, String> packageParams = new TreeMap<String, String>();
						packageParams.put("appid", appid);  
						packageParams.put("mch_id", mch_id);  
						packageParams.put("nonce_str", nonce_str);  
						packageParams.put("body", body);  
						packageParams.put("attach", attach);  
						packageParams.put("out_trade_no", out_trade_no);  
						//这里写的金额为1 分到时修改
						//packageParams.put("total_fee", "1");  
						packageParams.put("total_fee", finalmoney);  
						packageParams.put("spbill_create_ip", spbill_create_ip);  
						packageParams.put("notify_url", notify_url);  
						packageParams.put("trade_type", trade_type);  
						
						RequestHandler reqHandler = new RequestHandler(request, response);
						reqHandler.init(appid, appsecret, partnerkey);
						
						String sign = reqHandler.createSign(packageParams);
						
						String xml="<xml>"+
								"<appid>"+appid+"</appid>"+
								"<mch_id>"+mch_id+"</mch_id>"+
								"<nonce_str>"+nonce_str+"</nonce_str>"+
								"<sign>"+sign+"</sign>"+
								"<body><![CDATA["+body+"]]></body>"+
								"<attach>"+attach+"</attach>"+
								"<out_trade_no>"+out_trade_no+"</out_trade_no>"+
								//金额，这里写的1 分到时修改
								//"<total_fee>"+1+"</total_fee>"+
								"<total_fee>"+finalmoney+"</total_fee>"+
								"<spbill_create_ip>"+spbill_create_ip+"</spbill_create_ip>"+
								"<notify_url>"+notify_url+"</notify_url>"+
								"<trade_type>"+trade_type+"</trade_type>"+
								"</xml>";
						System.out.println(xml);
						String allParameters = "";
						try {
					
							allParameters =  reqHandler.genPackage(packageParams);
							
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						String createOrderURL = "https://api.mch.weixin.qq.com/pay/unifiedorder";
						String codeurl="";
						try {
							
							new GetWxOrderno();
							codeurl = GetWxOrderno.getPc(createOrderURL, xml);
							
							if(codeurl.equals("")){
								request.setAttribute("ErrorMsg", "统一支付接口获取预支付订单出错");
								response.sendRedirect("error.jsp");
							}
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
									
//				try {
//					response.sendRedirect("pc.jsp?codeurl="+codeurl);
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
						
						
						 response.setHeader("Cache-Control", "no-store");
						 response.setHeader("Pragma", "no-cache");
						 response.setDateHeader("Expires", 0);
						 response.setContentType("image/png");

						    Map<EncodeHintType, Object> hints = new HashMap<>();
						    hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
						    hints.put(EncodeHintType.MARGIN, 0);
						    
						    BitMatrix bitMatrix = new MultiFormatWriter()
						            .encode(codeurl, BarcodeFormat.QR_CODE, 300, 300, hints);
						    
						    MatrixToImageWriter.writeToStream(bitMatrix, "png", response.getOutputStream());
		
	}
}
