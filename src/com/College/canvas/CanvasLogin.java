package com.college.canvas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.CanvasAccount;

public class CanvasLogin {
	public Map<String, Object> validateDetails(String name, String emailId, String department, String password) {
		Map<String,Object> canvasLoginValidation=new HashMap<String,Object>();

			
			Connection con = new DataBaseConnection().getDatabaseConnection();
			try {

				String query = "SELECT canvas.pkCanvasAccountId,canvas.name,canvas.emailId,canvas.password,dept.shortName,dept.longName FROM `canvas_account` as canvas"
						+ " inner join department as dept on canvas.fkDepartmentId=dept.pkDepartmentId"
						+ " where canvas.name=? and canvas.emailId=? and canvas.fkDepartmentId=? and canvas.password=? and canvas.isDeleted=? limit 1";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, name.trim());
				pstmt.setString(2,emailId.trim());
				pstmt.setInt(3, Integer.parseInt(department));
				pstmt.setString(4, password.trim());
				pstmt.setInt(5, 0);
				ResultSet rs = pstmt.executeQuery();

				canvasLoginValidation.put("status",false);	
				canvasLoginValidation.put("error","No Account Found");
				
				while (rs.next()) { 
					 
					 if(!rs.getString("name").trim().contentEquals(name.trim())) {
						 canvasLoginValidation.put("error","Wrong Name");
		
					}
					else if(!rs.getString("emailId").trim().contentEquals(emailId.trim())) {
						canvasLoginValidation.put("error","Wrong Email Id");

					}
					else if(!rs.getString("password").trim().contentEquals(password.trim())) {
						canvasLoginValidation.put("error","Invalid Password");	
					}
					
					else {
						canvasLoginValidation.put("status",true);	
						CanvasAccount accountDetails =new CanvasAccount();

						accountDetails.setPkId(rs.getInt(1));
						accountDetails.setName(rs.getString(2));
						accountDetails.setEmailId(rs.getString(3));
						accountDetails.setDepartmentShortName(rs.getString(5));
						accountDetails.setDepartmentLongName(rs.getString(6));
						
						canvasLoginValidation.put("canvas",accountDetails);

					}
				}
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}

			return canvasLoginValidation;
		}

}
