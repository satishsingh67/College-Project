package com.college.dataValidation;

import javax.servlet.http.Part;

public class DataValidation {
	
	//ContactUs Data Validation
	public String contactUsDataValidation(String fullName,String email,String mobileNumber,String message) {
		 String result=(fullName.trim().isEmpty()?"Full Name":email.trim().isEmpty()?"Email":!(email.trim().contains("@"))?"Email":mobileNumber.trim().isEmpty()?"MobileNumber":mobileNumber.trim().length()>11?"Mobile Number":message.trim().isEmpty()?"Message":"True");
		 return result;
	 }
	
	//Grievance Data Validation
	public String grievanceDataValidation(String userType,String complaintName,String gender,String emailId,String complaintCategory,String department,String complaintDetails,String mobileNumber) {
		String result=null;
		result=((userType.trim().isEmpty())?"User Type":(userType.trim().equalsIgnoreCase("--Select--"))?"User Type":
			(complaintName.trim().isEmpty())?"Complaint Name":(gender==(null))?"Gender":emailId.trim().isEmpty()?"Email":!(emailId.trim().contains("@"))?"Email":
				(complaintCategory.trim().isEmpty())?"Complaint Category":(complaintCategory.trim().equalsIgnoreCase("--Select--"))?"Complaint Category":(department.trim().isEmpty())?"Department":(department.trim().equalsIgnoreCase("--Select--"))?"Department":
					complaintDetails.trim().isEmpty()?"Complaint Details":mobileNumber.trim().isEmpty()?"Mobile Number":mobileNumber.trim().length()>11?"Mobile Number":"True");
		return result;
	}
	
	//New Registration Data Validation
	public String newRegistrationDataValidation(String name,String department,String stream ,String idNumber,String phoneNumber ,String email,String recoveryPhoneNumber,String gender,String DOB,
			String securityQuestion,String securityQuestionAnswer,String securityPin,String confirmSecurityPin ,Part studentPhoto,Part moneyReceipt ) {
		String result=null;
		result=((name.trim().isEmpty())?"Name":(department.trim().isEmpty())?"Department":(department.trim().equalsIgnoreCase("--Select--"))?"Department":(stream.trim().isEmpty())?"Stream":(idNumber.trim().isEmpty())?"Id Number":(phoneNumber.trim().isEmpty())?"Phone Number":
			(phoneNumber.trim().length()>11)?"Phone Number":(gender.trim().equalsIgnoreCase("--Select--"))?"Gender":(email.trim().isEmpty())?"Email":(!(email.trim().contains("@")))?"Email":(recoveryPhoneNumber.trim().isEmpty())?"Recovery Phone Number":(recoveryPhoneNumber.trim().length()>11)?"Recovery Phone Number":
				(DOB.trim().isEmpty())?"Date Of Birth":(securityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(securityQuestionAnswer.trim().isEmpty())?"Security Question's Answer":(securityPin.trim().isEmpty())?"Security Pin":(confirmSecurityPin.trim().isEmpty())?"Confirm Security Pin":(studentPhoto.getSize()==0)?"Photo":
					(moneyReceipt.getSize()==0)?"Money Receipt":"True");
		return result;
	}
	
	
	//Change Mobile Number Data Validation
	public String changeMobileNumberDataValidation(String existingEmail,String existingPhoneNumber,String newPhoneNumber,String idNumber,String existingSecurityPin,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
		String result=null;
		result=((existingEmail.trim().isEmpty())?"Email":(!(existingEmail.trim().contains("@")))?"Email":(existingPhoneNumber.trim().isEmpty())?"Existing Mobile Number":(existingPhoneNumber.trim().length()>11)?"Existing Mobile Number":(newPhoneNumber.trim().isEmpty())?"New Mobile Number":(newPhoneNumber.trim().length()>11)?"New Mobile Number":
			(idNumber.trim().isEmpty())?"Id Number":(existingSecurityPin.trim().isEmpty())?"Security Pin":(existingSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(existingSecurityQuestionAnswer.trim().isEmpty())?"Security Question's Answer":((existingPhoneNumber.trim().equalsIgnoreCase(newPhoneNumber.trim())))?"Existing and New Mobile Number can't be same":"True");
		return result;
	}
	
	//Change Email Data Validation 
	public String changeEmailDataValidation(String existingPhoneNumber,String existingEmail,String newEmail,String idNumber,String existingSecurityPin,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
		String result=null;
		result=((existingPhoneNumber.trim().isEmpty())?"Mobile Number":(existingPhoneNumber.trim().length()>11)?"Mobile Number":(existingEmail.trim().isEmpty())?"Existing Email":(!(existingEmail.trim().contains("@")))?"Existing Email":(newEmail.trim().isEmpty())?"New Email":(!(newEmail.trim().contains("@")))?"New Email":(idNumber.trim().isEmpty())?"Id Number":(existingSecurityPin.trim().isEmpty())?"Security Pin":
			(existingSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(existingSecurityQuestionAnswer.trim().isEmpty())?"Security Question's Answer":(existingEmail.trim().equalsIgnoreCase(newEmail.trim()))?"Existing and New Email can't be same":"True");
		
		return result;
	}
	
	//Change Security Pin Data Validation 
		public String changeSecurityPinDataValidation(String existingPhoneNumber,String existingEmail,String existingSecurityPin,String newSecurityPin,String idNumber,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
			String result=null;
			result=((existingPhoneNumber.trim().isEmpty())?"Mobile Number":(existingPhoneNumber.trim().length()>11)?"Mobile Number":(existingEmail.trim().isEmpty())?"Email":(!(existingEmail.trim().contains("@")))?"Email":(existingSecurityPin.trim().isEmpty())?"Existing Security Pin":(newSecurityPin.trim().isEmpty())?"New Security Pin":
				(idNumber.trim().isEmpty())?"Id Number":(existingSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(existingSecurityQuestionAnswer.trim().isEmpty())?"Security Question's Answer":(existingSecurityPin.trim().equalsIgnoreCase(newSecurityPin.trim()))?"Existing and New Security Pin can't be same":"True");
			return result;
		}
   
	//Change Security Question Answer Data Validation
		public String changeSecurityQuestionAnswerDataValidation(String existingPhoneNumber,String existingEmail,String existingSecurityPin,String idNumber,String existingSecurityQuestion,String existingSecurityQuestionAnswer,String newSecurityQuestionAnswer) {
			String result=null;
			result=((existingPhoneNumber.trim().isEmpty())?"Mobile Number":(existingPhoneNumber.trim().length()>11)?"Mobile Number":(existingEmail.trim().isEmpty())?"Email":(!(existingEmail.trim().contains("@")))?"Email":(existingSecurityPin.trim().isEmpty())?"Security Pin":(idNumber.trim().isEmpty())?"Id Number":
				(existingSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"Security Question":(existingSecurityQuestionAnswer.trim().isEmpty())?"Existing Security Question's Answer":(newSecurityQuestionAnswer.trim().isEmpty())?"New Security Question's Answer":(existingSecurityQuestionAnswer.trim().equalsIgnoreCase(newSecurityQuestionAnswer.trim()))?"Existing and New Security Question's Answer can't be same":"True");
			return result;
		}
	
	//Change All login details Data validation
		public String changeAllLoginDetailsDataValidation(String recoveryPhoneNumber,String existingPhoneNumber,String newPhoneNumber,String existingEmail,String newEmail,String existingSecurityPin,String newSecurityPin,String idNumber,String existingSecurityQuestion,
				String existingSecurityQuestionAnswer,String newSecurityQuestion,String newSecurityQuestionAnswer) {
			String result=null;
			result=((recoveryPhoneNumber.trim().isEmpty())?"Recovery Mobile Number":(recoveryPhoneNumber.trim().length()>11)?"Recovery Mobile Number":(existingPhoneNumber.trim().isEmpty())?"Existing Mobile Number":(existingPhoneNumber.trim().length()>11)?"Existing Mobile Number":(newPhoneNumber.trim().isEmpty())?"New Mobile Number":(newPhoneNumber.trim().length()>11)?"New Mobile Number":
				(existingEmail.trim().isEmpty())?"Email":(!(existingEmail.trim().contains("@")))?"Email":(newEmail.trim().isEmpty())?"New Email":(!(newEmail.trim().contains("@")))?"New Email":(existingSecurityPin.trim().isEmpty())?"Existing Security Pin":(newSecurityPin.trim().isEmpty())?"New Security Pin":(idNumber.trim().isEmpty())?"Id Number":(existingSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"Existing Security Question":(existingSecurityQuestionAnswer.trim().isEmpty())?"Existing Security Question's Answer":
					(newSecurityQuestion.trim().equalsIgnoreCase("--Select--"))?"New Security Question":(newSecurityQuestionAnswer.trim().isEmpty())?"New Security Question's Answer":"True");
			return result;
		}
    
    //Duplicate Data Check for 'Change all login details'
	   public String changeAllLoginDetailsDuplicateDataCheck(String existingPhoneNumber,String newPhoneNumber,String existingEmail,String newEmail,String existingSecurityPin,String newSecurityPin,String existingSecurityQuestion,String newSecurityQuestion,String existingSecurityQuestionAnswer,String newSecurityQuestionAnswer) {
		   String result=null;
		   result=((existingPhoneNumber.trim().equalsIgnoreCase(newPhoneNumber.trim()))?"Existing and New Mobile Number":(existingEmail.trim().equalsIgnoreCase(newEmail.trim()))?"Existing and New Email":(existingSecurityPin.trim().equalsIgnoreCase(newSecurityPin.trim()))?"Existing and New Security Pin":(existingSecurityQuestion.trim().equalsIgnoreCase(newSecurityQuestion.trim()))?"Existing and New Security Question":(existingSecurityQuestionAnswer.trim().equalsIgnoreCase(newSecurityQuestionAnswer.trim()))?"Existing and New Security Question's Answer":"True");
		   return result;
	   }
		
	//Data validation for library feedback
	   public String libraryFeedbackDataValidation(String studentName,String idNumber,String mobileNumber,String email,String department,String semester
			   ,String semesterOther,String postalAddress,String titleReview,String titleReviewOther,String journalsReview,String journalsReviewOther
			   ,String arrangementReview,String arrangementReviewOther,String readingSpaceReview,String readingSpaceReviewOther,String wifiReview
			   ,String wifiReviewOther,String staffReview,String staffReviewOther) {
		  
		   String result=null;
		   
		   result=((studentName.trim().isEmpty())?"Student Name":(idNumber.trim().isEmpty())?"Id Number":(mobileNumber.trim().isEmpty() || mobileNumber.trim().length()>11)?"Mobile Number":(email.trim().isEmpty() || !(email.trim().contains("@")))?"Email":(department.trim().equalsIgnoreCase("--Select--"))?"Department":
			   (semester.trim().equalsIgnoreCase("--Select--"))?"semester":(semester.trim().equalsIgnoreCase("other") && semesterOther.trim().isEmpty())?"semester":(postalAddress.trim().isEmpty())?"Postal Address":(titleReview.trim().equalsIgnoreCase("--Select--"))?"Title Review":(titleReview.trim().equalsIgnoreCase("other") && titleReviewOther.trim().isEmpty())?"Title Review":
				   (journalsReview.trim().equalsIgnoreCase("--Select--"))?"Journals Review":(journalsReview.trim().equalsIgnoreCase("other") && journalsReviewOther.trim().isEmpty())?"Journals Review":(arrangementReview.trim().equalsIgnoreCase("--Select--"))?"Arrangement Review":(arrangementReview.trim().equalsIgnoreCase("other") && arrangementReviewOther.trim().isEmpty())?"Arrangement Review":
					   (readingSpaceReview.trim().equalsIgnoreCase("--Select--"))?"Reading Space Review":(readingSpaceReview.trim().equalsIgnoreCase("other") && readingSpaceReviewOther.trim().isEmpty())?"Reading Space Review":(wifiReview.trim().equalsIgnoreCase("--Select--"))?"WiFi Review":(wifiReview.trim().equalsIgnoreCase("other") && wifiReviewOther.trim().isEmpty())?"WiFi Review":
						   (staffReview.trim().equalsIgnoreCase("--Select--"))?"Staff Review":(staffReview.trim().equalsIgnoreCase("other") && staffReviewOther.trim().isEmpty())?"Staff Review":"True");
		   
		   
		   
		   return result;
		   
	   }
	   
	//Student login data validation
	   
	   public String studentLogin(String idNumber,String studentName,String securityQuestion,String securityQuestionAnswer,String securityPin) {
		   
		   String result=null;
		   
		   result=((idNumber.trim().isEmpty())?"Id Number":(studentName.trim().isEmpty())?"Student Name":(securityQuestion.trim().equalsIgnoreCase("--select--"))?"Security Question":(securityQuestionAnswer.trim().isEmpty())?"Security Answer":(securityPin.trim().isEmpty() || securityPin.trim().length()>6)?"Security Pin":"True");
		   
		   return result;
	   }
	   
	   
		
}
 