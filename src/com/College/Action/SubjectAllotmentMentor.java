package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dataValidation.DataValidation;
import com.college.mentor.dao.SubjectAllotmentDao;

/**
 * Servlet implementation class SubjectAllotmentMentor
 */
@WebServlet("/SubjectAllotmentMentor")
@MultipartConfig()
public class SubjectAllotmentMentor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubjectAllotmentMentor() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String courseTypeId = request.getParameter("course");
		String departmentId = request.getParameter("department");
		String semseter = request.getParameter("yearSemester");
		String section = request.getParameter("section");
		String studentsName = request.getParameter("studentsName");
		String teacherName = request.getParameter("teacherName");

		
		String subjects = request.getParameter("subjects");
		String action = request.getParameter("action");
		String result = null;

		PrintWriter out = response.getWriter();

		
		if(action.trim().equalsIgnoreCase("students")) {
		String dataValidationResult = new DataValidation().subjectAllotStudentValidation( studentsName, subjects);

		if (dataValidationResult.trim().equalsIgnoreCase("True")) {

			result = new SubjectAllotmentDao().allotSubjectStudents(courseTypeId, departmentId, semseter, section,
					studentsName, subjects);
		} else {
			result = "Please Select " + dataValidationResult.trim();

		}
		}else if(action.trim().equalsIgnoreCase("teachers")) {
			String dataValidationResult = new DataValidation().subjectAllotTeacherValidation(teacherName, subjects);

			if (dataValidationResult.trim().equalsIgnoreCase("True")) {

				result = new SubjectAllotmentDao().allotSubjectTeachers(courseTypeId, departmentId, semseter, section,
						teacherName, subjects);
			} else {
				result = "Please Select " + dataValidationResult.trim();
			}
			
		}
		
		
		out.print(result);

	}

}
