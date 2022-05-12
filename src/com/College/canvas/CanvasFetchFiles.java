package com.college.canvas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class CanvasFetchFiles {

	public String fetchCanvasGallery() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		Map<String, Object> filesMap = new HashMap<String, Object>();
		try {

			String query  = "Select fkFileType,name,filePath from canvas_files where fkPostTypeId=? and isApproved=? ORDER BY pkCanvasFilesId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			pstmt.setInt(2, 1);
			
			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> imageList = new ArrayList<ViewVariables>();
			List<ViewVariables> videoList = new ArrayList<ViewVariables>();

			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setFilePath(rs.getString(3).split("::")[1]);

				if (rs.getInt(1) == 1) {
					imageList.add(viewVariablesObj);
				} else if (rs.getInt(1) == 2) {
					videoList.add(viewVariablesObj);
				}
			}
			filesMap.put("imageList", imageList);
			filesMap.put("videoList", videoList);

			Gson json = new Gson();
			result = json.toJson(filesMap);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	
	public String fetchCanvasSocialService() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		Map<String, Object> filesMap = new HashMap<String, Object>();
		try {

			String query  = "Select fkFileType,name,filePath from canvas_files where fkPostTypeId=? and isApproved=? ORDER BY pkCanvasFilesId";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 7);
			pstmt.setInt(2, 1);
			
			ResultSet rs = pstmt.executeQuery();

			List<ViewVariables> imageList = new ArrayList<ViewVariables>();
			List<ViewVariables> videoList = new ArrayList<ViewVariables>();

			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setFilePath(rs.getString(3).split("::")[1]);

				if (rs.getInt(1) == 1) {
					imageList.add(viewVariablesObj);
				} else if (rs.getInt(1) == 2) {
					videoList.add(viewVariablesObj);
				}
			}
			filesMap.put("imageList", imageList);
			filesMap.put("videoList", videoList);

			Gson json = new Gson();
			result = json.toJson(filesMap);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	public  String fetchCanvasBeyondCurriculam() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		Map<String, Object> filesMap = new HashMap<String, Object>();
		try {

			String query  = "Select fkPostTypeId,name,filePath from canvas_files where fkPostTypeId in (4,5,6) and isApproved=1 ORDER BY pkCanvasFilesId";

			Statement pstmt = con.createStatement();
			
			ResultSet rs = pstmt.executeQuery(query);

			List<ViewVariables> artList = new ArrayList<ViewVariables>();
			List<ViewVariables> paintingList = new ArrayList<ViewVariables>();
			List<ViewVariables> posterList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setFilePath(rs.getString(3).split("::")[1]);

				if (rs.getInt(1) == 4) {
					artList.add(viewVariablesObj);
				} else if (rs.getInt(1) == 5) {
					paintingList.add(viewVariablesObj);
				}else if (rs.getInt(1) == 6) {
					posterList.add(viewVariablesObj);
				}
			}
			filesMap.put("artsList", artList);
			filesMap.put("paintingList", paintingList);
			filesMap.put("posterList", posterList);

			Gson json = new Gson();
			result = json.toJson(filesMap);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	
	public  String fetchCanvasWriteUp() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		Map<String, Object> filesMap = new HashMap<String, Object>();
		try {

			String query  = "Select fkPostTypeId,name,title,filePath from canvas_files where fkPostTypeId in (2,3) and isApproved=1 ORDER BY pkCanvasFilesId";

			Statement pstmt = con.createStatement();
			
			ResultSet rs = pstmt.executeQuery(query);

			List<ViewVariables> articlesList = new ArrayList<ViewVariables>();
			List<ViewVariables> blogsList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setName(rs.getString(2));
				viewVariablesObj.setFilePath(rs.getString(4).split("::")[1]);
				viewVariablesObj.setTitle(rs.getString(3).trim());
				if (rs.getInt(1) == 2) {
					articlesList.add(viewVariablesObj);
				} else if (rs.getInt(1) == 3) {
					blogsList.add(viewVariablesObj);
				}
			}
			filesMap.put("articlesList", articlesList);
			filesMap.put("blogsList", blogsList);

			Gson json = new Gson();
			result = json.toJson(filesMap);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	
	public  String fetchCanvasAllFiles() {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "SELECT cvFile.pkCanvasFilesId,cvFile.personType,cvFile.name,cvFile.personId,cvFile.title,cvFile.filePath,cvFile.isApproved,cvFile.createDate,cvFile.updateDate,dept.longName,postType.name,fileType.name FROM canvas_files AS cvFile "
					+ "INNER JOIN department AS dept ON cvFile.fkDepartmentId=dept.pkDepartmentId "
					+ "INNER JOIN post_type AS postType ON cvFile.fkPostTypeId=postType.pkPostTypeId "
					+ "INNER JOIN file_type AS fileType ON cvFile.fkFileType=fileType.pkFileTypeId ORDER BY pkCanvasFilesId DESC";

			Statement pstmt = con.createStatement();

			ResultSet rs = pstmt.executeQuery(query);

			List<ViewVariables> fileList = new ArrayList<ViewVariables>();
			int count = 0;
			while (rs.next()) {
				count++;
				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setSlNo(count);
				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setPersonType(rs.getString(2));
				viewVariablesObj.setName(rs.getString(3));
				viewVariablesObj.setCollegeId(rs.getString(4));
				viewVariablesObj.setTitle(rs.getString(5));
				viewVariablesObj.setFilePath(rs.getString(6).split("::")[1]);
				viewVariablesObj.setCreateDate(rs.getTimestamp(8));
				viewVariablesObj.setUpdateDate(rs.getTimestamp(9));
				viewVariablesObj.setDepartmentName(rs.getString(10));
				viewVariablesObj.setPostType(rs.getString(11));
				viewVariablesObj.setFileType(rs.getString(12));
				if (rs.getInt(7) == 0) {
					viewVariablesObj.setStatus("Pending");
				} else if (rs.getInt(7) == 1) {
					viewVariablesObj.setStatus("Approved");
				} else {
					viewVariablesObj.setStatus("Rejected");
				}
				fileList.add(viewVariablesObj);
			}

			Gson json = new Gson();
			result = json.toJson(fileList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}

	public  String changeStatus(String action, String id) {
		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {

			String query = "update canvas_files set isApproved=?,updateDate=? where pkCanvasFilesId=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			int updateValue = ((action.trim().equalsIgnoreCase("Approved")) ? 1 : 2);

			pstmt.setInt(1, updateValue);
			pstmt.setObject(2, new Date());
			pstmt.setInt(3, Integer.parseInt(id));

			int dbStatus = pstmt.executeUpdate();

			if (dbStatus > 0) {

				result = "Request " + action + " Successfully";

			} else {
				result = "Something went wrong.Please try again";

			}

		} catch (Exception e) {
			e.printStackTrace();
			result = "Something went wrong.Please try again";

		}

		return result;

	}
	
	public static String fetchGallery(String filter) {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		List<ViewVariables> galleryList = new ArrayList<ViewVariables>();
		try {

			String query=null;
			PreparedStatement pstmt=null;
			if(filter.trim().equalsIgnoreCase("all")) {
				  query  = "Select fileType,filePath from post_gallery pkPostGalleryId";
				  pstmt = con.prepareStatement(query);

			}else {
				  query  = "Select fileType,filePath from post_gallery pkPostGalleryId where fileType=?";
					pstmt = con.prepareStatement(query);
                      pstmt.setString(1, filter.trim());
			}

			
			ResultSet rs = pstmt.executeQuery();


			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setName(rs.getString(1));
				viewVariablesObj.setFilePath(rs.getString(2).split("::")[1]);

				galleryList.add(viewVariablesObj);
			}
			

			Gson json = new Gson();
			result = json.toJson(galleryList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}
	
	public static void main(String[] args) {
		//System.out.println(fetchGallery());
	}
}
