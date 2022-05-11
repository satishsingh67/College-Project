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

import com.college.dao.Exam.AnswerScript;
import com.college.dao.studentDao.ViewStudentMaterials;

/**
 * Servlet implementation class AnswerScriptSubmit
 */
@WebServlet("/AnswerScriptSubmit")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class AnswerScriptSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerScriptSubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		String answerScriptId=request.getParameter("id");
		PrintWriter out=response.getWriter();
		if(action.toLowerCase().contains("download")) {
			Map<String, Object> answerScriptDownload=new AnswerScript().downloadAnswerScriptPaper(answerScriptId);
		 
			if((boolean) answerScriptDownload.get("status")) {
				String fileName=(String) answerScriptDownload.get("fileName");
				String fileExtension=(String) answerScriptDownload.get("fileExtension");
				InputStream inputStream=(InputStream) answerScriptDownload.get("fileData");
				
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
		}else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error while downloading file.Please try again.');");
			out.println("</script>");
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String studentId=request.getParameter("studentId");
		String fkDepartmentId = request.getParameter("departmentId");
		String fkSemesterId = request.getParameter("semesterId");
		String fkSectionId = request.getParameter("sectionId");
		String fkSubjectId = request.getParameter("subjectId");
		String fkQuestionPaperId=request.getParameter("questionPaperId");
		String fkExamTypeId=request.getParameter("examTypeId");
		Part answerScript=request.getPart("file");
		String action = request.getParameter("action");
		String courseTypeId = request.getParameter("courseTypeId");

		String result=null;
		if(action.toLowerCase().contains("scriptsubmit")) {
			if(answerScript.getSize() == 0) {
				result="Please Choose a file.";
				
			}else {
				String submitStatus=new AnswerScript().submitAnswerScript(fkQuestionPaperId, fkExamTypeId, studentId, fkDepartmentId, fkSemesterId, fkSectionId, fkSubjectId, answerScript,courseTypeId);
				if(submitStatus.toLowerCase().contains("successfully")) {
					result=submitStatus;
				}else {
					result=submitStatus;
				}
			}
		}else {
			result="Something went wrong.Please Try again.";
		}

		response.getWriter().append(result);
	}

}
