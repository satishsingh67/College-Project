package com.college.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.dao.FetchDropDownsDao.FetchDropDownsDao;

/**
 * Servlet implementation class FetchDropDowns
 */
@WebServlet("/FetchDropDowns")
public class FetchDropDowns extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchDropDowns() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		String result = null;
		PrintWriter out = response.getWriter();

		try {
			if (!action.trim().isEmpty() && action.trim().equalsIgnoreCase("canvas")) {

				result = new FetchDropDownsDao().fetchCanvasDropDown();

				out.print(result);
			} else {

				out.print(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
