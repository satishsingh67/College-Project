package com.college.attendance.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class AttendanceManagementDao {

	public static String fetchStudentListWithSubject(String courseTypeId, String departmentId, String semesterId,
			String sectionId, String subjectId) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {

			String query = "SELECT mapSubjects.fkStudentPkId,reg.studentName FROM map_student_subject AS mapSubjects "
					+ "INNER JOIN registration AS reg ON mapSubjects.fkStudentPkId=reg.pkRegistrationId "
					+ "WHERE mapSubjects.fkCourseTypeId=? "
					+ "AND mapSubjects.fkDepartmentId=? AND mapSubjects.fkSemester=? AND mapSubjects.fkSection=? AND mapSubjects.fkSubjectId=? ORDER BY mapSubjects.pkstudentSubjectMapId ";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));
			pstmt.setInt(5, Integer.parseInt(subjectId));

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> studentlist = new ArrayList<ViewVariables>();

			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				studentlist.add(viewVariablesObj);

			}

			Gson json = new Gson();
			result = json.toJson(studentlist);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}

	public List<ViewVariables> fetchStudentListWithoutSubject(String courseTypeId, String departmentId,
			String semesterId, String sectionId) {

		Connection con = new DataBaseConnection().getDatabaseConnection();
		List<ViewVariables> studentlist = new ArrayList<ViewVariables>();

		try {

			String query = "SELECT mapSubjects.fkStudentPkId,reg.studentName FROM map_student_subject AS mapSubjects "
					+ "INNER JOIN registration AS reg ON mapSubjects.fkStudentPkId=reg.pkRegistrationId "
					+ "WHERE mapSubjects.fkCourseTypeId=? "
					+ "AND mapSubjects.fkDepartmentId=? AND mapSubjects.fkSemester=? AND mapSubjects.fkSection=? ORDER BY mapSubjects.pkstudentSubjectMapId ";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));

			ResultSet rs = pstmt.executeQuery();

			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				studentlist.add(viewVariablesObj);

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return studentlist;

	}

	public static Map<String, Object> fetchSubjectList(String courseTypeId, String departmentId, String semesterId,
			String sectionId, String studentId) {

		Connection con = new DataBaseConnection().getDatabaseConnection();
		Map<String, Object> subjectlist = new HashMap<String, Object>();

		Set<Integer> subjectListId = new LinkedHashSet<Integer>();
		Set<String> subjectName = new LinkedHashSet<String>();
		try {

			String query = "SELECT mapSubjects.fkSubjectId,subj.subjectName FROM map_student_subject AS mapSubjects "
					+ "inner join subject as subj on mapSubjects.fkSubjectId=subj.pkSubjectId "
					+ "WHERE mapSubjects.fkCourseTypeId=? "
					+ "AND mapSubjects.fkDepartmentId=? AND mapSubjects.fkSemester=? AND mapSubjects.fkSection=? AND mapSubjects.fkStudentPkId=? ORDER BY mapSubjects.pkstudentSubjectMapId ";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));
			pstmt.setInt(5, Integer.parseInt(studentId));

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				subjectListId.add(rs.getInt(1));
				subjectName.add(rs.getString(2));
			}

			subjectlist.put("subjectIdList", subjectListId);
			subjectlist.put("subjectNameList", subjectName);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return subjectlist;

	}

	public static Integer attendanceCount(String courseTypeId, String departmentId, String semesterId, String sectionId,
			String subjectId) {

		Connection con = new DataBaseConnection().getDatabaseConnection();
		Integer attendanceCount = 0;
		try {

			String query = "SELECT COUNT(*) FROM attendance_count " + "WHERE fkCourseTyeId=? "
					+ "AND fkDepartmentId=? AND fkSemesterId=? AND fkSectionId=? AND fkSubjectId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));
			pstmt.setInt(5, Integer.parseInt(subjectId));

			ResultSet rs = pstmt.executeQuery();

			rs.next();
			attendanceCount = rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return attendanceCount;

	}

	public String submitAttendance(String courseTypeId, String departmentId, String semester, String section,
			String subjectId, String teacherId, String presentId, String absentId) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = null;

			String presentIdArr[] = presentId.split(",");
			String absentIdArr[] = absentId.split(",");

			query = "INSERT INTO `attendance_count` (`fkTeacherId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`,`fkCourseTyeId`, `createDate`, `updatedate`)"
					+ " VALUES (?,?,?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, Integer.parseInt(teacherId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semester));
			pstmt.setInt(4, Integer.parseInt(section));
			pstmt.setInt(5, Integer.parseInt(subjectId));
			pstmt.setInt(6, Integer.parseInt(courseTypeId));
			pstmt.setObject(7, new Date());
			pstmt.setObject(8, new Date());

			pstmt.executeUpdate();

			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				int pkAttendanceCountId = rs.getInt(1);

				String assignmentQuery = "INSERT INTO `attendance` (`fkAttendanceCountId`,`fkTeacherId`,`fkStudentId`,`fkCourseTypeId`, `fkDepartmentId`, `fkSemesterId`, `fkSectionId`, `fkSubjectId`,`present`,`absent`,  `createDate`,`updateDate`)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?,?)";

				PreparedStatement pstmt1 = con.prepareStatement(assignmentQuery);

				if (presentId.trim().length() != 0) {
					for (int i = 0; i < presentIdArr.length; i++) {
						pstmt1.setInt(1, pkAttendanceCountId);
						pstmt1.setInt(2, Integer.parseInt(teacherId));
						pstmt1.setInt(3, Integer.parseInt(presentIdArr[i]));
						pstmt1.setInt(4, Integer.parseInt(courseTypeId));
						pstmt1.setInt(5, Integer.parseInt(departmentId));
						pstmt1.setInt(6, Integer.parseInt(semester));
						pstmt1.setInt(7, Integer.parseInt(section));
						pstmt1.setInt(8, Integer.parseInt(subjectId));
						pstmt1.setInt(9, 1);
						pstmt1.setInt(10, 0);
						pstmt1.setObject(11, new Date());
						pstmt1.setObject(12, new Date());

						pstmt1.addBatch();
					}
				}

				if (absentId.trim().length() != 0) {
					for (int i = 0; i < absentIdArr.length; i++) {
						pstmt1.setInt(1, pkAttendanceCountId);
						pstmt1.setInt(2, Integer.parseInt(teacherId));
						pstmt1.setInt(3, Integer.parseInt(absentIdArr[i]));
						pstmt1.setInt(4, Integer.parseInt(courseTypeId));
						pstmt1.setInt(5, Integer.parseInt(departmentId));
						pstmt1.setInt(6, Integer.parseInt(semester));
						pstmt1.setInt(7, Integer.parseInt(section));
						pstmt1.setInt(8, Integer.parseInt(subjectId));
						pstmt1.setInt(9, 0);
						pstmt1.setInt(10, 1);
						pstmt1.setObject(11, new Date());
						pstmt1.setObject(12, new Date());

						pstmt1.addBatch();
					}
				}

				int dbStatus[] = pstmt1.executeBatch();

				if (dbStatus.length > 0) {
					result = "Attendance Submitted Successfully.";
				} else {
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

	public static Set<Integer> fetchStudentListWithSubjectCount(String courseTypeId, String departmentId,
			String semesterId, String sectionId, String subjectId) {

		Connection con = new DataBaseConnection().getDatabaseConnection();
		Set<Integer> studentlist = new HashSet<Integer>();

		try {

			String query = "SELECT mapSubjects.fkStudentPkId FROM map_student_subject AS mapSubjects "
					+ "INNER JOIN registration AS reg ON mapSubjects.fkStudentPkId=reg.pkRegistrationId "
					+ "WHERE mapSubjects.fkCourseTypeId=? "
					+ "AND mapSubjects.fkDepartmentId=? AND mapSubjects.fkSemester=? AND mapSubjects.fkSection=? AND mapSubjects.fkSubjectId=? ORDER BY mapSubjects.pkstudentSubjectMapId ";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));
			pstmt.setInt(5, Integer.parseInt(subjectId));

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				studentlist.add(rs.getInt(1));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return studentlist;

	}

	public static Map<Integer, Object> fetchStudentAttendnace(String courseTypeId, String departmentId,
			String semesterId, String sectionId, String subjectId, Set<Integer> studentId,
			Integer totalAttendanceCount) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		Map<Integer, Object> studentAttendanceMap = new HashMap<Integer, Object>();

		try {

			StringBuffer query = new StringBuffer();

			boolean first = true;

			for (Integer id : studentId) {

				if (first) {
					first = false;
					query.append(
							"SELECT attend.fkStudentId,attend.present,attend.absent,reg.studentName  FROM attendance AS attend INNER JOIN registration AS reg ON attend.fkStudentId=reg.pkRegistrationId ");
					query.append("WHERE attend.fkCourseTypeId=" + Integer.parseInt(courseTypeId)
							+ " AND attend.fkDepartmentId=" + Integer.parseInt(departmentId)
							+ " AND attend.fkSemesterId=" + Integer.parseInt(semesterId) + " AND attend.fkSectionId="
							+ Integer.parseInt(sectionId) + " AND attend.fkSubjectId=" + Integer.parseInt(subjectId)
							+ " AND attend.fkStudentId=" + id + " ");
				} else {

					query.append(" UNION ALL ");
					query.append(
							" SELECT attend.fkStudentId,attend.present,attend.absent,reg.studentName  FROM attendance AS attend INNER JOIN registration AS reg ON attend.fkStudentId=reg.pkRegistrationId ");
					query.append("WHERE attend.fkCourseTypeId=" + Integer.parseInt(courseTypeId)
							+ " AND attend.fkDepartmentId=" + Integer.parseInt(departmentId)
							+ " AND attend.fkSemesterId=" + Integer.parseInt(semesterId) + " AND attend.fkSectionId="
							+ Integer.parseInt(sectionId) + " AND attend.fkSubjectId=" + Integer.parseInt(subjectId)
							+ " AND attend.fkStudentId=" + id + " ");

				}

			}

			Statement pstmt = con.createStatement();

			ResultSet rs = pstmt.executeQuery(query.toString());

			while (rs.next()) {

				if (studentAttendanceMap.containsKey(rs.getInt(1))) {

					ViewVariables viewVariablesObj = (ViewVariables) studentAttendanceMap.get(rs.getInt(1));
					if (rs.getInt(2) == 1) {

						viewVariablesObj.setPresentCount(viewVariablesObj.getPresentCount() + 1);
						viewVariablesObj.setAbsentCount(viewVariablesObj.getAbsentCount());
					} else {

						viewVariablesObj.setPresentCount(viewVariablesObj.getPresentCount());
						viewVariablesObj.setAbsentCount(viewVariablesObj.getAbsentCount() + 1);
					}

				} else {
					ViewVariables viewVariablesObj = new ViewVariables();
					viewVariablesObj.setName(rs.getString(4));
					viewVariablesObj.setTotalattendance(totalAttendanceCount);

					if (rs.getInt(2) == 1) {
						viewVariablesObj.setPresentCount(1);
						viewVariablesObj.setAbsentCount(0);
					} else {
						viewVariablesObj.setPresentCount(0);
						viewVariablesObj.setAbsentCount(1);
					}

					studentAttendanceMap.put(rs.getInt(1), viewVariablesObj);

				}

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return studentAttendanceMap;

	}

	public static List<ViewVariables> prepareStudentAttendance(Map<Integer, Object> studentAttendanceMap) {
		List<ViewVariables> studentAttendanceList = new ArrayList<ViewVariables>();

		try {
			int count = 0;
			for (Map.Entry<Integer, Object> mapObj : studentAttendanceMap.entrySet()) {
				count++;
				ViewVariables viewVariablesObj = (ViewVariables) mapObj.getValue();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(mapObj.getKey());
				viewVariablesObj.setPercentageAttendance(
						(viewVariablesObj.getPresentCount() * 100) / viewVariablesObj.getTotalattendance());
				studentAttendanceList.add(viewVariablesObj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return studentAttendanceList;
	}

	public static List<ViewVariables> prepareStudentAttendanceWithSubject(Map<Integer, Object> studentAttendanceMap,
			Set<Integer> subjectIdList, Map<Integer, String> subjectNameMap) {
		List<ViewVariables> studentAttendanceList = new ArrayList<ViewVariables>();

		try {

			int count = 0;

			for (Integer id : subjectIdList) {
				count++;
				if (studentAttendanceMap.containsKey(id)) {

					ViewVariables viewVariablesObj = (ViewVariables) studentAttendanceMap.get(id);
					viewVariablesObj.setSlNo(count);
					viewVariablesObj.setPkId(id);
					viewVariablesObj.setPercentageAttendance(
							(viewVariablesObj.getPresentCount() * 100) / viewVariablesObj.getTotalattendance());
					studentAttendanceList.add(viewVariablesObj);

				} else {
					ViewVariables viewVariablesObj = new ViewVariables();

					viewVariablesObj.setSlNo(count);
					viewVariablesObj.setPkId(id);
					viewVariablesObj.setName(subjectNameMap.get(id));
					viewVariablesObj.setPresentCount(0);
					viewVariablesObj.setAbsentCount(0);
					viewVariablesObj.setTotalattendance(0);
					viewVariablesObj.setPercentageAttendance(0);

					studentAttendanceList.add(viewVariablesObj);

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return studentAttendanceList;
	}

	public static String fetchAllStudentAttendanceList(String courseTypeId, String departmentId, String semesterId,
			String sectionId, String subjectId) {
		Gson json = new Gson();
		String result = null;
		try {
			// fetching student list for a particular subject
			Set<Integer> studentList = fetchStudentListWithSubjectCount(courseTypeId, departmentId, semesterId,
					sectionId, subjectId);

			if (studentList != null && studentList.size() != 0) {

				// fetching total attendance count
				Integer totalAttendanceCount = attendanceCount(courseTypeId, departmentId, semesterId, sectionId,
						subjectId);

				if (totalAttendanceCount != 0) {

					// fetching student attendance
					Map<Integer, Object> studentAttendanceMap = fetchStudentAttendnace(courseTypeId, departmentId,
							semesterId, sectionId, subjectId, studentList, totalAttendanceCount);

					// Preparing student attendance list

					List<ViewVariables> studentAttendanceList = prepareStudentAttendance(studentAttendanceMap);

					// Converting attendance to json
					result = json.toJson(studentAttendanceList);
				} else {
					result = json.toJson(null);
				}
			} else {
				result = json.toJson(null);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public String fetchStudentAttendanceList(String courseTypeId, String departmentId, String semesterId,
			String sectionId, String subjectId, String studentId) {

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "SELECT attend.pkAttendanceId,attend.present,attend.absent,attend.createDate,attend.updateDate,subj.subjectName  FROM attendance attend"
					+ " inner join subject as subj on attend.fkSubjectId=subj.pkSubjectId"
					+ "  WHERE attend.fkCourseTypeId=? AND attend.fkDepartmentId=? AND attend.fkSemesterId=? AND attend.fkSectionId=? AND attend.fkSubjectId=? AND attend.fkStudentId=? order by attend.pkAttendanceId";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, Integer.parseInt(courseTypeId));
			pstmt.setInt(2, Integer.parseInt(departmentId));
			pstmt.setInt(3, Integer.parseInt(semesterId));
			pstmt.setInt(4, Integer.parseInt(sectionId));
			pstmt.setInt(5, Integer.parseInt(subjectId));
			pstmt.setInt(6, Integer.parseInt(studentId));

			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> studentAttendanceList = new ArrayList<ViewVariables>();
			int count = 0;

			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));

				if (rs.getInt(2) == 1) {
					viewVariablesObj.setPresent("Present");
				}
				if (rs.getInt(3) == 1) {
					viewVariablesObj.setAbsent("Absent");
				}

				viewVariablesObj.setCreateDate(rs.getTimestamp(4));
				viewVariablesObj.setUpdateDate(rs.getTimestamp(5));
				viewVariablesObj.setName(rs.getString(6));

				studentAttendanceList.add(viewVariablesObj);
			}

			// Converting attendance to json
			Gson json = new Gson();
			result = json.toJson(studentAttendanceList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	public String updateAttendance(String id, String value) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			String query = "update attendance set present=?,absent=?,updateDate=?  WHERE pkAttendanceId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			if (Integer.parseInt(value.trim()) == 1) {
				pstmt.setInt(1, 1);
				pstmt.setInt(2, 0);
			} else {
				pstmt.setInt(1, 0);
				pstmt.setInt(2, 1);
			}
			pstmt.setObject(3, new Date());
			pstmt.setInt(4, Integer.parseInt(id));

			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {
				result = "Attendance Updated Successfully";
			} else {
				result = "Something went wrong.Please try again";
			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		return result;
	}

	public static Map<Integer, Object> fetchStudentAttendnaceSubjectWise(String courseTypeId, String departmentId,
			String semesterId, String sectionId, String studentId, Set<Integer> subjectId,
			Map<Integer, Integer> totalAttendanceCountMap) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		Map<Integer, Object> studentAttendanceMap = new HashMap<Integer, Object>();

		try {

			StringBuffer query = new StringBuffer();

			boolean first = true;

			for (Integer id : subjectId) {

				if (first) {
					first = false;
					query.append(
							"SELECT attend.fkSubjectId,attend.present,attend.absent,subj.subjectName  FROM attendance AS attend INNER JOIN subject AS subj ON attend.fkSubjectId=subj.pkSubjectId ");
					query.append("WHERE attend.fkCourseTypeId=" + Integer.parseInt(courseTypeId)
							+ " AND attend.fkDepartmentId=" + Integer.parseInt(departmentId)
							+ " AND attend.fkSemesterId=" + Integer.parseInt(semesterId) + " AND attend.fkSectionId="
							+ Integer.parseInt(sectionId) + " AND attend.fkSubjectId=" + id + " AND attend.fkStudentId="
							+ Integer.parseInt(studentId) + " ");
				} else {

					query.append(" UNION ALL ");
					query.append(
							"SELECT attend.fkSubjectId,attend.present,attend.absent,subj.subjectName  FROM attendance AS attend INNER JOIN subject AS subj ON attend.fkSubjectId=subj.pkSubjectId ");
					query.append("WHERE attend.fkCourseTypeId=" + Integer.parseInt(courseTypeId)
							+ " AND attend.fkDepartmentId=" + Integer.parseInt(departmentId)
							+ " AND attend.fkSemesterId=" + Integer.parseInt(semesterId) + " AND attend.fkSectionId="
							+ Integer.parseInt(sectionId) + " AND attend.fkSubjectId=" + id + " AND attend.fkStudentId="
							+ Integer.parseInt(studentId) + " ");

				}

			}

			Statement pstmt = con.createStatement();

			ResultSet rs = pstmt.executeQuery(query.toString());

			while (rs.next()) {

				if (studentAttendanceMap.containsKey(rs.getInt(1))) {

					ViewVariables viewVariablesObj = (ViewVariables) studentAttendanceMap.get(rs.getInt(1));
					if (rs.getInt(2) == 1) {

						viewVariablesObj.setPresentCount(viewVariablesObj.getPresentCount() + 1);
						viewVariablesObj.setAbsentCount(viewVariablesObj.getAbsentCount());
					} else {

						viewVariablesObj.setPresentCount(viewVariablesObj.getPresentCount());
						viewVariablesObj.setAbsentCount(viewVariablesObj.getAbsentCount() + 1);
					}

				} else {
					ViewVariables viewVariablesObj = new ViewVariables();
					viewVariablesObj.setName(rs.getString(4));
					viewVariablesObj.setTotalattendance(totalAttendanceCountMap.get(rs.getInt(1)));

					if (rs.getInt(2) == 1) {
						viewVariablesObj.setPresentCount(1);
						viewVariablesObj.setAbsentCount(0);
					} else {
						viewVariablesObj.setPresentCount(0);
						viewVariablesObj.setAbsentCount(1);
					}

					studentAttendanceMap.put(rs.getInt(1), viewVariablesObj);

				}

			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return studentAttendanceMap;

	}

	public String fetchStudentAllSubjectsAttendanceList(String courseTypeId, String departmentId, String semesterId,
			String sectionId, String studentId) {
		String result = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// fetching student list for a particular subject
			Map<String, Object> subjectListObj = fetchSubjectList(courseTypeId, departmentId, semesterId, sectionId,
					studentId);

			if (subjectListObj != null && subjectListObj.size() != 0 && !subjectListObj.isEmpty()) {

				Set<Integer> subjectList = (Set<Integer>) subjectListObj.get("subjectIdList");
				Set<String> subjectNameList = (Set<String>) subjectListObj.get("subjectNameList");

				Map<Integer, String> subjectIdVsNameMap = new HashMap<Integer, String>();

				String[] subjectNamesArr = subjectNameList.toArray(new String[subjectNameList.size()]);

				int i = 0;
				for (Integer id : subjectList) {
					subjectIdVsNameMap.put(id, subjectNamesArr[i]);
					i++;
				}

				Map<Integer, Integer> totalAttendanceSubjectMap = new HashMap<Integer, Integer>();

				// fetching total attendance count
				for (Integer subjectId : subjectList) {
					Integer totalAttendanceCount = attendanceCount(courseTypeId, departmentId, semesterId, sectionId,
							String.valueOf(subjectId));

					totalAttendanceSubjectMap.put(subjectId, totalAttendanceCount);

				}

				if (totalAttendanceSubjectMap != null && totalAttendanceSubjectMap.size() != 0
						&& !totalAttendanceSubjectMap.isEmpty()) {

					// fetching student attendance subject wise
					Map<Integer, Object> studentAttendanceMap = fetchStudentAttendnaceSubjectWise(courseTypeId,
							departmentId, semesterId, sectionId, studentId, subjectList, totalAttendanceSubjectMap);

					if (studentAttendanceMap != null && studentAttendanceMap.size() != 0
							&& !studentAttendanceMap.isEmpty()) {

						// Preparing student attendance list
						List<ViewVariables> studentAttendanceList = prepareStudentAttendanceWithSubject(
								studentAttendanceMap, subjectList, subjectIdVsNameMap);

						if (studentAttendanceList != null && studentAttendanceList.size() != 0) {

							Integer totalPercentage = 0, totalSubjectsCount = 0;

							for (ViewVariables obj : studentAttendanceList) {

								if (obj.getTotalattendance() != 0) {
									totalPercentage = obj.getPercentageAttendance() + totalPercentage;
									totalSubjectsCount++;
								}
							}

							Integer totalPercentageAttendance = totalPercentage / totalSubjectsCount;

							resultMap.put("total", totalPercentageAttendance);
							resultMap.put("attendance", studentAttendanceList);

						}

					} else {
						resultMap.put("total", null);

					}
				} else {
					resultMap.put("total", null);

				}
			} else {
				resultMap.put("total", null);

			}

			// Converting attendance to json
			Gson json = new Gson();
			result = json.toJson(resultMap);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public static void main(String[] args) {
	//	System.out.println(new AttendanceManagementDao().fetchStudentAllSubjectsAttendanceList("1", "1", "4", "1", "1"));

	}

}
