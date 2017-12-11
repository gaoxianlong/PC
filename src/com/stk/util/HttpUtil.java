package com.stk.util;


import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.zip.GZIPInputStream;

import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.params.CookiePolicy;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.params.HttpParams;

public class HttpUtil 
{
	public static final String GET = "get";
	public static final String POST = "get";
	public static String getOrPost(String url ,String method, String data)
	{
		//创建默认HttpClient实例
		HttpClient httpclient=new DefaultHttpClient();
		//处理重定向
		HttpParams params = httpclient.getParams(); 
		params.setParameter(ClientPNames.HANDLE_REDIRECTS, false);
		
		params.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 600000);//连接时间20s
		params.setParameter(CoreConnectionPNames.SO_TIMEOUT, 600000);//数据传输时间60s
		HttpClientParams.setCookiePolicy(params, CookiePolicy.BROWSER_COMPATIBILITY);
		System.out.println("111111111111111111");
		params.setBooleanParameter(CoreProtocolPNames.USE_EXPECT_CONTINUE, false);
		System.out.println("222222222");
		/*
		 * 判断是get 还是post
		 */
		HttpResponse response = null ;
		HttpGet httpget = null;
		HttpPost httppost = null;
		
		if("".equals(url))
		{
			System.out.println("请输入URL在进行提交");
		}
		if(method.equalsIgnoreCase("GET")) 
        {
			try 
			{
				//创建httpGet
				httpget= new HttpGet(url);
				httpget.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
				httpget.setHeader("Accept-Language", "zh-cn");
				httpget.setHeader("Content-Type","application/x-www-form-urlencoded");
				httpget.setHeader("Accept-Charset", "UTF-8;");
				httpget.setHeader("Connection", "Keep-Alive");
				
				//执行get请求
				response = httpclient.execute(httpget);
			}catch(Exception e) 
			{
//    			e.printStackTrace();
			}
        }
		else if(method.equalsIgnoreCase("POST"))
        {
    		try 
    		{
    			//创建httpPost
    			httppost = new HttpPost(url);
    			httppost.setHeader("Accept", "application/json, text/javascript, */*; q=0.01");
    			httppost.setHeader("Accept-Language", "zh-cn");
    			httppost.setHeader("Content-Type","application/x-www-form-urlencoded");
    			httppost.setHeader("Accept-Charset", "UTF-8;");
    			httppost.setHeader("Connection", "Keep-Alive");
    			//创建post参数
    			httppost.setEntity(new StringEntity(data));
    			//执行post请求
    			response = httpclient.execute(httppost);
    			
    		} catch (Exception e) 
    		{
    			e.printStackTrace();
    		}
        }
		//处理cookies 和location 和打印响应内容
		if(response != null)
		{
			InputStream ins = null;
			try {
				ins = response.getEntity().getContent();
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			Header[] headers = response.getAllHeaders();
			for(int i = 0; i < headers.length; i++)
			{
				if(headers[i].getName().equals("Content-Encoding") && headers[i].getValue().equals("gzip"))
				{
					try
					{
		                byte[] b = null;
		                GZIPInputStream gzip = new GZIPInputStream(ins);
		                byte[] buf = new byte[512];
		                int num = -1;
		                ByteArrayOutputStream baos = new ByteArrayOutputStream();
		                while ((num = gzip.read(buf, 0, buf.length)) != -1)
		                {
		                    baos.write(buf, 0, num);
		                }
		                b = baos.toByteArray();
		                baos.flush();
		                baos.close();
		                gzip.close();
		                ins.close();
		                return new String(b, "UTF-8").trim();
					}catch(Exception e)
					{
		    			e.printStackTrace();
					}
				}
			}
			BufferedReader br = null;
			try
			{
				StringBuffer sb = new StringBuffer();
				br = new BufferedReader(new InputStreamReader(ins,"UTF-8"));
				String str="";
				while ((str = br.readLine()) != null)
				{
					sb.append(str+"\n");
				}
				return sb.toString().trim();
			}catch (Exception e) 
			{
    			e.printStackTrace();
			}finally
    		{
				if(br != null)
				{
					try 
					{
						br.close();
						br = null;
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if(httpget != null)
				{
					httpget.abort();
					httpget = null;
				}
				if(httppost != null)
				{
					httppost.abort();
					httppost = null;
				}
				if(response != null)
				{
					response = null;
				}
				if(httpclient != null)
				{
					httpclient.getConnectionManager().shutdown();
					httpclient = null;
				}
    		} 
		}
		
		return "";
	}
}
