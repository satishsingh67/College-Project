package com.college.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.mentor.dao.MentorUploadFilesDao;
import com.college.teacher.dao.AssignmentUploadAndView;

/**
 * Servlet implementation class MentorUploadFiles
 */
@WebServlet("/MentorUploadFiles")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class MentorUploadFiles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorUploadFiles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String courseTypeId = request.getParameter("courseTypeId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String action = request.getParameter("action");
		String action1 = request.getParameter("action1");
		String id = request.getParameter("id");

		String result = null;
		PrintWriter out = response.getWriter();

		if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("fetch")) {

			result = new MentorUploadFilesDao().fetchUploadedFiles(action1, courseTypeId, departmentId, semseter,
					section);
			out.print(result);
		} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("download")) {
			Map<String, Object> fileData = new MentorUploadFilesDao().downloadFiles(id, action1);
			if ((boolean) fileData.get("status")) {
				String fileName = (String) fileData.get("fileName");
				String fileExtension = (String) fileData.get("fileExtension");
				InputStream inputStream = (InputStream) fileData.get("fileData");

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

		} else {
			result = "Something went wrong.Please Try again.";
			out.print(result);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String courseTypeId=request.getParameter("courseTypeId");
		String departmentId=request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String action = request.getParameter("action");
		Part uploadFile = request.getPart("file");
		PrintWriter out = response.getWriter();
		String result = null;
		
		try {
			if (uploadFile.getSize() != 9) {

				result = new MentorUploadFilesDao().uploadFiles(action,courseTypeId,departmentId,semseter,section,uploadFile);
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
