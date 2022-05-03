package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.college.canvas.CanvasAccountCreation;
import com.college.canvas.CanvasFormSubmit;
import com.college.canvas.CanvasLogin;
import com.college.dataValidation.DataValidation;
import com.college.model.CanvasAccount;
import com.college.model.TeacherDetails;

/**
 * Servlet implementation class CanvasManagement
 */
@WebServlet("/CanvasManagement")
@MultipartConfig()
public class CanvasManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CanvasManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

String action=request.getParameter("action");


	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String action=request.getParameter("action");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String department=request.getParameter("department");
		String password=request.getParameter("password");
		String personType=request.getParameter("personType");
		String id=request.getParameter("id");
		String postType=request.getParameter("postType");
		String fileType=request.getParameter("fileType");
		String title=request.getParameter("title");
		Part file=request.getPart("file");
		
		
		String result=null;
		PrintWriter out=response.getWriter();
		
		if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("canvasAccount")) {
			
			String dataValidationResult= new DataValidation().canvasAccountDataValidation(name, email, department,password);
			
			if(dataValidationResult.trim().equalsIgnoreCase("True")) {
				
			result=new CanvasAccountCreation().canvasAccountCreation(name, email, department,password);
			
				
			}else {
				result="Please Select/Enter "+dataValidationResult;
			}
			out.print(result);
						
		}
		if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("canvasLogin")) {

			String dataValidationResult = new DataValidation().canvasAccountDataValidation(name, email, department,
					password);

			if (dataValidationResult.trim().equalsIgnoreCase("True")) {

				Map<String, Object> loginValidation = new CanvasLogin().validateDetails(name, email, department,
						password);

				if ((boolean) loginValidation.get("status")) {
					result = "eventManage.jsp";
					HttpSession session = request.getSession();
					session.setAttribute("canvas", (CanvasAccount) loginValidation.get("canvas"));
					out.print(result);
				} else {
					result = (String) loginValidation.get("error");
					out.print(result);
				}

			} else {
				result = "Please Select/Enter " + dataValidationResult;
				out.print(result);
			}

		}
		else if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("canvasForm")) {
			
			String dataValidationResult=null;
			if(postType.trim().isEmpty() && (postType.trim().equalsIgnoreCase("2") || postType.trim().equalsIgnoreCase("3")))
			{
				dataValidationResult= new DataValidation().canvasFormDataValidationWithWriteUp(personType,name,department,id,postType,title,fileType,file);

				if(dataValidationResult.trim().equalsIgnoreCase("True")) {
					
					result=new CanvasFormSubmit().submitCanvasFormWithWriteUp(personType,name,department,id,postType,title,fileType,file);
					
						
					}else {
						result="Please Select/Enter "+dataValidationResult;
					}
				
				
			}else {
				
				dataValidationResult= new DataValidation().canvasFormDataValidationWithoutWriteUp(personType,name,department,id,postType,fileType,file);
				if(dataValidationResult.trim().equalsIgnoreCase("True")) {
					
					result=new CanvasFormSubmit().submitCanvasFormWithoutWriteUp(personType,name,department,id,postType,fileType,file);
					
						
					}else {
						result="Please Select/Enter "+dataValidationResult;
					}
			}
			
			out.print(result);
						
		}
		
		else {
			
			result = "Something went wrong.Please try again";
			out.print(result);
		}
		
		
		
	}

}
