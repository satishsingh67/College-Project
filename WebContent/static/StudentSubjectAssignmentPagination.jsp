<%@page import="com.college.dao.studentDao.MapStudentSubjectDao" %>
<%
String req=request.getParameter("requestType");
String studentId=request.getParameter("studentId");
String departmentId=request.getParameter("departmentId");
String sectionId=request.getParameter("sectionId");
String semesterId=request.getParameter("semesterId");
String subjectId=request.getParameter("subjectId");
String start=request.getParameter("start");
String limit=request.getParameter("limit");
String data="";
MapStudentSubjectDao mapSubject=new MapStudentSubjectDao();

if(req.equals("countRecords")){
    data=mapSubject.getAllAssigmentCount(Integer.parseInt(studentId),Integer.parseInt(departmentId),Integer.parseInt(sectionId),Integer.parseInt(semesterId),Integer.parseInt(subjectId));
}
if(req.equalsIgnoreCase("getRecords")){
	data=mapSubject.getAllAssigment(Integer.parseInt(studentId),Integer.parseInt(departmentId),Integer.parseInt(sectionId),Integer.parseInt(semesterId),Integer.parseInt(subjectId),Integer.parseInt(start),Integer.parseInt(limit));
}

out.print(data);
%>
