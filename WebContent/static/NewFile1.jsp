<%@page import="com.college.model.Student" %>
<%
Student student=(Student)session.getAttribute("student");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <img src="data:image/jpg;base64,<%= student.getBase64Image()%>"  width="240" height="300"/>
<%= student.getStudentName() %>
<%= student.getIdNumber() %>
</body>
</html>