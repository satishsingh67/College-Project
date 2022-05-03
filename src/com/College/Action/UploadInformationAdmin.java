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

import com.college.admin.dao.updateInformation;

/**
 * Servlet implementation class UploadInformationAdmin
 */
@WebServlet("/UploadInformationAdmin")
@MultipartConfig(maxFileSize = 16177215)
public class UploadInformationAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadInformationAdmin() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String text = request.getParameter("text");
		String type = request.getParameter("type");
		Part file = request.getPart("file");

		String result = null;
		PrintWriter out = response.getWriter();

		try {
			result = new updateInformation().updateInformationMethod(text, type, file, action);

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		out.print(result);

	}

}
