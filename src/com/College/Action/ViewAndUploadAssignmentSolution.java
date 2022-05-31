package com.college.action;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

/**
 * Servlet implementation class ViewAndUploadAssignmentSolution
 */
@WebServlet("/ViewAndUploadAssignmentSolution")
@MultipartConfig(maxFileSize = 1024 * 1024 * 100)
public class ViewAndUploadAssignmentSolution extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewAndUploadAssignmentSolution() {
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
		Connection con = new DataBaseConnection().getDatabaseConnection();
		Integer pkAssignmentStatusId = Integer.parseInt(request.getParameter("pkAssignmentStatusId"));
		try {
			String FileName, FileExtension;
			// Get PrintWriter object
			PrintWriter out = response.getWriter();
			String query = "Select FileName,FileExtension,assignmentSolution from student_assignment_status where pkStudentAssignmentStatusId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pkAssignmentStatusId);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			FileName = rs.getString("FileName");
			FileExtension = rs.getString("FileExtension");
			Blob blob = rs.getBlob("assignmentSolution");
			InputStream inputStream = blob.getBinaryStream();
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition",
					"attachment; filename=\"" + FileName + "." + FileExtension + "\"");

			int in;
			while ((in = inputStream.read()) != -1) {
				out.write(in);
			}
			inputStream.close();
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String status = null;
		Integer pkAssignmentStatusId = Integer.parseInt(request.getParameter("assignmentId"));
		Part solutionFile = request.getPart("file");

		if (solutionFile.getSize() == 0) {

			status = "Please Choose a file.";

		} else {
			String file[] = (solutionFile.getSubmittedFileName()).split("\\.");
			String fileName = file[0];
			String fileExtension = file[1];
			InputStream solutionFileInputStream = solutionFile.getInputStream();
			Connection con = new DataBaseConnection().getDatabaseConnection();
			try {
				String uploadQuery = " UPDATE student_assignment_status SET status=?,FileName=?,FileExtension=?,assignmentSolution=?,updatedate=? WHERE pkStudentAssignmentStatusId=?";
				PreparedStatement pstmt = con.prepareStatement(uploadQuery);
				pstmt.setBoolean(1, true);
				pstmt.setString(2, fileName);
				pstmt.setString(3, fileExtension);
				pstmt.setBlob(4, solutionFileInputStream);
				pstmt.setObject(5, new Date());
				pstmt.setInt(6, pkAssignmentStatusId);
				int dbResult = pstmt.executeUpdate();
				if (dbResult > 0) {
					status = "Assignment Submitted Successfully";
				} else {
					status = "Something went wrong.Please Try agin";
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null) {
						con.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		response.getWriter().append(status);
	}

}
