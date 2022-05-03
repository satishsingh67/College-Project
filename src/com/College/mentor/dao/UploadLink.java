package com.college.mentor.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.college.dataBaseConnection.DataBaseConnection;
import com.college.model.ViewVariables;
import com.google.gson.Gson;

public class UploadLink {

	public String uploadLink(String courseTypeId, String departmentId, String semseter, String section, String linkType,
			String link) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();
		try {
			String query = null;
			if (linkType.trim().equalsIgnoreCase("Subject choice")) {

				query = "INSERT INTO `mentor_subject_choice_link` (`fkCourseTypeId`, `fkDepartmentId`, `fkYearId`, `fkSectionId`,`link`, `createDate`, `updatedate`)"
						+ " VALUES (?,?,?,?,?,?,?)";
			} else if (linkType.trim().equalsIgnoreCase("Feedback")) {

				query = "INSERT INTO `mentor_feedback_link` (`fkCourseTypeId`, `fkDepartmentId`, `fkYearId`, `fkSectionId`,`link`, `createDate`, `updatedate`)"
						+ " VALUES (?,?,?,?,?,?,?)";
			}

			if (query != null) {

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(courseTypeId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));
				pstmt.setString(5, link.trim());
				pstmt.setObject(6, new Date());
				pstmt.setObject(7, new Date());

				int dbStatus = pstmt.executeUpdate();

				if (dbStatus > 0) {
					result = linkType + " Link Uploaded Successfully";

				} else {
					result = "Something went wrong.Please try again";
				}
			} else {
				result = "Something went wrong.Please try again";

			}
		} catch (Exception e) {
			result = "Something went wrong.Please try again";
			e.printStackTrace();

		}

		return result;
	}

	public String getLink(String courseTypeId, String departmentId, String semseter, String section, String linkType) {
		String result = null;
		Connection con = new DataBaseConnection().getDatabaseConnection();

		try {
			String query = null;
			if (linkType.trim().equalsIgnoreCase("Subject choice")) {

				query = "Select link,createDate from mentor_subject_choice_link where `fkCourseTypeId`=? and `fkDepartmentId`=? and `fkYearId`=? and `fkSectionId`=? ORDER BY pkMentorSubjectChoiceLinkId";

			} else if (linkType.trim().equalsIgnoreCase("Feedback")) {

				query = "Select link,createDate from mentor_feedback_link where `fkCourseTypeId`=? and `fkDepartmentId`=? and `fkYearId`=? and `fkSectionId`=? ORDER BY pkMentorFeedbackLinkId";
			}

			if (query != null) {

				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(courseTypeId));
				pstmt.setInt(2, Integer.parseInt(departmentId));
				pstmt.setInt(3, Integer.parseInt(semseter));
				pstmt.setInt(4, Integer.parseInt(section));

				ResultSet rs = pstmt.executeQuery();

				List<ViewVariables> linkList = new ArrayList<ViewVariables>();
				int count=0;
				while (rs.next()) {
					count++;
					ViewVariables viewVariablesObj = new ViewVariables();
					viewVariablesObj.setSlNo(count);
					viewVariablesObj.setLink(rs.getString(1));
					viewVariablesObj.setCreateDate(rs.getTimestamp(2));

					linkList.add(viewVariablesObj);
				}

				Gson json = new Gson();
				result = json.toJson(linkList);

			} else {
				result = "Something went wrong.Please try again";

			}
		} catch (Exception e) {
			result = "Something went wrong.Please try again";
			e.printStackTrace();

		}

		return result;
	}

}
