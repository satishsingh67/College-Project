package com.college.teacher.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.MapTeacherSubject;


public class MapTeacherSubjectDao {

	public Map<String, Object> getAllSubjects(Integer fkStudentPkId, Integer fkDepartmentId) {
		Map<String, Object> mapSubjectList = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Select * from map_teacher_subject "
					+ " INNER JOIN subject ON map_teacher_subject.fkSubjectId=subject.pkSubjectId"
					+ " INNER JOIN department ON map_teacher_subject.fkDepartmentId=department.pkDepartmentId"
					+ " INNER JOIN year_semester ON map_teacher_subject.fkSemester=year_semester.pkYearSemesterId"
					+ " INNER JOIN section ON map_teacher_subject.fkSection=section.pkSectionId"
					+ " where fkTeacherPkId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fkStudentPkId);
			ResultSet rs = pstmt.executeQuery();

			List<MapTeacherSubject> subjectList = new ArrayList<MapTeacherSubject>();
			int totalSubjects = 0, totalLabs = 0, totalNotes = 0;
			while (rs.next()) {

				MapTeacherSubject subject = new MapTeacherSubject();

				subject.setPkTeacherSubjectMapId(rs.getInt("pkTeacherSubjectMapId"));
				subject.setFkTeacherPkId(rs.getInt("fkTeacherPkId"));
				subject.setFkDepartment(rs.getInt("fkDepartment"));
				subject.setDepartmentShortName(rs.getString("department.shortName"));
				subject.setDepartmentLongName(rs.getString("department.longName"));
                subject.setSection(rs.getInt("section.section"));
                subject.setYear(rs.getInt("year_semester.Year"));
                subject.setSemester(rs.getInt("year_semester.Semester"));
				subject.setFkSemester(rs.getInt("fkSemester"));
				subject.setFkSubjectId(rs.getInt("fkSubjectId"));
				subject.setSubjectCode(rs.getString("subjectCode"));
				subject.setSubjectName(rs.getString("subjectName"));
				if (rs.getInt("fkSubjectType") == 1) {
					totalSubjects++;
				} else {
					totalLabs++;
				}
				subject.setSubjectType(rs.getInt("fkSubjectType") );
				subjectList.add(subject);
			}
			mapSubjectList.put("totalSubjects", totalSubjects);
			mapSubjectList.put("totalLabs", totalLabs);
			mapSubjectList.put("totalNotes", totalNotes);
			mapSubjectList.put("subjects", subjectList);

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

		return mapSubjectList;
	}
	
	public Integer getTotalNotes(Integer teacherId,Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId,String action) {
		Integer notesCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
			if (action!=null && action.trim().equalsIgnoreCase("total")) {
				query = "select count(*) from notes where fkTeacherId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, teacherId);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				notesCount = rs.getInt(1);

			} else {
				query = "select count(*) from notes where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
				pstmt.setInt(4, fkSubjectId);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				notesCount = rs.getInt(1);
			}

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

		return notesCount;
	}
	
	public Integer getTotalSuggestion(Integer teacherId,Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId) {
		Integer suggestionCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
				query = "select count(*) from suggestion where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
				pstmt.setInt(4, fkSubjectId);
				pstmt.setInt(5, teacherId);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				suggestionCount = rs.getInt(1);

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
	return suggestionCount;
	}		
	
	public Integer getTotalQuestionBank(Integer teacherId,Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId) {
		Integer questionBankCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
				query = "select count(*) from question_bank where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=? and fkTeacherId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
				pstmt.setInt(4, fkSubjectId);
				pstmt.setInt(5, teacherId);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				questionBankCount = rs.getInt(1);

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
	return questionBankCount;
	}	
	
	
	
	public static void main(String[] args) {
		Map<String, Object> s=new MapTeacherSubjectDao().getAllSubjects(1, null);
	System.out.println(s.get("subjects"));
	List<MapTeacherSubject> subjects=(List<MapTeacherSubject>)s.get("subjects");

	for(MapTeacherSubject obj:subjects){
		System.out.println(obj.getDepartmentShortName());
		
	}
	}
	
	
}
