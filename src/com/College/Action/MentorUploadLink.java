package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.mentor.dao.UploadLink;

/**
 * Servlet implementation class MentorUploadLink
 */
@WebServlet("/MentorUploadLink")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class MentorUploadLink extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MentorUploadLink() {
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
		String courseTypeId = request.getParameter("courseTypeId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String linkType = request.getParameter("linkType");
		String action = request.getParameter("action");
		String result = null;
		PrintWriter out = response.getWriter();

		try {
			if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("fetch")) {

				if (!linkType.trim().equalsIgnoreCase("Select Link Type")) {
					result = new UploadLink().getLink(courseTypeId, departmentId, semseter, section, linkType);
					out.println(result);
				} else {
					result = "Please Select Link Type";
				}
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error while fetching links.Please try again.');");
				out.println("</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error while fetching links.Please try again.');");
			out.println("</script>");

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String courseTypeId = request.getParameter("courseTypeId");
		String departmentId = request.getParameter("departmentId");
		String semseter = request.getParameter("semesterId");
		String section = request.getParameter("sectionId");
		String linkType = request.getParameter("LinkType");
		String link = request.getParameter("link");

		String result = null;
		PrintWriter out = response.getWriter();
		if (linkType.trim().equalsIgnoreCase("Select Link Type")) {
			result = "Please Select Link Type";
			out.print(result);
		} else if (link.trim().isEmpty()) {
			result = "Please Enter Link";
			out.print(result);
		} else {

			result = new UploadLink().uploadLink(courseTypeId, departmentId, semseter, section, linkType, link);
			out.print(result);
		}

	}

}
