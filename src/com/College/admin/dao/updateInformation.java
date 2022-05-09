package com.college.admin.dao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class updateInformation {

	public String updateInformationMethod(String text, Part file, String action) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {

			if (text.trim().isEmpty() && file.getSize() <= 9) {
				result = "Please Enter any valid Information";
			}else if(action.trim().equalsIgnoreCase("gallery") && file.getSize() <= 9) {
				result = "Please choose any file for gallery";
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
					query = "Insert into post_notice (message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("gallery")) {
					query = "Insert into post_gallery (message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("examSchedule")) {
					query = "Insert into post_notice (message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?)";
				} else if (action.trim().equalsIgnoreCase("popUp")) {
					query = "Insert into post_pop_up (message,fileName,fileExtension,fileData,createDate)"
							+ " values(?,?,?,?,?)";
				}

				if (query != null) {

					PreparedStatement pstmt = con.prepareStatement(query);

					
					pstmt.setString(1, text);
					pstmt.setString(2, fileName);
					pstmt.setString(3, fileExtension);
					pstmt.setBlob(4, in);
					pstmt.setObject(5, new Date());

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

	
	public static String fetchNotices() {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "Select pkPostNoticesId,message,createDate,fileName from post_notice ORDER BY pkPostNoticesId desc";

			Statement pstmt = con.createStatement();

			ResultSet rs = pstmt.executeQuery(query);

			List<ViewVariables> noticeList = new ArrayList<ViewVariables>();

			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setCreateDate(rs.getTimestamp(3));
				viewVariablesObj.setLink(rs.getString(4));
				noticeList.add(viewVariablesObj);

			}

			Gson json = new Gson();
			result = json.toJson(noticeList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	

	public static String fetchPopUp() {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "Select pkPostPopUpId,message,createDate from post_pop_up ORDER BY pkPostPopUpId desc limit 2";

			Statement pstmt = con.createStatement();

			ResultSet rs = pstmt.executeQuery(query);

			List<ViewVariables> popUpList = new ArrayList<ViewVariables>();

			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setCreateDate(rs.getTimestamp(3));
				popUpList.add(viewVariablesObj);

			}

			Gson json = new Gson();
			result = json.toJson(popUpList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	
	public static void main(String[] args) {
		System.out.println(fetchPopUp());
	}


	public Map<String, Object> downloadNoticeFile(String id) {
		Map<String, Object> fileData = new HashMap<String, Object>();
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String FileName, FileExtension;
			String query = "Select fileName,fileExtension,fileData from post_notice where pkPostNoticesId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, Integer.parseInt(id));
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			FileName =rs.getString(1);
			FileExtension = rs.getString(2);
			Blob blob = rs.getBlob(3);
			InputStream inputStream = blob.getBinaryStream();
			fileData.put("status", true);
			fileData.put("fileName", FileName);
			fileData.put("fileExtension", FileExtension);
			fileData.put("fileData", inputStream);
			inputStream.close();
	} catch (Exception e) {
		e.printStackTrace();
		fileData.put("status", false);
	} finally {
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			fileData.put("status", false);
		}
	}
	return fileData;
	}
}
