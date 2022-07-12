package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.admin.dao.AccountCreation;
import com.college.DataValidation.DataValidation;

/**
 * Servlet implementation class MentorRegistration
 */
@WebServlet("/MentorRegistration")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class MentorRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MentorRegistration() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String department = request.getParameter("department");
		String email = request.getParameter("email");
		String course = request.getParameter("course");
		String section = request.getParameter("section");
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		String year = request.getParameter("year");
		String action = request.getParameter("action");

		String result = null;
		PrintWriter out = response.getWriter();

		if (action.trim().equalsIgnoreCase("mentorAccount")) {

			String dataValidationResult = new DataValidation().mentorAccountDataValidation(name, email, department,
					year, gender, course, password);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				result = new AccountCreation().createMentorAccount(name, email, department, year, gender, section,
						course, password);

			} else {

				result = "Please Enter/Choose " + dataValidationResult;
			}

		} else if (action.trim().equalsIgnoreCase("mentorAccountDelete")) {

			String dataValidationResult = new DataValidation().teacherAccountDeleteDataValidation(id, email);

			if (dataValidationResult.trim().equalsIgnoreCase("true")) {

				result = new AccountCreation().deleteMentorAccount(id, email);

			} else {

				result = "Please Enter " + dataValidationResult;
			}

		}
		out.print(result);

	}

}
