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
import com.google.gson.Gson;

public class ProfileUpgradation {

	public static String fetchTeacherList(String courseTypeId, String departmentId, String semseter, String section) {
		// TODO Auto-generated method stub

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "Select mpSubject.pkTeacherSubjectMapId,reg.teacherName,subj.subjectName from map_teacher_subject as mpSubject "
					+ " inner join subject as subj on mpSubject.fkSubjectId=subj.pkSubjectId "
					+ " inner join teacher_registration as reg on mpSubject.fkTeacherPkId=reg.pkTeacherId "
					+ " where mpSubject.fkCourseTypeId=? and mpSubject.fkDepartmentId=? and mpSubject.fkSemester=? and mpSubject.fkSection=? and  mpSubject.isRemoved=? group by mpSubject.fkSubjectId order by mpSubject.pkTeacherSubjectMapId";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, 0);

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> teacherList = new ArrayList<ViewVariables>();
			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setSubjectName(rs.getString(3));

				teacherList.add(viewVariablesObj);
			}

			Gson json = new Gson();
			result = json.toJson(teacherList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	public String fetchStudentList(String courseTypeId, String departmentId, String semseter, String section) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "Select pkRegistrationId,studentName from registration where `fkCourseType`=? and `fkdepartment`=? and `fkCurrentYearAndSem`=? and `fkSection`=? and verificationStatus=? and isSemesterUpdateEnable=? ORDER BY pkRegistrationId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semseter));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, 1);
			pstmt.setInt(6, 0);

			ResultSet rs = pstmt.executeQuery();
			int count = 0;
			List<ViewVariables> studentList = new ArrayList<ViewVariables>();
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				studentList.add(viewVariablesObj);
			}

			Gson json = new Gson();
			result = json.toJson(studentList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}

	public String removeTeacher(String teacherId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {

			String teacherArr[] = teacherId.split(",");

			String query = "update map_teacher_subject set isRemoved=?,updateDate=? where pkTeacherSubjectMapId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			for (int i = 0; i < teacherArr.length; i++) {

				pstmt.setInt(1, 1);
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(teacherArr[i]));

				pstmt.addBatch();
			}

			int dbResult[] = pstmt.executeBatch();

			if (dbResult.length > 0) {
				result = "Teacher Removed From Subject Successfully";
			} else {
				result = "Something went wrong.Please Try again";

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "Something went wrong.Please Try again";
		}

		return result;
	}

	public static void main(String[] args) {
		System.out.println(fetchTeacherList("1", "1", "4", "1"));
	}

	public String allowStudent(String studentId) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {

			String studentIdArr[] = studentId.split(",");

			String query = "update registration set isSemesterUpdateEnable=?,updateDate=? where pkRegistrationId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			for (int i = 0; i < studentIdArr.length; i++) {

				pstmt.setInt(1, 1);
				pstmt.setObject(2, new Date());
				pstmt.setInt(3, Integer.parseInt(studentIdArr[i]));

				pstmt.addBatch();
			}

			int dbResult[] = pstmt.executeBatch();

			if (dbResult.length > 0) {
				result = "Student Allwoed Successfully";
			} else {
				result = "Something went wrong.Please Try again";

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = "Something went wrong.Please Try again";
		}

		return result;
	}

}
