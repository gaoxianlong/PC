package com.stk.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import sun.misc.BASE64Encoder; 
public class MD5Util2 {
	public static final String Md(String plainText,boolean judgeMD) {   
        StringBuffer buf = new StringBuffer("");   
        try {   
        MessageDigest md = MessageDigest.getInstance("MD5");   
        md.update(plainText.getBytes());   
        byte b[] = md.digest();   
        int i;   
        for (int offset = 0; offset < b.length; offset++) {   
            i = b[offset];   
            if(i<0) i+= 256;   
            if(i<16)   
            buf.append("0");   
            buf.append(Integer.toHexString(i));   
        }   
//      System.out.println("32位：result: " + buf.toString());//32位的加密   
//      System.out.println("16位：result: " + buf.toString().substring(8,24));//16位的加密   
  
        } catch (NoSuchAlgorithmException e) {   
        // TODO Auto-generated catch block   
        e.printStackTrace();   
        }   
        if(judgeMD == true){  
            return buf.toString();  
        }else{  
            return buf.toString().substring(8,24);  
        }  
          
    }   
    public static final String EncoderPwdByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {  
        // 确定计算方法  
        MessageDigest md5 = MessageDigest.getInstance("MD5");  
        BASE64Encoder base64en = new BASE64Encoder();  
        // 加密后的字符串  
        String newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));  
        return newstr;  
    }  
//测试   
    public static void main(String[] args) {   
        Md("a", true);   
        try {  
            System.out.println("64位：result: " + EncoderPwdByMd5("123456zq") + "**");  
        } catch (NoSuchAlgorithmException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e) {  
            // TODO Auto-generated catch block  
            e.printStackTrace();  
        }  
    } 
}
