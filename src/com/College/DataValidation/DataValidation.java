package com.College.DataValidation;

import javax.servlet.http.Part;

public class DataValidation {
	public String contactUsDataValidation(String fullName,String email,String mobileNumber,String message) {
		 String result=(fullName.trim().isEmpty()?"Full Name":email.trim().isEmpty()?"Email":!(email.trim().contains("@"))?"Email":mobileNumber.trim().isEmpty()?"MobileNumber":mobileNumber.trim().length()>11?"Mobile Number":message.trim().isEmpty()?"Message":"True");
		 return result;
	 }
	
	
	public String grievanceDataValidation(String userType,String complaintName,String gender,String emailId,String complaintCategory,String department,String complaintDetails,String mobileNumber) {
		String result=null;
		result=((userType.trim().isEmpty())?"User Type":(userType.trim().equalsIgnoreCase("--Select--"))?"User Type":
			(complaintName.trim().isEmpty())?"Complaint Name":(gender==(null))?"Gender":emailId.trim().isEmpty()?"Email":!(emailId.trim().contains("@"))?"Email":
				(complaintCategory.trim().isEmpty())?"Complaint Category":(complaintCategory.trim().equalsIgnoreCase("--Select--"))?"Complaint Category":(department.trim().isEmpty())?"Department":(department.trim().equalsIgnoreCase("--Select--"))?"Department":
					complaintDetails.trim().isEmpty()?"Complaint Details":mobileNumber.trim().isEmpty()?"Mobile Number":mobileNumber.trim().length()>11?"Mobile Number":"True");
		return result;
	}
	
	public String newRegistrationDataValidation(String name,String department,String stream ,String idNumber,String phoneNumber ,String email,String recoveryPhoneNumber,String gender,String DOB,
			String securityQuestion,String securityQuestionAnswer,String securityPin,String confirmSecurityPin ,Part studentPhoto,Part moneyReceipt ) {
		String result=null;
		result=((name.trim().isEmpty())?"Name":(department.trim().isEmpty())?"Department":(department.trim().equalsIgnoreCase("--Select--"))?"Department":(stream.trim().isEmpty())?"Stream":(idNumber.trim().isEmpty())?"Id Number":(phoneNumber.trim().isEmpty())?"Phone Number":
			(phoneNumber.trim().length()>11)?"Phone Number":(gender.trim().equalsIgnoreCase("--Select--"))?"Gender":(email.trim().isEmpty())?"Email":(!(email.trim().contains("@")))?"Email":(recoveryPhoneNumber.trim().isEmpty())?"Recovery Phone Number":(recoveryPhoneNumber.trim().length()>11)?"Recovery Phone Number":
				(DOB.trim().isEmpty())?"Date Of Birth":(securityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(securityQuestionAnswer.trim().isEmpty())?"Security Question Answer":(securityPin.trim().isEmpty())?"Security Pin":(confirmSecurityPin.trim().isEmpty())?"Confirm Security Pin":(studentPhoto.getSize()==0)?"Photo":
					(moneyReceipt.getSize()==0)?"Money Receipt":"True");
		return result;
	}
	
}
 