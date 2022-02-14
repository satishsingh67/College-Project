package com.college.updateLoginDetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;

public class ChangeMobileNumber {
public String changeMobileNumber(String existingEmail,String existingPhoneNumber,String newPhoneNumber,String idNumber,String existingSecurityPin,String existingSecurityQuestion,String existingSecurityQuestionAnswer) {
	String result=null;
	Connection con = new DataBaseConnection().getDatabaseConnection();
	try {
	String checkDetailsQuery="Select * from registration where email=? and phoneNumber=? and idNumber=? and securityPin=? and securityQuestion=? and securityQuestionAnswer=?";
	PreparedStatement pstmt=con.prepareStatement(checkDetailsQuery);
			pstmt.setString(1,existingEmail.trim());   
			pstmt.setString(2,existingPhoneNumber.trim());
			pstmt.setString(3,idNumber.trim());   
			pstmt.setString(4,existingSecurityPin.trim());
			pstmt.setString(5,existingSecurityQuestion.trim());   
			pstmt.setString(6,existingSecurityQuestionAnswer.trim());
			ResultSet rst=pstmt.executeQuery();
			if(rst.next()) {
			String mobileNumberUpdateQuery="update registration set phoneNumber=?,updateDate=? where pkRegistrationId=? and email=? and idNumber=?";
			PreparedStatement pstmt1=con.prepareStatement(mobileNumberUpdateQuery);
			pstmt1.setString(1, newPhoneNumber);
			pstmt1.setObject(2,new Date());
			pstmt1.setInt(3,rst.getInt("pkRegistrationId"));
			pstmt1.setString(4, existingEmail);
			pstmt1.setString(5, idNumber);
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
/*public static void main(String[] args) {
	String a=new ChangeMobileNumber().changeMobileNumber("67singh.satwish@gmail.com", "8420003888", "666666", "GNIT/2018/0348", "123456", "Your Home Town", "Siwan");
System.out.println(a);
}*/

}
