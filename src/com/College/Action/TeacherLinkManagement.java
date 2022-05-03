package com.college.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.teacher.dao.LinkManagement;

/**
 * Servlet implementation class TeacherLinkManagement
 */
@WebServlet("/TeacherLinkManagement")
public class TeacherLinkManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
	LinkManagement linkManagementObj = new LinkManagement();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TeacherLinkManagement() {
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
		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semseter");
		String section = request.getParameter("section");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String meetLink = request.getParameter("meetingLink");
        String appLink=request.getParameter("appLink");
		String examType=request.getParameter("examType");
		String result = null;

		if (action.trim().equalsIgnoreCase("dailyClassLink")) {
			if (!meetLink.isEmpty()) {
				result = linkManagementObj.uploadDailyClassLink(teacherId, departmentId, semseter, section, subjectId,
						meetLink);
			} else {
				result = "Please Enter Meeting Link";
			}
		}
		else if(action.trim().equalsIgnoreCase("appLink")) {
			if (!appLink.isEmpty()) {
				result = linkManagementObj.uploadApplicationLink(teacherId, departmentId, semseter, section, subjectId, appLink);
			} else {
				result = "Please Enter Application Link";
			}
		}
		else if(action.trim().equalsIgnoreCase("examLink")) {
			if (!meetLink.isEmpty()) {
				result = linkManagementObj.uploadExamMeetingLink(examType, teacherId, departmentId, semseter, section, subjectId,meetLink);
			} else {
				result = "Please Enter Exam Link";
			}
		}
		else if(action.trim().equalsIgnoreCase("semExamLink")) {
			if (!meetLink.isEmpty()) {
				result = linkManagementObj.uploadSemExamMeetingLink(examType, departmentId, semseter, section, meetLink);
			} else {
				result = "Please Enter Exam Link";
			}
		}
		
		
		else {
			result = "Something went wrong.Please Try Again.";
		}

		response.getWriter().append(result);
	}

}
