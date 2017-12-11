package com.stk.controller.gao.test;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class txt2String {

	public static String txt2String(File file){
		
        StringBuilder result = new StringBuilder();
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"gbk"));
            		//BufferedReader(new FileReader(file),"UTF-8");//构造一个BufferedReader类来读取文件
            String s = null;
            while((s = br.readLine())!=null){//使用readLine方法，一次读一行
                result.append(System.lineSeparator()+s);
            }
            br.close();    
        }catch(Exception e){
            e.printStackTrace();
        }
        return result.toString();
    }
    @RequestMapping("/vv")
    @ResponseBody
    public String  vv(Map<String, Object> map,HttpSession session){
        File file = new File("D:/lrcd.lrc");
        String tr=txt2String(file);
        System.out.println(tr);
        //map.put("tr", tr);
       // session.setAttribute("tr", tr);
		//return "tes.jsp";
        return tr;
    
    }
}
