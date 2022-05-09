package com.college.dao.studentDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.MapStudentSubject;
import com.college.model.StudentAssignment;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class MapStudentSubjectDao {

	public Map<String, Object> getAllSubjects(Integer fkStudentPkId, Integer fkDepartmentId, Integer fkSemesterId,
			Integer fkSectionId) {
		Map<String, Object> mapSubjectList = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = "Select * from map_student_subject "
					+ " INNER JOIN subject ON map_student_subject.fkSubjectId=subject.pkSubjectId"
					+ " where fkStudentPkId=? and fkDepartmentId=? and fkSemester=? and fkSection=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, fkStudentPkId);
			pstmt.setInt(2, fkDepartmentId);
			pstmt.setInt(3, fkSemesterId);
			pstmt.setInt(4, fkSectionId);
			ResultSet rs = pstmt.executeQuery();

			List<MapStudentSubject> subjectList = new ArrayList<MapStudentSubject>();
			int totalSubjects = 0, totalLabs = 0, totalNotes = 0;
			while (rs.next()) {

				MapStudentSubject subject = new MapStudentSubject();

				subject.setPkstudentSubjectMapId(rs.getInt("pkstudentSubjectMapId"));
				subject.setFkStudentPkId(rs.getInt("fkStudentPkId"));
				subject.setFkDepartment(rs.getInt("fkDepartment"));
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

	public Integer getTotalNotes(Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId) {
		Integer notesCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
			if (fkSubjectId == null) {
				query = "select count(*) from notes where fkDepartmentId=? and fkSemesterId=? and fkSectionId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
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

	public String getAllAssigmentCount(Integer studentId, Integer departmentId, Integer sectionId, Integer semesterId,
			Integer subjectId) {
		int count = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		JsonObject obj = new JsonObject();
		try {
			String query = "select count(*) from student_assignment_status where fkStudentId=? and fkDepartmentId=? and fkSemesterId=?"
					+ " and fkSectionId=? and fkSubjectId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, studentId);
			pstmt.setInt(2, departmentId);
			pstmt.setInt(3, semesterId);
			pstmt.setInt(4, sectionId);
			pstmt.setInt(5, subjectId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
				obj.addProperty("count", count);
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

		return obj.toString();

	}

	public String getAllAssigment(Integer studentId, Integer departmentId, Integer sectionId, Integer semesterId,
			Integer subjectId, Integer start, Integer limit) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = "SELECT sts.pkStudentAssignmentStatusId,sts.status,sts.assignmentSolution,assign.pkAssignmentId,"
					+ "assign.assignmentName,assign.assignmentCreateDate,assign.dueDate"
					+ " FROM student_assignment_status AS sts"
					+ " INNER JOIN assignment AS assign ON sts.fkAssignmentId=assign.pkAssignmentId WHERE sts.fkStudentId=? AND sts.fkDepartmentId=?"
					+ " AND sts.fkSemesterId=? AND sts.fkSectionId=?" + " AND sts.fkSubjectId=?"
					+ " ORDER BY sts.pkStudentAssignmentStatusId LIMIT ?,?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, studentId);
			pstmt.setInt(2, departmentId);
			pstmt.setInt(3, semesterId);
			pstmt.setInt(4, sectionId);
			pstmt.setInt(5, subjectId);
			pstmt.setInt(6, start);
			pstmt.setInt(7, limit);

			ResultSet rs = pstmt.executeQuery();

			List<StudentAssignment> studentAssignmentList = new ArrayList<StudentAssignment>();

			Date date = new Date();
			Timestamp time = new Timestamp(date.getTime());
			while (rs.next()) {
				StudentAssignment studentAssignment = new StudentAssignment();
				studentAssignment.setPkStudentAssignmentStatusId(rs.getInt("pkStudentAssignmentStatusId"));
				studentAssignment.setAssignmentName(rs.getString("assignmentName"));
				studentAssignment.setPkAssignmentId(rs.getInt("assign.pkAssignmentId"));
				if (rs.getBoolean("status")) {
					studentAssignment.setStatus("Submitted");
				} else {
					studentAssignment.setStatus("Pending");
				}
				studentAssignment.setCreateDate(rs.getTimestamp("assignmentCreateDate"));
				studentAssignment.setDueDate(rs.getTimestamp("dueDate"));
				studentAssignment.setDueDatePassed(time.compareTo(rs.getTimestamp("dueDate")));

				studentAssignmentList.add(studentAssignment);
			}

			Gson json = new Gson();
			result = json.toJson(studentAssignmentList);

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
	
	public Integer getTotalSuggestion(Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId) {
		Integer suggestionCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
				query = "select count(*) from suggestion where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
				pstmt.setInt(4, fkSubjectId);
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
	
	public Integer getTotalQuestionBank(Integer fkDepartmentId, Integer fkSemesterId, Integer fkSectionId,
			Integer fkSubjectId) {
		Integer questionBankCount = 0;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query;
		try {
				query = "select count(*) from question_bank where fkDepartmentId=? and fkSemesterId=? and fkSectionId=? and fkSubjectId=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, fkDepartmentId);
				pstmt.setInt(2, fkSemesterId);
				pstmt.setInt(3, fkSectionId);
				pstmt.setInt(4, fkSubjectId);
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
	
	
	
	public String getLink(Integer courseTypeId,Integer fkDepartmentId, Integer fkYearId, Integer fkSectionId,String action) {
		
		Connection con = new DataBaseConnection().getDatabaseConnection();
		String query=null,result=null;
		try {
				
			if(action.trim().equalsIgnoreCase("feedback")){
			query = "select link from mentor_feedback_link where fkCourseTypeId=? and fkDepartmentId=? and fkYearId=? and fkSectionId=? order by updateDate desc";
			}else if(action.trim().equalsIgnoreCase("subjectChoice")){
				query = "select link from mentor_subject_choice_link where fkCourseTypeId=? and fkDepartmentId=? and fkYearId=? and fkSectionId=? order by updateDate desc";
			}
				
				
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, courseTypeId);
				pstmt.setInt(2, fkDepartmentId);
				pstmt.setInt(3, fkYearId);
				pstmt.setInt(4,fkSectionId );
				
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					
					result=rs.getString(1);
					
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
	return result;
	}	
	
	
	
	
	 public static void main(String[] args) { 
		 System.out.println(new MapStudentSubjectDao().getTotalQuestionBank(1, 4, 1, 10));
	 }
	
}
