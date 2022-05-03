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

	public static void main(String[] args) {
		System.out.println(new FetchDropDownsDao().fetchCanvasDropDown());
	}

}
