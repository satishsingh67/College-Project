package com.college.FetchFiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.StudentDoubtModel;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class FetchStudentFiles {

	public String FetchStudentAnswerScript(String examTypeId, String teacherId, String fkDepartmentId,
			String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = null;
			PreparedStatement pstmt = null;

			query = "SELECT answ.pkExamAnswerSubmissionId,dept.shortName,answ.fkSemesterId,answ.fkSectionId,answ.answerFileName,answ.updateDate,stud.studentName,stud.universityRollNo,ques.questionPaperName FROM exam_answer_submission AS answ"
					+ " INNER JOIN registration AS stud ON answ.fkStudentId=stud.pkRegistrationId "
					+ " INNER JOIN department AS dept ON answ.fkDepartmentId=dept.pkDepartmentId "
					+ " INNER JOIN exam_question_paper AS ques ON answ.fkQuestionPaperId=ques.pkExamQuestionPaperId "
					+ "WHERE answ.fkDepartmentId=? AND answ.fkSemesterId=? AND answ.fkSectionId=? AND answ.fkSubjectId=? AND answ.fkExamType=? AND ques.fkTeacherId=? AND answ.fkCourseTypeId=? AND ques.fkCourseTypeId=?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(examTypeId));
			pstmt.setInt(6, Integer.parseInt(teacherId));
			pstmt.setInt(7, Integer.parseInt(courseTypeId));
			pstmt.setInt(8, Integer.parseInt(courseTypeId));
			
			ResultSet rs = pstmt.executeQuery();

			int count=0;
			List<ViewVariables> viewVariablesList = new ArrayList<ViewVariables>();
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setDepartmentName(rs.getString(2));
				viewVariablesObj.setSemster(rs.getInt(3));
				viewVariablesObj.setSection(rs.getInt(4));
				viewVariablesObj.setSubmittedFileName(rs.getString(5));
				viewVariablesObj.setCreateDate(rs.getTimestamp(6));
				viewVariablesObj.setName(rs.getString(7));
				viewVariablesObj.setRollNo(rs.getString(8));
				viewVariablesObj.setQuestionPaperName(rs.getString(9));
				viewVariablesList.add(viewVariablesObj);

			}

			Gson json = new Gson();

			result = json.toJson(viewVariablesList);

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
	public String viewLabCopy(String fkDepartmentId, String fkSemesterId, String fkSectionId,
			String fkSubjectId, String action,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = null;

			if (!action.isEmpty() && action.trim().equalsIgnoreCase("weeklyLabFile")) {

				query = "Select lab.pkWeeklyLabExperimentId,lab.LabFileName,lab.updatedate,dept.shortName,lab.fkSemesterId,lab.fkSectionId,stud.studentName,stud.universityRollNo from weekly_lab_experiment AS lab "
						+ " INNER JOIN registration AS stud ON lab.fkStudentId=stud.pkRegistrationId "
						+ " INNER JOIN department AS dept ON lab.fkDepartmentId=dept.pkDepartmentId "
						+ "where lab.fkDepartmentId=? and lab.fkSemesterId=? and lab.fkSectionId=? and lab.fkSubjectId=? and lab.fkCourseTypeId=?";

			}
			if (!action.isEmpty() && action.trim().equalsIgnoreCase("viewweeklylaboutput")) {

				query = "Select lab.pkWeeklyLabOutputId,lab.outputFileName,lab.updatedate,dept.shortName,lab.fkSemesterId,lab.fkSectionId,stud.studentName,stud.universityRollNo from weekly_lab_output AS lab "
						+ " INNER JOIN registration AS stud ON lab.fkStudentId=stud.pkRegistrationId "
						+ " INNER JOIN department AS dept ON lab.fkDepartmentId=dept.pkDepartmentId "
						+ "where lab.fkDepartmentId=? and lab.fkSemesterId=? and lab.fkSectionId=? and lab.fkSubjectId=? and lab.fkCourseTypeId=?";
			}

			if (!action.isEmpty() && action.trim().equalsIgnoreCase("finalLabCopy")) {

				query = "Select lab.pkFinalLabCopyId,lab.LabFileName,lab.updatedate,dept.shortName,lab.fkSemesterId,lab.fkSectionId,stud.studentName,stud.universityRollNo from final_lab_copy AS lab "
						+ " INNER JOIN registration AS stud ON lab.fkStudentId=stud.pkRegistrationId "
						+ " INNER JOIN department AS dept ON lab.fkDepartmentId=dept.pkDepartmentId "
						+ "where lab.fkDepartmentId=? and lab.fkSemesterId=? and lab.fkSectionId=? and lab.fkSubjectId=? and lab.fkCourseTypeId=?";
			}
			
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();

			int count=0;
			List<ViewVariables> viewVariablesList = new ArrayList<ViewVariables>();
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setSubmittedFileName(rs.getString(2));
				viewVariablesObj.setCreateDate(rs.getTimestamp(3));
				viewVariablesObj.setDepartmentName(rs.getString(4));
				viewVariablesObj.setSemster(rs.getInt(5));
				viewVariablesObj.setSection(rs.getInt(6));
				viewVariablesObj.setName(rs.getString(7));
				viewVariablesObj.setRollNo(rs.getString(8));
				
				viewVariablesList.add(viewVariablesObj);

			}

			Gson json = new Gson();

			result = json.toJson(viewVariablesList);


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
	
	public String FetchStudentAssignment(String teacherId, String fkDepartmentId,
			String fkSemesterId, String fkSectionId, String fkSubjectId,String courseTypeId) {
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String result = null;
		try {
			String query = null;
			PreparedStatement pstmt = null;

			query = "SELECT asign.pkStudentAssignmentStatusId,dept.shortName,asign.fkSemesterId,asign.fkSectionId,asign.FileName,asign.updatedate,stud.studentName,stud.universityRollNo,ques.assignmentName,asign.status,ques.dueDate FROM student_assignment_status AS asign"
					+ " INNER JOIN registration AS stud ON asign.fkStudentId=stud.pkRegistrationId "
					+ " INNER JOIN department AS dept ON asign.fkDepartmentId=dept.pkDepartmentId "
					+ " INNER JOIN assignment AS ques ON asign.fkAssignmentId=ques.pkAssignmentId "
					+ "WHERE asign.fkDepartmentId=? AND asign.fkSemesterId=? AND asign.fkSectionId=? AND asign.fkSubjectId=? AND ques.fkTeacherId=? AND ques.fkDepartmentId=? AND ques.fkSemesterId=? AND ques.fkSectionId=? AND ques.fkSubjectid=? AND asign.fkCourseTypeId=? AND ques.fkCourseTypeId=?";

			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(2, Integer.parseInt(fkSemesterId));
			pstmt.setInt(3, Integer.parseInt(fkSectionId));
			pstmt.setInt(4, Integer.parseInt(fkSubjectId));
			pstmt.setInt(5, Integer.parseInt(teacherId));
			pstmt.setInt(6, Integer.parseInt(fkDepartmentId));
			pstmt.setInt(7, Integer.parseInt(fkSemesterId));
			pstmt.setInt(8, Integer.parseInt(fkSectionId));
			pstmt.setInt(9, Integer.parseInt(fkSubjectId));
			pstmt.setInt(10, Integer.parseInt(courseTypeId));
			pstmt.setInt(11, Integer.parseInt(courseTypeId));

			ResultSet rs = pstmt.executeQuery();

			int count=0;
			List<ViewVariables> viewVariablesList = new ArrayList<ViewVariables>();
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setDepartmentName(rs.getString(2));
				viewVariablesObj.setSemster(rs.getInt(3));
				viewVariablesObj.setSection(rs.getInt(4));
				viewVariablesObj.setSubmittedFileName(rs.getString(5));
				viewVariablesObj.setUpdateDate(rs.getTimestamp(6));
				viewVariablesObj.setName(rs.getString(7));
				viewVariablesObj.setRollNo(rs.getString(8));
				viewVariablesObj.setQuestionPaperName(rs.getString(9));
				viewVariablesObj.setStatus((rs.getInt(10)==0?"Pending":"Submitted"));
				viewVariablesObj.setDueDate(rs.getTimestamp(11));
				viewVariablesList.add(viewVariablesObj);

			}

			Gson json = new Gson();

			result = json.toJson(viewVariablesList);

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
