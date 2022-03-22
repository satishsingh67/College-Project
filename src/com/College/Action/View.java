package com.college.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.college.dao.studentDao.ViewStudentMaterials;

/**
 * Servlet implementation class View
 */
@WebServlet("/View")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public View() {
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
		PrintWriter out = response.getWriter();
		String result = null;
		String fkDepartmentId = request.getParameter("departmentId");
		String fkSemesterId = request.getParameter("semesterId");
		String fkSectionId = request.getParameter("sectionId");
		String fkSubjectId = request.getParameter("subjectId");
        String downloadId=request.getParameter("id");
		String action = request.getParameter("action");

		ViewStudentMaterials viewStudentMaterialsObj = new ViewStudentMaterials();
		if (action.equalsIgnoreCase("notes")) {
			result = viewStudentMaterialsObj.viewNotes(fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId);
			out.print(result);
		}
		
		else if (action.equalsIgnoreCase("suggestion")) {
			result = viewStudentMaterialsObj.viewSuggestion(fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId);
			out.print(result);
		}
		
		else if (action.equalsIgnoreCase("questionBank")) {
			result = viewStudentMaterialsObj.viewQuestionBank(fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId);
			out.print(result);
		}
         
		else if(action.toLowerCase().contains("download")) {
			Map<String, Object> studentMaterialData=new ViewStudentMaterials().downloadStudentMaterial(action,downloadId);
		 
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
		else{
			//out.write("Error while processing your request.Please try again.");
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Error while processing your request.Please try again.');");
		out.println("</script>");
		}
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
