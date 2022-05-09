package com.college.canvas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.Part;

import com.college.dataBaseConnection.DataBaseConnection;

public class CanvasFormSubmit {

	public String submitCanvasForm(String personType, String name, String department, String id, String postType,
			String title, String fileType, Part file) {
		// TODO Auto-generated method stub

		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			// Creating a timestamp for file naming
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd_HHmmss");
			Date date = new Date();

			String baseFilePathForStoring = "C:\\Users\\SATISH\\Desktop\\College-Final-Year-Project\\College_Final_Year_Project\\WebContent\\static\\canvasFiles\\";

			String baseFilePathForDisplaying = "./canvasFiles/";

			String timeStamp = (String) formatter.format(date);

			StringBuffer fileNameForStoring = new StringBuffer();
			StringBuffer fileNameForDisplaying = new StringBuffer();
			String fileNameArr[] = file.getSubmittedFileName().split("\\.");

			fileNameForStoring.append(baseFilePathForStoring);

			fileNameForStoring.append(fileNameArr[0]).append("_").append(timeStamp).append(".").append(fileNameArr[1]);

			fileNameForDisplaying.append(baseFilePathForDisplaying);

			fileNameForDisplaying.append(fileNameArr[0]).append("_").append(timeStamp).append(".")
					.append(fileNameArr[1]);

			file.write(fileNameForStoring.toString());
			PreparedStatement pstmt = null;
			String query = null;
			if (title.trim().isEmpty()) {

				query = "Insert into canvas_files (fkPostTypeId,fkDepartmentId,fkFileType,personType,name,personId,filePath,isApproved,createDate,updateDate)"
						+ " values(?,?,?,?,?,?,?,?,?,?)";

				String combinedFilePath = fileNameForStoring.toString() + "::" + fileNameForDisplaying.toString();

				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, Integer.parseInt(postType));
				pstmt.setInt(2, Integer.parseInt(department));
				pstmt.setInt(3, Integer.parseInt(fileType));
				pstmt.setString(4, personType);
				pstmt.setString(5, name);
				pstmt.setString(6, id);
				pstmt.setString(7, combinedFilePath);
				pstmt.setInt(8, 1);
				pstmt.setObject(9, new Date());
				pstmt.setObject(10, new Date());
			} else if (!title.trim().isEmpty()) {
				query = "Insert into canvas_files (fkPostTypeId,fkDepartmentId,fkFileType,personType,name,personId,filePath,title,isApproved,createDate,updateDate)"
						+ " values(?,?,?,?,?,?,?,?,?,?,?)";

				String combinedFilePath = fileNameForStoring.toString() + "::" + fileNameForDisplaying.toString();

				pstmt = con.prepareStatement(query);

				pstmt.setInt(1, Integer.parseInt(postType));
				pstmt.setInt(2, Integer.parseInt(department));
				pstmt.setInt(3, Integer.parseInt(fileType));
				pstmt.setString(4, personType);
				pstmt.setString(5, name);
				pstmt.setString(6, id);
				pstmt.setString(7, combinedFilePath);
				pstmt.setString(8, title.trim());
				pstmt.setInt(9, 1);
				pstmt.setObject(10, new Date());
				pstmt.setObject(11, new Date());

			}

			if (query != null) {

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
					result = "Form Submitted Successfully";
				} else {
					result = "Something went wrong.Please Try again";
				}
			} else {
				result = "Something went wrong.Please Try again";
			}

		} catch (Exception e) {

			e.printStackTrace();
			result = "Something went wrong.Please Try again";

		}

		return result;
	}

	public static void main(String[] args) {

		System.out.println("");

	}
}
