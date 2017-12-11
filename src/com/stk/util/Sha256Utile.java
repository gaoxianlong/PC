package com.stk.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

import org.junit.Test;

/**密码加密**/
public class Sha256Utile {
		/**编码转换为16字节*/
	public static String converByteToHexString(byte[] bytes){
		String result="";
		for(int i=0;i<bytes.length;i++){
			int temp = bytes[i]& 0xff;
			String tempHex=Integer.toHexString(temp);
			if(tempHex.length()<2){
				result += "0"+tempHex;
			}else{
				result += tempHex;
			}
		}
		return result;
	}
	/**用jdk自带的加密算法
	 * @return */
	public static String jdksha(String ma){
		MessageDigest sha256Didst;
		String shapwd = null;
		try {
			sha256Didst = MessageDigest.getInstance("SHA-256");
			byte [] sha265code=sha256Didst.digest(ma.getBytes());
			shapwd=converByteToHexString(sha265code).toUpperCase();
			System.out.println("jdk  256加密后     :"+converByteToHexString(sha265code).toUpperCase());
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return shapwd;	
	}
	  //倒输
    public void swap(char[] arr, int begin, int end) {  
        while(begin < end) {  
            char temp = arr[begin];  
            arr[begin] = arr[end];  
            arr[end] = temp;  
            begin++;  
            end--;  
        }  
    }  
     
    public String swapWords(String str) {  
        char[] arr = str.toCharArray();  
        swap(arr, 0, arr.length - 1);  
        int begin = 0;  
        for (int i = 1; i < arr.length; i++) {  
            if (arr[i] == ' ') {  
                swap(arr, begin, i - 1);  
                begin = i + 1;  
            }  
        }  
  
        return new String(arr);  
    }  
     /**随机数*/
    public static  String getSalt() {
		String[] arr = {"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g"};
				
		String str1 = "";
		for(int i=1 ; i < 9;i++){
			int a = new Random().nextInt(17);
			String s = arr[a];
			str1 = str1 + s;
		}
		
		String str2 = "";
		for(int i =1;i < 5;i++){
			int a = new Random().nextInt(17);
			String s = arr[a];
			str2 = str2 + s;
		}
		
		String str3 = "";
		for(int i =1;i < 5;i++){
			int a = new Random().nextInt(17);
			String s = arr[a];
			str3 = str3 + s;
		}
		
		String str4 = "";
		for(int i =1;i < 5;i++){
			int a = new Random().nextInt(17);
			String s = arr[a];
			str4 = str4 + s;
		}
		
		String str5 = "";
		for(int i =1;i < 13;i++){
			int a = new Random().nextInt(17);
			String s = arr[a];
			str5 = str5 + s;
		}
		
		String string = str1+"-"+str2+"-"+str3+"-"+str4+"-"+str5;
		
		return string;
	}
   
	
	
	/**测试*/
	public static void main(String [] args){
		String str="47a516fa-4938-b065-a3bg-7c55g6ec2f6a";
		 //System.out.println(new Sha256Utile().swapWords(str)); 
		System.out.println("反转前："+str);
		 str=new Sha256Utile().swapWords(str);
		 System.out.println("反转前："+str);
		 String str1="123456zq";
		 str.replace("-", "");
		 StringBuilder  sb = new StringBuilder (str);
		 
		 sb.replace(1, 2, str1);
		 String marStrNew = sb.toString();  
		System.out.println("插入后："+marStrNew);
		//
		jdksha(marStrNew);
	}
	
	/**封装加密方法*/
	public static String passWord(String random,String passWord){
		random=new Sha256Utile().swapWords(random);
		random.replace("-", "");
		System.out.println(random);
		StringBuilder  sb = new StringBuilder (random);
		sb.replace(1, 2, passWord);
		String marStrNew = sb.toString();
		passWord=Sha256Utile.jdksha(marStrNew);
		System.out.println(passWord);
		return passWord;
	}
}
