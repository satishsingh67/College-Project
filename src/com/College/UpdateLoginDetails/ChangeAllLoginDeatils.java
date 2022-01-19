package com.College.UpdateLoginDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.College.DataBaseConnection.DataBaseConnection;

public class ChangeAllLoginDeatils {
 
public String changeAllLoginDetails(String recoveryPhoneNumber,String existingPhoneNumber,String newPhoneNumber,String existingEmail,String newEmail,String existingSecurityPin,String newSecurityPin,String idNumber,String existingSecurityQuestion,
		String existingSecurityQuestionAnswer,String newSecurityQuestion,String newSecurityQuestionAnswer) {
	
	String result=null;
	Connection con = new DataBaseConnection().getDatabaseConnection();
	try {
	String checkDetailsQuery="Select * from registration where email=? and phoneNumber=? and idNumber=? and securityPin=? and securityQuestion=? and securityQuestionAnswer=? and recoveryPhoneNumber=?";
	PreparedStatement pstmt=con.prepareStatement(checkDetailsQuery);
			pstmt.setString(1,existingEmail.trim());   
			pstmt.setString(2,existingPhoneNumber.trim());
			pstmt.setString(3,idNumber.trim());   
			pstmt.setString(4,existingSecurityPin.trim());
			pstmt.setString(5,existingSecurityQuestion.trim());   
			pstmt.setString(6,existingSecurityQuestionAnswer.trim());
			pstmt.setString(7,recoveryPhoneNumber.trim());
			ResultSet rst=pstmt.executeQuery();
			if(rst.next()) {
			String changeAllLoginDetailsUpdateQuery="update registration set phoneNumber=?,email=?,securityPin=?,securityQuestion=?,securityQuestionAnswer=?,updateDate=? where pkRegistrationId=? and email=? and idNumber=?";
			PreparedStatement pstmt1=con.prepareStatement(changeAllLoginDetailsUpdateQuery);
			pstmt1.setString(1, newPhoneNumber);
			pstmt1.setString(2, newEmail);
			pstmt1.setString(3, newSecurityPin);
			pstmt1.setString(4, newSecurityQuestion);
			pstmt1.setString(5, newSecurityQuestionAnswer);
			pstmt1.setObject(6,new Date());
			pstmt1.setInt(7,rst.getInt("pkRegistrationId"));
			pstmt1.setString(8, existingEmail);
			pstmt1.setString(9, idNumber);
		    //Updating details	
			int updateStatus=pstmt1.executeUpdate();
		    if(updateStatus>0) {
		    	result="Updated";
		    }else {
		    	result="Not Updated";
		    }
			}
			else {
				result="Data not found with given details";
			}
			con.close();
	}catch(Exception e) {
		e.printStackTrace();
		result="Something went wrong.Please try again";
	}
	
	
	
	return result;
}
	
	
	
}
