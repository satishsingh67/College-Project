package com.College.DataBaseConnection;

import java.util.Date;

import javax.servlet.http.Part;

import com.College.DataValidation.DataValidation;

public class test {
public static void main(String[] args) {
	/*  java.util.Date today = new java.util.Date();
	
	   System.out.println(new Date());
	   System.out.println(new test().dataValidation("sss","sss@","3333","sss"));
	   String email="aaaa";
	   System.out.println(!(email.trim().contains("@")));
	   
	   */
	Part p=null;
	Part p1=null;
	
	String result=new DataValidation().newRegistrationDataValidation(" String name"," --Select--ss"," sss" ," ss"," sss" ," @dd"," ss","--Select--d ","sss",
			"--Select--s"," sss"," ss"," ss" ,null,p1 ) ;
	
	System.out.println(result);
	   
	   
}

String dataValidation(String fullName,String email,String mobileNumber,String message) {
	 String result=(fullName.trim().isEmpty()?"FullName":email.trim().isEmpty()?"Email":!(email.trim().contains("@"))?"Email":mobileNumber.trim().isEmpty()?"MobileNumber":mobileNumber.trim().length()>12?"MobileNumber":message.trim().isEmpty()?"Message":"True");
	 return result;
}
	
}
