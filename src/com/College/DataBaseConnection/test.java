package com.college.dataBaseConnection;

import java.util.Date;

import javax.servlet.http.Part;

import com.college.DataValidation.DataValidation;

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
	
	//String result=new DataValidation().libraryFeedbackDataValidation(" gg", " hh", "ss "," @ ", "dd"," Other", "hh ", "postalAddress"," titleReview", "titleReviewOther"," journalsReview"," journalsReviewOther"," arrangementReview", "arrangementReviewOther", "readingSpaceReview", "readingSpaceReviewOther", "wifiReview"," wifiReviewOther", "staffReview"," staffReviewOther");
			
	//System.out.println(result);
	 System.out.println(getValueForOthersField("hh"," "));  
	   
}

String dataValidation(String fullName,String email,String mobileNumber,String message) {
	 String result=(fullName.trim().isEmpty()?"FullName":email.trim().isEmpty()?"Email":!(email.trim().contains("@"))?"Email":mobileNumber.trim().isEmpty()?"MobileNumber":mobileNumber.trim().length()>12?"MobileNumber":message.trim().isEmpty()?"Message":"True");
	 return result;
}
	
public static String getValueForOthersField(String data1,String data2) {
	String result=null;
	
	result=((data1.trim().equalsIgnoreCase("Other"))?data2:data1);
	
	return result;
}

}
