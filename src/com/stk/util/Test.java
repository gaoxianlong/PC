package com.stk.util;

import java.util.Random;

public class Test {
	public static void main(String[] args) {
		 getSalt();
		
	}

	public static void  getSalt() {
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
		
		System.out.println(string);
	}
	
	
}
