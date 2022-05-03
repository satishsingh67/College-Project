package com.college.sendOTP;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;

public class SendSms {
	
	public  int sendSms(String message,String number)
	{

		Integer responseCode=null;
		
		try
		{
		
		String apiKey="w6Kv4srWSuEqMmzoQAHGdYZ37ygOLteilcJT1BC2k8VnX5PUpa4lGKzT2ZQVOXuMvaxbW3w8epoUPF6r";
		String sendId="FSTSMS";
		//important step...
		message=URLEncoder.encode(message, "UTF-8");
		String language="english";
		
		String route="p";
		
		
		String myUrl="https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
		
		//sending get request using java..
		
		URL url=new URL(myUrl);
		
		HttpsURLConnection con=(HttpsURLConnection)url.openConnection();
		
		
		con.setRequestMethod("GET");
		
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("cache-control", "no-cache");
		//System.out.println("Wait..............");
		
		responseCode=con.getResponseCode();
		
	   //  System.out.println("Response code : "+code);
		
		StringBuffer response=new StringBuffer();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		while(true)
		{
			String line=br.readLine();
			if(line==null)
			{
				break;
			}
			response.append(line);
		}
		
	//	System.out.println(response);
		
	
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return responseCode;
	}
	public static void main(String[] args) {
	//System.out.println(new SendSms().sendSms("1111","8420003888"));
		
		String a="08420003888";
		System.out.println(a.replaceFirst(String.valueOf(a.charAt(0)), ""));
		
	}
}