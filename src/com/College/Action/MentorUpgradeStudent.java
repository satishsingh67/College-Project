package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.mentor.dao.ProfileUpgradation;

/**
 * Servlet implementation class MentorUpgradeStudent
 */
@WebServlet("/MentorUpgradeStudent")
@MultipartConfig()
public class MentorUpgradeStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MentorUpgradeStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String courseTypeId = request.getParameter("courseTypeId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String action = request.getParameter("action");
	
		PrintWriter out=response.getWriter();
		String result=null;
		
		if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("teacherList")) {
			
			result=new ProfileUpgradation().fetchTeacherList(courseTypeId,departmentId,semseter,section);
			
		}else if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("studentList")) {
		result=new ProfileUpgradation().fetchStudentList(courseTypeId, departmentId, semseter, section);
		
		}
		
		out.print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String teacherId = request.getParameter("teacherId");
		String action = request.getParameter("action");	
		String studentId = request.getParameter("studentId");

		PrintWriter out=response.getWriter();
		String result=null;
		
	if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("removeTeacher")) {
		
		if(teacherId.trim().length()==0) {
			result="Please select any teacher to removed";
		}else {
			result=new ProfileUpgradation().removeTeacher(teacherId);
		}
		
		out.print(result);
	}else if(!action.trim().isEmpty() && action.trim().equalsIgnoreCase("allowStudent")) {
		
		if(studentId.trim().length()==0) {
			result="Please select any student to update";
		}else {
			result=new ProfileUpgradation().allowStudent(studentId);
		}
		
		out.print(result);
	}
	}

}
