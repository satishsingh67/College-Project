package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.attendance.dao.AttendanceManagementDao;

/**
 * Servlet implementation class AttendanceManagement
 */
@WebServlet("/AttendanceManagement")
@MultipartConfig()
public class AttendanceManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AttendanceManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semester = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String courseTypeId = request.getParameter("courseTypeId");
		String studentId = request.getParameter("studentId");
		String id = request.getParameter("id");
		String value = request.getParameter("value");

		PrintWriter out = response.getWriter();
		String result = null;

		try {

			if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("studentList")) {

				result = new AttendanceManagementDao().fetchStudentListWithSubject(courseTypeId, departmentId, semester,
						section, subjectId);

			} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("allStudentAttendanceList")) {

				result = new AttendanceManagementDao().fetchAllStudentAttendanceList(courseTypeId, departmentId,
						semester, section, subjectId);

			} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("studentAttendanceList")) {

				result = new AttendanceManagementDao().fetchStudentAttendanceList(courseTypeId, departmentId, semester,
						section, subjectId, studentId);

			} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("updateAttendance")) {

				if (value.trim().equalsIgnoreCase("--Select--")) {

					result = "Please choose status to update attendance";
				} else {
					result = new AttendanceManagementDao().updateAttendance(id, value);

				}

			}else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("subjectStudentAttendanceList")) {

				result = new AttendanceManagementDao().fetchStudentAllSubjectsAttendanceList(courseTypeId, departmentId, semester,
						section, studentId);

			}
			
			
			
			else {
				result = "Something went wrong.Please try again";

			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		}

		out.print(result);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semester = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String courseTypeId = request.getParameter("courseTypeId");
		String presentId = request.getParameter("presentId");
		String absentId = request.getParameter("absentId");

		PrintWriter out = response.getWriter();
		String result = null;

		try {

			if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("submitAttendance")) {
				result = new AttendanceManagementDao().submitAttendance(courseTypeId, departmentId, semester, section,
						subjectId, teacherId, presentId, absentId);

			} else {

				result = "Something went wrong.Please try again.";

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		out.print(result);

	}

}
