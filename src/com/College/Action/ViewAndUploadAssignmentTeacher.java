package com.college.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.teacher.dao.AssignmentUploadAndView;
import com.college.teacher.dao.UploadAndViewNotes;

/**
 * Servlet implementation class ViewAndUploadAssignmentTeacher
 */
@WebServlet("/ViewAndUploadAssignmentTeacher")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class ViewAndUploadAssignmentTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAndUploadAssignmentTeacher() {
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
		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semester = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String courseTypeId = request.getParameter("courseTypeId");

		String result = null;
		PrintWriter out = response.getWriter();
		if (!action.isEmpty() && action.trim().equalsIgnoreCase("viewAssignment")) {
			result = new AssignmentUploadAndView().viewAssignment(teacherId, departmentId, semester, section,
					subjectId,courseTypeId);
			out.print(result);
		}

		else if (!action.isEmpty() && action.trim().equalsIgnoreCase("downloadAssignment")) {
			Map<String, Object> assignmentData = new AssignmentUploadAndView().downloadAssignment(id);
			if ((boolean) assignmentData.get("status")) {
				String fileName = (String) assignmentData.get("fileName");
				String fileExtension = (String) assignmentData.get("fileExtension");
				InputStream inputStream = (InputStream) assignmentData.get("fileData");

				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + fileName + "." + fileExtension + "\"");

				int in;
				while ((in = inputStream.read()) != -1) {
					out.write(in);
				}
				inputStream.close();
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error while downloading file.Please try again.');");
				out.println("</script>");
			}

		}else {
			result="Something went wrong.Please Try again.";
			out.print(result);
		}

		
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
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String dueDate = request.getParameter("dueDate");
		Part uploadFile = request.getPart("file");
		String courseTypeId = request.getParameter("courseTypeId");
		
		PrintWriter out = response.getWriter();
		String result = null;
		try {
			if (uploadFile.getSize() != 9) {

				result = new AssignmentUploadAndView().uploadAssignment(teacherId, departmentId, semseter, section,
						subjectId, action, uploadFile, dueDate,courseTypeId);
			} else {
				result = "Please Choose a File.";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again.";
		}

		out.print(result);

	}

}
