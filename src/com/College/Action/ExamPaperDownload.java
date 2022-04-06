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

import com.college.dao.Exam.ExamPaper;
import com.college.dao.studentDao.ViewStudentMaterials;

/**
 * Servlet implementation class ExamPaperDownload
 */
@WebServlet("/ExamPaperDownload")
public class ExamPaperDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExamPaperDownload() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
  
		String paperId=request.getParameter("id");
		String action=request.getParameter("action");		
	    PrintWriter out=response.getWriter();
	    try {
		if(action.toLowerCase().contains("download")) {
			Map<String, Object> examQuestionData=new ExamPaper().downloadExamPaper(paperId);
		 
			if((boolean) examQuestionData.get("status")) {
				String fileName=(String) examQuestionData.get("fileName");
				String fileExtension=(String) examQuestionData.get("fileExtension");
				InputStream inputStream=(InputStream) examQuestionData.get("fileData");
				
				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition",
						"inline; filename=\"" + fileName + "." + fileExtension + "\"");

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
		}else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error while downloading file.Please try again.');");
			out.println("</script>");
		}
	
	    }catch(Exception e) {
	    	e.printStackTrace();
	    	out.println("<script type=\"text/javascript\">");
			out.println("alert('Error while downloading file.Please try again.');");
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
