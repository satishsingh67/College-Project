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

import com.college.admin.dao.updateInformation;
import com.college.teacher.dao.AssignmentUploadAndView;

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

		String action = request.getParameter("action");
		String id = request.getParameter("id");
		String result = null;
		PrintWriter out = response.getWriter();

		if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("notices")) {

			result = new updateInformation().fetchNotices();
			out.print(result);
		} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("popUp")) {

			result = new updateInformation().fetchPopUp();
			out.print(result);
		} else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("downloadNotices")) {
			Map<String, Object> fileData =  new updateInformation().downloadNoticeFile(id);
			if ((boolean) fileData.get("status")) {
				String fileName = (String) fileData.get("fileName");
				String fileExtension = (String) fileData.get("fileExtension");
				InputStream inputStream = (InputStream) fileData.get("fileData");

				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + fileName + "." + fileExtension + "\"");

				int in;
				while ((in = inputStream.read()) != -1) {
					out.write(in);
				}
				inputStream.close();
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error while downloading file.Please try again.');");
				out.println("</script>");
			}

		}else if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("downloadPopUp")) {
			Map<String, Object> fileData =  new updateInformation().downloadPopUpFile(id);
			if ((boolean) fileData.get("status")) {
				String fileName = (String) fileData.get("fileName");
				String fileExtension = (String) fileData.get("fileExtension");
				InputStream inputStream = (InputStream) fileData.get("fileData");

				response.setContentType("APPLICATION/OCTET-STREAM");
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + fileName + "." + fileExtension + "\"");

				int in;
				while ((in = inputStream.read()) != -1) {
					out.write(in);
				}
				inputStream.close();
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Error while downloading file.Please try again.');");
				out.println("</script>");
			}

		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		String text = request.getParameter("text");
		Part file = request.getPart("file");

		String result = null;
		PrintWriter out = response.getWriter();

		try {
			result = new updateInformation().updateInformationMethod(text, file, action);

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		out.print(result);

	}

}
