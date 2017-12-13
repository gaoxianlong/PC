package com.stk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import test.EncoderHandler;
import com.stk.util.MD5Util;

@Controller
public class BackController {
	protected Logger log = Logger.getLogger(BackController.class);
	
  
	@RequestMapping(value="/pcimage")
	public void loginadmin(HttpServletRequest request,HttpServletResponse response) {
		 String content = "http://baidu.com";  
	        EncoderHandler encoder = new EncoderHandler();  
	        encoder.encoderQRCoder(content, response);  
	}
	 @RequestMapping(value = "/upload")  
	 @ResponseBody
	    public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {  
	  
	        System.out.println("开始");  
	        String path = request.getSession().getServletContext().getRealPath("cover");  
	        String uniqueName = file.getOriginalFilename(); 
	        String prefix = uniqueName
					.substring(uniqueName.lastIndexOf(".") + 1);
	        Date date = new Date(System.currentTimeMillis());
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");// 利用时间生成新文件名后再加扩展名生成完整名字
			
			String sa = dateFormat.format(date);
			String key =sa + "." + prefix;
//	        String fileName = new Date().getTime()+".jpg";  
	        System.out.println(path);  
	        File targetFile = new File(path, key);  
	        if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        //保存  
	        try {  
	            file.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	      
	        return key;  
	    }  
}
