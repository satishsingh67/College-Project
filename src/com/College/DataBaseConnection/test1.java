package com.college.dataBaseConnection;

import java.util.Date;

import javax.servlet.http.Part;

import com.college.DataValidation.DataValidation;

public class test1 {
public static void main(String[] args) {
	/*  java.util.Date today = new java.util.Date();
	
	   System.out.println(new Date());
	   System.out.println(new test().dataValidation("sss","sss@","3333","sss"));
	   String email="aaaa";
	   System.out.println(!(email.trim().contains("@")));
	   
	   */
	Part p=null;
	Part p1=null;
	
	//String result=new DataValidation().changeSecurityQuestionAnswer(" ss", " @", " ss", " s"," --Selects--", " ss", " sss");
	
	//System.out.println(result);
	   //kkkk
	// dddddd  
}

String dataValidation(String fullName,String email,String mobileNumber,String message) {
	 String result=(fullName.trim().isEmpty()?"FullName":email.trim().isEmpty()?"Email":!(email.trim().contains("@"))?"Email":mobileNumber.trim().isEmpty()?"MobileNumber":mobileNumber.trim().length()>12?"MobileNumber":message.trim().isEmpty()?"Message":"True");
	 return result;
}
	
}
