package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.dao.studentDao.StudentLoginValidation;

/**
 * Servlet implementation class StudentProfileUpdate
 */
@WebServlet("/StudentProfileUpdate")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class StudentProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id=request.getParameter("id");
		String action=request.getParameter("action");
		String semester=request.getParameter("semester");
		String oldSemester=request.getParameter("oldSemester");
		String DOB=request.getParameter("DOB");
		String guardianName=request.getParameter("guardianName");
		String guardianNumber=request.getParameter("guardianNumber");
		String guardianEmailId=request.getParameter("guardianEmailId");
		String studentAddress=request.getParameter("studentAddress");
		String studentBloodGroup=request.getParameter("bloodGroup");

		
        Part studentPhoto=request.getPart("studentPhoto");
	
		String result=null;
		PrintWriter out=response.getWriter();
        try {
        if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("updateStudentDetails")) {
        	
        	if(oldSemester.trim().contentEquals(semester)) {
        		if(!studentBloodGroup.trim().isEmpty() || !DOB.trim().isEmpty() || !guardianName.trim().isEmpty() || !guardianNumber.trim().isEmpty() ||
            			!guardianEmailId.trim().isEmpty() || !studentAddress.trim().isEmpty() || studentPhoto.getSize()!=0)
            	{
            		result=new StudentLoginValidation().updateStudentProfile(id,oldSemester,semester,DOB,guardianName,guardianNumber,guardianEmailId,studentAddress,studentPhoto,studentBloodGroup);
            	}else {
            		result="Please change any details to update profile";
            	}
        	}else {
        		if(semester.trim().length()==1) {
        			result=new StudentLoginValidation().updateStudentProfile(id,oldSemester,semester,DOB,guardianName,guardianNumber,guardianEmailId,studentAddress,studentPhoto,studentBloodGroup);
        			
        		}else {
        			result="Please enter a valid semester";
        		}
        	}
        }else {
        	result="Something went wrong.Please try again";
        }
        }catch (Exception e) {
        	result="Something went wrong.Please try again";
		}
        out.print(result);
        
        
     
	}

}
