package com.college.teacher.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.StudentDoubtModel;
import com.google.gson.Gson;

public class PostQuestionPaperAndTakeAction {
	public String uploadQuestionPaper(String teacherId, String departmentId, String semseter, String section,
			String subjectId, Part uploadFile, String examType,String courseTypeId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String file[] = (uploadFile.getSubmittedFileName().split("\\."));
		String fileName=file[0];
		String fileExtension=file[1];
		try {
			InputStream uploadFileInputStream = uploadFile.getInputStream();
			String query = null;
 
				query = "INSERT INTO `exam_question_paper` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`, `questionPaperName`,`fileExtension`,`questionPaperData`,`fkExamType`, `createDate`, `updatedate`,`fkCourseTypeId`)"
						+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

				PreparedStatement pstmt = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
				pstmt.setInt(1, Integer.parseInt(teacherId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));
				pstmt.setInt(5, Integer.parseInt(subjectId));
				pstmt.setString(6, fileName);
				pstmt.setString(7, fileExtension);
				pstmt.setBlob(8,uploadFileInputStream);
				pstmt.setInt(9,Integer.parseInt(examType));
				pstmt.setObject(10, new Date());
				pstmt.setObject(11, new Date());
				pstmt.setInt(12, Integer.parseInt(courseTypeId));

                pstmt.executeUpdate();
                
				ResultSet rs = pstmt.getGeneratedKeys();
				if (rs.next()) {
					int pkQuestionPaperId=rs.getInt(1);
					
				PreparedStatement pstmt1=con.prepareStatement("Insert into `answer_script_submission_status`"
						+ "(`fkExamQuestionPaperId`,`fkExamTypeId`,`isActive`,`createDate`,`updateDate`) values(?,?,?,?,?)");
					
				pstmt1.setInt(1, pkQuestionPaperId);
				pstmt1.setInt(2, Integer.parseInt(examType));
				pstmt1.setInt(3, 0);
				pstmt1.setObject(4,new Date());
				pstmt1.setObject(5,new Date());
				
				int dbStatus=pstmt1.executeUpdate();
				if(dbStatus>0) {
					result="Question Paper uploaded Successfully";
				}
				else {
					result = "Something went wrong.Please try again";
				}
				} else {
					result = "Something went wrong.Please try again";
				}
		} catch (Exception e) {
			result = "Something went wrong.Please try again";
			e.printStackTrace();

		}

		return result;
	}
	
	public String fetchPaperDetails(String teacherId, String departmentId, String semseter, String section,
			String subjectId, String examType,String courseId){
		String result=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
	try {
		String query="Select pkExamQuestionPaperId,questionPaperName,fileExtension,isActive from exam_question_paper where fkTeacherId=? and fkExamType=? and fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkCourseTypeId=? order by updatedate desc";
		
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, Integer.parseInt(teacherId));
		pstmt.setInt(2,Integer.parseInt(examType));
		pstmt.setInt(3, Integer.parseInt(departmentId));
		pstmt.setInt(4, Integer.parseInt(semseter));
		pstmt.setInt(5, Integer.parseInt(section));
		pstmt.setInt(6, Integer.parseInt(subjectId));
		pstmt.setInt(7, Integer.parseInt(courseId));

		ResultSet rs=pstmt.executeQuery();
		
		Map<String,Object> questionPaperList=new HashMap<String,Object>();
		
		if(rs.next()) {
			int questionPaperId=rs.getInt(1);
			questionPaperList.put("id",questionPaperId);
			questionPaperList.put("paperName",rs.getString(2)+"."+rs.getString(3));
			questionPaperList.put("isActive",rs.getInt(4));
			
			String query1="Select isActive from answer_script_submission_status where fkExamQuestionPaperId=?";
			
			PreparedStatement pstmt1 = con.prepareStatement(query1);
			pstmt1.setInt(1,questionPaperId);	
			ResultSet rs1=pstmt1.executeQuery();
			
			if(rs1.next()) {
				questionPaperList.put("isActiveAnswer",rs1.getInt(1));

			}
			
			
		}
		
		Gson json = new Gson();

		result = json.toJson(questionPaperList);
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
	public String updateQuestionPaper(String action, String id, String isActive){
		String result=null,result1=null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
	try {
		String query=null;
		Integer enable=null;
		
		if(!action.isEmpty() && action.trim().equalsIgnoreCase("enableQuestionPaper")) {
			
			query="update exam_question_paper set isActive=? where pkExamQuestionPaperId=?";
		
			enable=(Integer.parseInt(isActive)==0?1:0);
		    result1=(Integer.parseInt(isActive)==0?"Question Paper Download Enabled ":"Question Paper Download Disabled ");
		}
		else {
			
			query="update answer_script_submission_status set isActive=? where fkExamQuestionPaperId=?";
			
			enable=(Integer.parseInt(isActive)==0?1:0);	
		    result1=(Integer.parseInt(isActive)==0?"Answer Script Submission Enabled ":"Answer Script Submission Disabled ");
			
		}
		
		
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, enable);
		pstmt.setInt(2,Integer.parseInt(id));
		
		int dbStatus=pstmt.executeUpdate();
		
         if(dbStatus>0) {
        	 result=result1+"Successfully";
         }else {
        	 result="Something went wrong.Please Try again.";
         }

	} catch (Exception e) {
		e.printStackTrace();
   	 result="Something went wrong.Please Try again.";

	} finally {
		try {
			if (con != null) {
				con.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
       	 result="Something went wrong.Please Try again.";
		}
	}
	
	return result;
	}
	public static void main(String[] args) {
		System.out.println(new PostQuestionPaperAndTakeAction().updateQuestionPaper("enableQuestionPaper","10", "0"));
	}
}