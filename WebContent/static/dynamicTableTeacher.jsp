<%@page import="com.college.model.TeacherDetails" %>

<%
TeacherDetails teacher=(TeacherDetails)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect("teacherLogin.jsp");
	return;
}
Integer fkTeacherPkId=teacher.getPkTeacherId();
Integer fkDepartment=teacher.getFkdepartment();
String subjectId=request.getParameter("subject");
String section=request.getParameter("section");
String year=request.getParameter("year");
String semester=request.getParameter("semesterId");
String examName=request.getParameter("examType");
String examTypeId=request.getParameter("examTypeCode");
String action=request.getParameter("action");
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
 
<title>GNIT</title>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 5px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
th{
 position: sticky;
     top: 0px;
     height:10px;
}
td{
height:1px;
}

.loader {
      border: 3px solid #f3f3f3;
      border-radius: 50%;
      border-top: 3px solid #3498db;
      width: 60px;
      height: 60px;
      -webkit-animation: spin 1s linear infinite;
      animation: spin 1s linear infinite;
    }


    @-webkit-keyframes spin {
      0% {
        -webkit-transform: rotate(0deg);
      }

      100% {
        -webkit-transform: rotate(360deg);
      }
    }

    @keyframes spin {
      0% {
        transform: rotate(0deg);
      }

      100% {
        transform: rotate(360deg);
      }
    }

    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    /* The Modal (background) */
    .modalLoader {
      display: none;
      /* Hidden by default */
      position: fixed;
      /* Stay in place */
      z-index: 1;
      /* Sit on top */
      padding-top: 100px;
      /* Location of the box */
      left: 0;
      top: 0;
      width: 100%;
      /* Full width */
      height: 100%;
      /* Full height */
      overflow: auto;
      /* Enable scroll if needed */
      background-color: rgb(0, 0, 0);
      /* Fallback color */
      background-color: rgba(0, 0, 0, 0.4);
      /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content-loader {
      background-color: #fefefe;
      margin: auto;
      margin-top: 10%;
      padding: 20px;
      border: 1px solid #888;
      width: 35%;
      height: 30%;
    }
</style>
</head>
<body>

<%
if(!action.isEmpty() && action.trim().equalsIgnoreCase("exam")){
%>
     <H3 style="text-align:center"><%=examName+" Student's Answer Scripts" %> </H3>
       <div style="border:1px solid red;  height:600px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Question Paper Name</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Semester</th>
              <th style="text-align:center;">Department</th>
              <th style="text-align:center;">Section</th>
              <th style="text-align:center;">Submitted File Name</th>
              <th style="text-align:center;">Date of Submission</th>
              <th style="text-align:center;">View</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
        
          </tbody>
           </table>
           </div>
           <%
}else if(!action.isEmpty() && action.trim().equalsIgnoreCase("WeeklyLab")){
           %>
 <H3 style="text-align:center"><%="Student's "+examName %> </H3>
       <div style="border:1px solid red;  height:600px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Semester</th>
              <th style="text-align:center;">Department</th>
              <th style="text-align:center;">Section</th>
              <th style="text-align:center;">Submitted File Name</th>
              <th style="text-align:center;">Date of Submission</th>
              <th style="text-align:center;">View</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
        
          </tbody>
           </table>
           </div>
 <%
}else if(!action.isEmpty() && action.trim().equalsIgnoreCase("WeeklyLabOutput")){
 %>
 <H3 style="text-align:center"><%="Student's "+examName %> </H3>
       <div style="border:1px solid red;  height:600px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Semester</th>
              <th style="text-align:center;">Department</th>
              <th style="text-align:center;">Section</th>
              <th style="text-align:center;">Submitted File Name</th>
              <th style="text-align:center;">Date of Submission</th>
              <th style="text-align:center;">View</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
        
          </tbody>
           </table>
           </div>
 <%
}else if(!action.isEmpty() && action.trim().equalsIgnoreCase("FInalLabCopy")){
 %>
 <H3 style="text-align:center"><%="Student's "+examName %> </H3>
       <div style="border:1px solid red;  height:600px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Semester</th>
              <th style="text-align:center;">Department</th>
              <th style="text-align:center;">Section</th>
              <th style="text-align:center;">Submitted File Name</th>
              <th style="text-align:center;">Date of Submission</th>
              <th style="text-align:center;">View</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
        
          </tbody>
           </table>
           </div>
 
 <%
}else if(!action.isEmpty() && action.trim().equalsIgnoreCase("assignmentCheck")){
 %>
 <H3 style="text-align:center"><%="Student's "+examName %> </H3>
       <div style="border:1px solid red;  height:600px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="text-align:center;">Sl.No</th>
               <th style="text-align:center;">Assignment Name</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Semester</th>
              <th style="text-align:center;">Department</th>
              <th style="text-align:center;">Section</th>
              <th style="text-align:center;">Status</th>
              <th style="text-align:center;">Submitted File Name</th>
                <th style="text-align:center;">Due Date</th>
              <th style="text-align:center;">Date of Submission</th>
              <th style="text-align:center;">View</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
        
          </tbody>
           </table>
           </div>
 <%
}
 %>
 
     
  <div id="myModal" class="modalLoader">

    <!-- Modal content -->
    <div class="modal-content-loader">
      <div class="loader1" style="display:none;">
        <div class="loader" style="margin: auto;margin-left:40%;margin-top:10%;">
        </div>

        <h4
          style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;font-size:20px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
    <script>
    var fkTeacherPkId=<%= fkTeacherPkId%>;
    var fkDepartment=<%= fkDepartment%>;
    var fksubjectId=<%= subjectId%>;
    var fkTeacherPkId=<%= fkTeacherPkId%>;
    var fkSectionId=<%= section%>;
    var fkYear=<%= year%>;
    var fkSemester=<%= semester%>;
    var examTypeId=<%=examTypeId%>
    var action="<%=action%>"
    $(document).ready(function () {
    	console.log("Page loaded");
    	
    	 $('#myModal').show();
         $(".loader1").show();
         
     if(action.trim().length !=0 && action.trim()=="exam"){
    	 
    	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/fetchDetails?action=viewExamAnswerScript&teacherId="+fkTeacherPkId+"&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&examTypeId="+examTypeId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.length==0){
			     $("#Table").html('<tr class="no-records"><td colspan="10" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        
		        	 $('#Table').append(
		        			  '<tr style="height:20px">'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.questionPaperName+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		      '<td style="text-align: center;">'+item.semster+'</td>'+
		        		      '<td style="text-align: center;">'+item.departmentName+'</td>'+
		        		      '<td style="text-align: center;">'+item.section+'</td>'+
		        		      '<td style="text-align: center;">'+item.submittedFileName+'</td>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/submit?action=answerScriptDownload&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+ 
		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		    	 $('#myModal').hide();
		         $(".loader1").hide();
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading Data.");
	           $('#myModal').hide();
		         $(".loader1").hide();
		      }
		      
		    });
    	 
    	 
     }      
         
     else if(action.trim().length !=0 && action.trim()=="WeeklyLab"){
    	 
    	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/fetchDetails?action=viewLab&query=weeklyLabFile&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.length==0){
			     $("#Table").html('<tr class="no-records"><td colspan="9" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        
		        	 $('#Table').append(
		        			  '<tr style="height:20px">'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		      '<td style="text-align: center;">'+item.semster+'</td>'+
		        		      '<td style="text-align: center;">'+item.departmentName+'</td>'+
		        		      '<td style="text-align: center;">'+item.section+'</td>'+
		        		      '<td style="text-align: center;">'+item.submittedFileName+'</td>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/lab?action=Download&action1=viewWeeklyLabCopy&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+ 
		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		    	 $('#myModal').hide();
		         $(".loader1").hide();
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading Data.");
	           $('#myModal').hide();
		         $(".loader1").hide();
		      }
		      
		    });
    	 
    	 
     }      
     else if(action.trim().length !=0 && action.trim()=="WeeklyLabOutput"){
    	 
    	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/fetchDetails?action=viewLab&query=viewweeklylaboutput&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.length==0){
			     $("#Table").html('<tr class="no-records"><td colspan="9" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        
		        	 $('#Table').append(
		        			  '<tr style="height:20px">'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		      '<td style="text-align: center;">'+item.semster+'</td>'+
		        		      '<td style="text-align: center;">'+item.departmentName+'</td>'+
		        		      '<td style="text-align: center;">'+item.section+'</td>'+
		        		      '<td style="text-align: center;">'+item.submittedFileName+'</td>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/lab?action=Download&action1=viewWeeklyLabOutput&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+ 
		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		    	 $('#myModal').hide();
		         $(".loader1").hide();
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading Data.");
	           $('#myModal').hide();
		         $(".loader1").hide();
		      }
		      
		    });
     }    
 else if(action.trim().length !=0 && action.trim()=="FInalLabCopy"){
    	 
    	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/fetchDetails?action=viewLab&query=finalLabCopy&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.length==0){
			     $("#Table").html('<tr class="no-records"><td colspan="9" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        
		        	 $('#Table').append(
		        			  '<tr style="height:20px">'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		      '<td style="text-align: center;">'+item.semster+'</td>'+
		        		      '<td style="text-align: center;">'+item.departmentName+'</td>'+
		        		      '<td style="text-align: center;">'+item.section+'</td>'+
		        		      '<td style="text-align: center;">'+item.submittedFileName+'</td>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/lab?action=Download&action1=downloadFinalLabCopy&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+ 
		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		    	 $('#myModal').hide();
		         $(".loader1").hide();
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading Data.");
	           $('#myModal').hide();
		         $(".loader1").hide();
		      }
		      
		    });
     }
     
    else if(action.trim().length !=0 && action.trim()=="assignmentCheck"){
	 
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/fetchDetails?action=viewAssignment&teacherId="+fkTeacherPkId+"&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&examTypeId="+examTypeId,
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	    	  $('#Table').empty();
	    	 if(JsonData.length==0){
		     $("#Table").html('<tr class="no-records"><td colspan="14" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
	    	 }
	    	 else{
	          $(JsonData).each(function (index, item) {  
	        
	        	 $('#Table').append(
	        			  '<tr style="height:20px">'+
	        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
	        			  '<td style="text-align: center;">'+item.questionPaperName+'</td>'+
	        			  '<td style="text-align: center;">'+item.name+'</td>'+
	        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
	        		      '<td style="text-align: center;">'+item.semster+'</td>'+
	        		      '<td style="text-align: center;">'+item.departmentName+'</td>'+
	        		      '<td style="text-align: center;">'+item.section+'</td>'+
	        		      '<td style="text-align: center;">'+item.status+'</td>'+
	        		      '<td style="text-align: center;">'+(item.submittedFileName==null?" ":item.submittedFileName)+'</td>'+
	        			  '<td style="text-align: center;">'+(item.dueDate==null?" ":item.dueDate)+'</td>'+  		      
	        			  '<td style="text-align: center;">'+(item.updateDate==null?" ":item.updateDate)+'</td>'+
	        			  (item.status=="Submitted"?'</td><td style="text-align:center;">'+
	                              '<a href="/College_Final_Year_Project/viewAndDownload?pkAssignmentStatusId='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a>'+
	                              '</td></tr>':'</td><td style="text-align:center;">'+
	                              '<input type="button" value="view" disabled="true" style="opacity: 1;background-color: #00a2ed; border-color: #00a2ed;" class="btn btn-primary btn-sm">'+
	                              '</td></tr>')+
	        		      '</tr>'
	        	  );
	        	  
	        	  
		      });
	    	 }
	    	 $('#myModal').hide();
	         $(".loader1").hide();
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
           alert("Sorry Something went wrong while loading Data.");
           $('#myModal').hide();
	         $(".loader1").hide();
	      }
	      
	    });
	 
	 
 }  
     
     
      });
    
    </script>
       
</body>
</html>