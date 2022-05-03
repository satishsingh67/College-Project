package com.college.admin.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class updateInformation {

	public String updateInformationMethod(String text, String type, Part file, String action) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			if (text.trim().isEmpty() && type.trim().equalsIgnoreCase("select file type") && file.getSize() <= 9) {
				result = "Please Enter any valid Information";
			} else {
				String fileName = null, fileExtension = null;
				InputStream in = null;
				if (file.getSize() > 9) {
					String fileNameArray[] = file.getSubmittedFileName().split("\\.");
					fileName = fileNameArray[0];
					fileExtension = fileNameArray[1];
					in = file.getInputStream();

				}
				String query = null;
				if (action.trim().equalsIgnoreCase("notice")) {
					query = "Insert into post_notice (NoticeType,message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("gallery")) {
					query = "Insert into post_gallery (galleryType,message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("examSchedule")) {
					query = "Insert into post_exam_schedule (examType,message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("popUp")) {
					query = "Insert into post_pop_up (popUpType,message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?,?)";
				}

				if (query != null) {

					PreparedStatement pstmt = con.prepareStatement(query);

					pstmt.setString(1, type);
					pstmt.setString(2, text);
					pstmt.setString(3, fileName);
					pstmt.setString(4, fileExtension);
					pstmt.setBlob(5, in);
					pstmt.setObject(6, new Date());

					int dbStatus = pstmt.executeUpdate();

					if (dbStatus > 0) {
						result = "Information updated Successfully";
					} else {
						result = "Something went wrong.Please try again";
					}
				} else {
					result = "Something went wrong.Please try again";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";
		} finally {
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = "Something went wrong.Please try again";
			}

		}

		return result;
	}

}
