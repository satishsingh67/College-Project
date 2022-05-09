package com.college.dao.FetchDropDownsDao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class FetchDropDownsDao {

	public String fetchCanvasDropDown() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		Map<String, Object> dropDownsMap = new HashMap<String, Object>();
		try {

			String query = null;
			Statement stmt = null;
			ResultSet rs = null;
			// Fetching Post Type
			query = "Select pkPostTypeId,name from post_type ORDER BY pkPostTypeId";

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			List<ViewVariables> dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				dropDownList.add(viewVariablesObj);
			}
			dropDownsMap.put("postType", dropDownList);

			// Fetching Department Type

			query = "Select pkDepartmentId,shortName from department ORDER BY pkDepartmentId";

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				dropDownList.add(viewVariablesObj);
			}
			dropDownsMap.put("department", dropDownList);

			// Fetching File Type

			query = "Select pkFileTypeId,name from file_type ORDER BY pkFileTypeId";

			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				dropDownList.add(viewVariablesObj);
			}
			dropDownsMap.put("fileType", dropDownList);

			Gson json = new Gson();
			result = json.toJson(dropDownsMap);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;

	}

	public static String fetchDepartmentDropDown() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {
		String	query = "Select pkDepartmentId,shortName from department ORDER BY pkDepartmentId";

		Statement stmt = con.createStatement();
		ResultSet	rs = stmt.executeQuery(query);

		List<ViewVariables>	dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				dropDownList.add(viewVariablesObj);
			}
	
			Gson json = new Gson();
			result = json.toJson(dropDownList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}
	public static String fetchCourseTypeDropDown() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {
		String	query = "Select pkCourseTypeId,shortName from course_type ORDER BY pkCourseTypeId";

		Statement stmt = con.createStatement();
		ResultSet	rs = stmt.executeQuery(query);

		List<ViewVariables>	dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getString(2));

				dropDownList.add(viewVariablesObj);
			}
	
			Gson json = new Gson();
			result = json.toJson(dropDownList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}
	public static String fetchSemesterDropDown() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {
		String	query = "Select pkYearSemesterId,Semester from year_semester ORDER BY pkYearSemesterId";

		Statement stmt = con.createStatement();
		ResultSet	rs = stmt.executeQuery(query);

		List<ViewVariables>	dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName(rs.getInt(2)==1?"1st Semester":rs.getInt(2)==2?"2nd Semester":rs.getInt(2)==3?"3rd Semester":rs.getInt(2)+"th Semester");

				dropDownList.add(viewVariablesObj);
			}
	
			Gson json = new Gson();
			result = json.toJson(dropDownList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}
	
	
	public static String  fetchSectionDropDown() {

		Connection con = new DataBaseConnection().getDatabaseConnection();

		String result = null;
		try {
		String	query = "Select pkSectionId,section from section ORDER BY pkSectionId";

		Statement stmt = con.createStatement();
		ResultSet	rs = stmt.executeQuery(query);

		List<ViewVariables>	dropDownList = new ArrayList<ViewVariables>();
			while (rs.next()) {

				ViewVariables viewVariablesObj = new ViewVariables();

				viewVariablesObj.setPkId(rs.getInt(1));
				viewVariablesObj.setName("Section-"+rs.getInt(2));

				dropDownList.add(viewVariablesObj);
			}
	
			Gson json = new Gson();
			result = json.toJson(dropDownList);

		} catch (Exception e) {
			e.printStackTrace();

		}

		return result;
	}

	public static void main(String[] args) {
		System.out.println(fetchDepartmentDropDown());
		System.out.println(fetchCourseTypeDropDown());
		System.out.println(fetchSemesterDropDown());
		System.out.println(fetchSectionDropDown());
	}

}
