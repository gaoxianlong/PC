package com.stk.controller;

import com.google.zxing.BarcodeFormat;  
import com.google.zxing.EncodeHintType;  
import com.google.zxing.MultiFormatWriter;  
import com.google.zxing.WriterException;  
import com.google.zxing.client.j2se.MatrixToImageWriter;  
import com.google.zxing.common.BitMatrix;  
  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStream;  
import java.util.Hashtable;  
  
  
/** 
 * 类的功能，目的，描述等写在此处 
 * 
 * @author gao
 * @version 1.0 
 * 
 */  
public class CodeEvent {  
  
    public static void main(String[] args) {  
        String text = "http://www.baidu.com/";  
        int width=100;  
        int height=100;  
        String format="png";  
        Hashtable hints = new Hashtable();  
        hints.put(EncodeHintType.CHARACTER_SET,"utf-8");  
        try {  
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE,width,height);  
            OutputStream os = new FileOutputStream("Q:"+File.separator+"new.png");  
            MatrixToImageWriter.writeToStream(bitMatrix, format,os);// 输出图像  
        } catch (WriterException e) {  
            e.printStackTrace();  
        }catch (IOException e){  
            e.printStackTrace();  
        }  
    }  
}  