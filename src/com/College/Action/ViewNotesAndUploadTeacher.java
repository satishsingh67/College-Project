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

import com.college.dao.studentDao.ViewStudentMaterials;
import com.college.teacher.dao.UploadAndViewNotes;

/**
 * Servlet implementation class ViewNotesAndUploadTeacher
 */
@WebServlet("/ViewNotesAndUploadTeacher")
@MultipartConfig(maxFileSize = 16177215)
public class ViewNotesAndUploadTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewNotesAndUploadTeacher() {
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
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String query=request.getParameter("query");
		String downloadId=request.getParameter("id");
		String result=null;
		PrintWriter out = response.getWriter();
		try {
		if(!action.isEmpty() && action.trim().equalsIgnoreCase("view")) {
		
			result= new UploadAndViewNotes().viewNotesAndOtherData(teacherId, departmentId, semseter, section, subjectId, query);
			
		}
		else if(!action.isEmpty() && action.trim().equalsIgnoreCase("download")) {
			Map<String, Object> studentMaterialData=new ViewStudentMaterials().downloadStudentMaterial(query,downloadId);
			 
			if((boolean) studentMaterialData.get("status")) {
				String fileName=(String) studentMaterialData.get("fileName");
				String fileExtension=(String) studentMaterialData.get("fileExtension");
				InputStream inputStream=(InputStream) studentMaterialData.get("fileData");
				
				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + fileName + "." + fileExtension + "\"");

				int in;
				while ((in = inputStream.read()) != -1) {
					out.write(in);
				}
				inputStream.close();
			}else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error while downloading file.Please try again.');");
				out.println("</script>");
			}
		}
		
		else {
			result = "Something went wrong.Please try again.";
		}

		}catch(Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again.";
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

		String teacherId = request.getParameter("teacherId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String subjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		Part uploadFile = request.getPart("file");

		PrintWriter out = response.getWriter();
		String result = null;
		try {
			if (uploadFile != null) {

				result = new UploadAndViewNotes().uploadNotes(teacherId, departmentId, semseter, section, subjectId,
						action, uploadFile);

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
