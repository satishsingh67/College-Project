package com.college.dao.studentDao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Base64;
import java.util.Date;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.Student;

public class StudentLoginValidation {
 public Student validateDetails(String idNumber,String studentName,String securityQuestion,String securityQuestionAnswer,String securityPin) {
	 Student student=null;
	 Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			
			String query = "Select * from registration where idNumber=? and studentName=? and securityQuestion=? and securityQuestionAnswer=? and securityPin=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,idNumber);
			pstmt.setString(2, studentName.trim());
			pstmt.setString(3, securityQuestion.trim());
			pstmt.setString(4, securityQuestionAnswer.trim());
			pstmt.setString(5, securityPin.trim());
		    ResultSet rs=pstmt.executeQuery();
			
            
			while(rs.next()) {
	
		
			student=new Student();
			student.setStudentName(rs.getString("studentName"));
			String id=rs.getString("idNumber");
			student.setIdNumber(id);
			student.setDepartment(rs.getString("department"));
			student.setDOB(rs.getString("dateOfBirth"));
			student.setGender(rs.getString("gender"));
			Blob blob = rs.getBlob("studentPhoto");
            
			//Calculating current Student's year
			String val[]=id.split("/");
			int yearOfAddmision=Integer.parseInt(val[1]);
			int currentYear=new Date().getYear()+1900;
			int year=currentYear-yearOfAddmision;
			student.setYear(year);

			//Preparing Image to send user
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
             
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);                  
            }
             
            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
             
             
            inputStream.close();
            outputStream.close();
			
			student.setBase64Image(base64Image);
			
			
			
			}
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}

	 return student;
 }
	
	public static void main(String[] args) {
		
		System.out.println(new StudentLoginValidation().validateDetails("GNIT/2018/0348", "Satish Singh", "Your Favourite Color", "pink", "123128"));
		
	}
	
	
	
	
}
