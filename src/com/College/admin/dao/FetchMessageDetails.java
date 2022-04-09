package com.college.admin.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class FetchMessageDetails {

	public String fetchteacherMessage() {
		
		Connection con=new DataBaseConnection().getDatabaseConnection();
		
		String result=null;
		
		try {
			String query=" SELECT doubt.pkAdminDoubtId,doubt.question,doubt.answer,doubt.createDate,teach.teacherName,teach.emailId,teach.mobileNumber,dept.longName,doubt.updateDate FROM admin_doubt AS doubt " + 
					"INNER JOIN teacher_registration AS teach ON doubt.fkTeacherId=teach.pkTeacherId " + 
					" INNER JOIN department AS dept ON teach.fkDepartmentId=dept.pkDepartmentId";
			Thread.sleep(5000);
			
			Statement stmt=con.createStatement();
			
			ResultSet rs=stmt.executeQuery(query);
			List<ViewVariables> teacherDoubtList = new ArrayList<ViewVariables>();

			while(rs.next()) {
				
				ViewVariables viewVariables=new ViewVariables();
				
				viewVariables.setPkId(rs.getInt(1));
				viewVariables.setQuestion(rs.getString(2));
				viewVariables.setAnswer(rs.getString(3));
				viewVariables.setCreateDate(rs.getTimestamp(4));
				viewVariables.setName(rs.getString(5));
				viewVariables.setEmailId(rs.getString(6));
				viewVariables.setMobileNumber(rs.getString(7));
				viewVariables.setDepartmentName(rs.getString(8));
				viewVariables.setUpdateDate(rs.getTimestamp(9));
				teacherDoubtList.add(viewVariables);
			
			}
			
			Gson json = new Gson();

			result = json.toJson(teacherDoubtList);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}
	
	
	
	
	
	
	
}
