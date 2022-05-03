package com.college.mentor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;

public class SubjectAllotmentDao {

	public Map<String,Object> fetchStudentList(String courseTypeId, String departmentId, String semseter, String section) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		Map<String,Object> result=new HashMap<String,Object>();
		result.put("status", false);
		try {

			String query = "Select pkRegistrationId,studentName from registration where `fkCourseType`=? and `fkdepartment`=? and `fkCurrentYearAndSem`=? and `fkSection`=? and verificationStatus=? ORDER BY pkRegistrationId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, 1);

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				studentList.add(viewVariablesObj);
			}
			result.put("status", true);
			result.put("studentList", studentList);

			
		} catch (Exception e) {
			result.put("status", false);
			e.printStackTrace();

		}

		return result;

	}
	public Map<String,Object> fetchSubjectList(String courseTypeId, String departmentId, String semseter) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		Map<String,Object> result=new HashMap<String,Object>();
		result.put("status", false);
		try {

			String query = "Select pkSubjectId,subjectName from subject where `fkCourseType`=? and `fkdepartment`=? and `fkCurrentYearAndSem`=? ORDER BY pkSubjectId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
		

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> subjectList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				subjectList.add(viewVariablesObj);
			}
			result.put("status", true);
			result.put("subjectList", subjectList);

			
		} catch (Exception e) {
			result.put("status", false);
			e.printStackTrace();

		}

		return result;

	}
	
	public String allotSubjectStudents(String courseTypeId, String departmentId, String semseter, String section,
			String studentsList, String subjectsList) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {

			String stundentsName[] = studentsList.split(",");
			String subjects[] = subjectsList.split(",");

			String query = "Insert into map_student_subject (fkCourseTypeId,fkDepartmentId,fkSemester,fkSection,fkStudentPkId,fkSubjectId,createDate,updateDate) values(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			for (int i = 0; i < stundentsName.length; i++) {

				if (!stundentsName[i].contentEquals("0")) {
					for (int j = 0; j < subjects.length; j++) {

						pstmt.setInt(1, Integer.parseInt(courseTypeId));
						pstmt.setInt(2, Integer.parseInt(departmentId));
						pstmt.setInt(3, Integer.parseInt(semseter));
						pstmt.setInt(4, Integer.parseInt(section));
						pstmt.setInt(5, Integer.parseInt(stundentsName[i]));
						pstmt.setInt(6, Integer.parseInt(subjects[j]));
						pstmt.setObject(7, new Date());
						pstmt.setObject(8, new Date());
						pstmt.addBatch();

					}

				}
			}

			int dbStatus[] = pstmt.executeBatch();

			if (dbStatus.length>0) {
				result = "Subjects Alloted Successfully";

			} else {
				result = "Something went wrong.Please try again.";
			}

		} catch (Exception e) {
			result = "Something went wrong.Please try again.";

			e.printStackTrace();

		}

		return result;

	}
	public Map<String,Object> fetchTeachersList(String departmentId) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		Map<String,Object> result=new HashMap<String,Object>();
		result.put("status", false);
		try {

			String query = "Select pkTeacherId,teacherName from teacher_registration where  `fkDepartmentId`=? and isDeleted=? ORDER BY pkTeacherId";

			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, Integer.parseInt(departmentId));
			pstmt.setInt(2, 0);

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> teacherList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				teacherList.add(viewVariablesObj);
			}
			result.put("status", true);
			result.put("studentList", teacherList);

			
		} catch (Exception e) {
			result.put("status", false);
			e.printStackTrace();

		}

		return result;

	}
	
	
	public String allotSubjectTeachers(String courseTypeId, String departmentId, String semseter, String section,
			String teachersList, String subjectsList) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;

		try {

			String teachersName[] = teachersList.split(",");
			String subjects[] = subjectsList.split(",");

			String query = "Insert into map_teacher_subject (fkCourseTypeId,fkDepartmentId,fkSemester,fkSection,fkTeacherPkId,fkSubjectId,createDate,updateDate) values(?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			for (int i = 0; i < teachersName.length; i++) {

				if (!teachersName[i].contentEquals("0")) {
					for (int j = 0; j < subjects.length; j++) {

						pstmt.setInt(1, Integer.parseInt(courseTypeId));
						pstmt.setInt(2, Integer.parseInt(departmentId));
						pstmt.setInt(3, Integer.parseInt(semseter));
						pstmt.setInt(4, Integer.parseInt(section));
						pstmt.setInt(5, Integer.parseInt(teachersName[i]));
						pstmt.setInt(6, Integer.parseInt(subjects[j]));
						pstmt.setObject(7, new Date());
						pstmt.setObject(8, new Date());
						pstmt.addBatch();

					}

				}
			}

			int dbStatus[] = pstmt.executeBatch();

			if (dbStatus.length>0) {
				result = "Subjects Alloted Successfully";

			} else {
				result = "Something went wrong.Please try again.";
			}

		} catch (Exception e) {
			result = "Something went wrong.Please try again.";

			e.printStackTrace();

		}

		return result;

	}
}
