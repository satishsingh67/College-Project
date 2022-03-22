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

import com.college.dao.Exam.LabDataHandling;
import com.college.dao.studentDao.ViewStudentMaterials;

/**
 * Servlet implementation class LabHandler
 */
@WebServlet("/LabHandler")
@MultipartConfig(maxFileSize = 16177215)
public class LabHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LabHandler() {
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
		String action1 = request.getParameter("action1");
        String studentId=request.getParameter("studentId");
        
        if(action.trim().toLowerCase().contains("viewweeklylab")) {
        	
        	result= new LabDataHandling().viewLabCopyHistory(studentId, fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId, action);
        	out.append(result);
        }
		else if(action.toLowerCase().contains("download")) {
			Map<String, Object> studentMaterialData=new LabDataHandling().downloadLabCopy(action1, downloadId);
		 
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
		String studentId = request.getParameter("studentId");
		String fkDepartmentId = request.getParameter("departmentId");
		String fkSemesterId = request.getParameter("semesterId");
		String fkSectionId = request.getParameter("sectionId");
		String fkSubjectId = request.getParameter("subjectId");
		String action = request.getParameter("action");
		String isFinalLabCopy = request.getParameter("isFinalLabCopy");
		Part labCopy = request.getPart("file");

		String result = null;
		PrintWriter out = response.getWriter();

		if (labCopy.getSize() == 0) {
			result = "Please Choose a File";

		} else {
			String submitResult = new LabDataHandling().submitLabCopy(studentId, fkDepartmentId, fkSemesterId,
					fkSectionId, fkSubjectId, labCopy, action, Boolean.valueOf(isFinalLabCopy.trim()));
			if (submitResult.trim().equalsIgnoreCase("submitted")) {
				result = (action.trim().equalsIgnoreCase("submitweeklylaboutput")
						? "Your Output file Submitted Successfully"
						: "Your Lab file Submitted Successfully");
			} else if (submitResult.trim().equalsIgnoreCase("Not Submitted")) {
				result = "Unable To Submit Your File.Please Try Again";
			} else {
				result = submitResult;
			}
		}

		out.append(result);
		out.close();
	}

}
