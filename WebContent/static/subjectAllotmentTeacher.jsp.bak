<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Mentor" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.List"%>
<%@page import=" com.college.model.ViewVariables" %>
<%@page import=" com.college.mentor.dao.SubjectAllotmentDao" %>

<%

Mentor mentor=(Mentor)session.getAttribute("mentor");
if(mentor==null){
	response.sendRedirect("mentorLogin.jsp");
	return;
}

String departmentId=request.getParameter("departmentId");
String sectionId=request.getParameter("sectionId");
String courseType=request.getParameter("courseType");
String year=request.getParameter("year");

Map<String,Object> teacherList=new HashMap<String,Object>();
teacherList=new SubjectAllotmentDao().fetchTeachersList( departmentId);

Map<String,Object> subjectList=new HashMap<String,Object>();
subjectList=new SubjectAllotmentDao().fetchSubjectList(courseType, departmentId, year);



%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="./lib/jquery.min.js"></script>
    <script src="./lib/sweetalert.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css" type="text/css"/>


<style type="text/css">
    .custom-select {
        width: 150px !important;
    }
</style>
 
 
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
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }
    .view-btn{
          width: 90px;
          background-color: lightblue;
        }
    
    
     /* The Modal (background) */
    .modal {
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
    .modal-content {
      background-color: #fefefe;
      margin: auto;
      margin-top: 10%;
      padding: 20px;
      border: 1px solid #888;
      width: 35%;
      height: 35%;
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
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
    
       
    </style>
    
    <title>Teacher Subject Allotment </title>
</head>
<body>
   <form id="allotForm">
        <table id="customers">
          <thead >
           
            <th style="text-align: center;">Teacher Name</th>
            <th style="text-align: center;">Subject</th>
            <th style="text-align: center;">Course </th>
            <th style="text-align: center;">Department</th>
            <th style="text-align: center;">Semester</th>
            <th style="text-align: center;">Section</th>
            <th style="text-align: center;">Allot</th>
            
          </thead>
         
          <tr style="text-align: center;">
      <td >
  <select class="custom-select"  id="studentDropdown"  multiple="multiple">
   
   <%
	   List<ViewVariables> list=(List<ViewVariables>)teacherList.get("studentList");
	   if((boolean)teacherList.get("status")&& list.size()!=0 ){
   %>
    <option value="0">All</option>
   <%
   for(ViewVariables obj:list){
   %>
    <option value=<%=obj.getPkId() %>><%=obj.getName() %></option>
   <%
   }
   %>
   
   
   <%
   }else{
	  %>
	    <option value="0">Sorry,No Records Founds</option>
	   <%
   }
   
   %>
   
   
  </select>
</td>
      
      <td>
 <select class="custom-select"  id="subjectDropDown" multiple="multiple">
   
    <%
	   List<ViewVariables> list1=(List<ViewVariables>)subjectList.get("subjectList");
	   if((boolean)subjectList.get("status")&& list1.size()!=0 ){
   for(ViewVariables obj:list1){
   %>
    <option value=<%=obj.getPkId() %>><%=obj.getName() %></option>
   <%
   }
   %>
   
   
   <%
   }else{
	  %>
	    <option value="0">Sorry,No Records Founds</option>
	   <%
   }
   
   %>
   
   
   
  </select>
      </td>
    <td>
    <select class="text1" name="course"  id="1ddselect">
               <option>--Select--</option>
               <option value="1">B.Tech</option>
               <option value="2">M.Tech</option>
               <option value="3">BCA</option>
               <option value="4">MCA</option>
               <option value="5">Diploma</option>
               <option value="6">BHM</option>
    
           </select>
      </td>
      <td>
      <select class="text1" name="department"  id="ddselect">
                 <option>--Select--</option>
                 <option value="1">CSE</option>
                 <option value="2">ECE</option>
                 <option value="3">IT</option>
                 <option value="4">EE</option>
                 <option value="5">AEIE</option>
                 <option value="6">FT</option>
                 <option value="7">BHM</option>
                 <option value="8">ASHU</option>
                 <option value="9">BCA</option>
               
                 <option>Cyber scurity</option>
                 <option>Data Science</option>
             </select>
      </td>
      <td>
     <select class="text1" name="yearSemester"  id="1ddselect">
               <option>--Select--</option>
               <option value="1">1st Year,1st Semester</option>
               <option value="2">1st Year,2nd Semester</option>
               <option value="3">2nd Year,3rd Semester</option>
               <option value="4">2nd Year,4th Semester</option>
               <option value="5">3rd Year,5th Semester</option>
               <option value="6">3rd Year,6th Semester</option>
               <option value="7">4th Year,7th Semester</option>
               <option value="8">4th Year,8th Semester</option>
           </select>
      </td>
      <td>
     <select class="text1" name="section"  id="ddselect">
                           <option>--Select--</option>
                           <option value="1">Section-1</option>
                           <option value="2">Section-2</option>
                       </select>
      </td>
      <td><button class="view-btn" id="allotButton">Allot</button></td>
     
          </tr>
      
          
         
        </table>
       </form>
       
                  <!-- Loader Modal Start -->
   <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="loader1" style="display:none;">
        <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;">
        </div>

        <h4
          style="font-size:22px;margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
 <!-- Loader Modal end -->
       
       
       
 <script type="text/javascript">
  $('#studentDropdown').multiselect({
  templates: {
    li: '<li><a href="javascript:void(0);"><label class="pl-2"></label></a></li>'
  }
});

$(document).on('change', '.multiselect-container :checkbox:first', function() {
  $('#studentDropdown').multiselect(this.checked ? 'selectAll' : 'deselectAll').multiselect('refresh');
});
$('#subjectDropDown').multiselect({
	  templates: {
	    li: '<li><a href="javascript:void(0);"><label class="pl-2"></label></a></li>'
	  }
	});

 </script>
       
  <script>
  
  
  var departmentId=<%=departmentId%>;
  var sectionId=<%=sectionId%>;
  var courseType=<%=courseType%>;
  var year=<%=year%>;

  $('#allotButton').click(function (event){
		event.preventDefault();
         $('#myModal').show();
         $(".loader1").show();
		 
  	  $('#allotButton').prop("disabled", true);  

		var studentsName=$('#studentDropdown').val();
		var subjects=$('#subjectDropDown').val();
		
		
		   var form = $('#allotForm')[0];
		 	  var form_data = new FormData(form); 
		 	 form_data.append("studentsName",studentsName);
		 	form_data.append("subjects",subjects);
		 	form_data.append("action","teachers");
		 $.ajax({
			  type: "POST",
              enctype: 'multipart/form-data',
		      url:"/College_Final_Year_Project/subjectAllotement",
		      data: form_data,
              processData: false,
              contentType: false,
		      success: function (data, textStatus, jqXHR) {
		    	  $(".loader1").hide();
                  $('#myModal').hide();
            	  if(data.trim().includes("Successfully")){
            	   swal("Done", data, "success");
            	  
            	  }else{
            		  swal("Error",data,"error");
            	  }
            	  $('#allotForm')[0].reset();
            	
            	  $('#allotButton').prop("disabled", false);  

	        	  
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	          alert("Sorry Something went wrong while loading.");
	          $(".loader1").hide();
              $('#myModal').hide();
        	  $('#allotForm')[0].reset();
        	  $('#allotButton').prop("disabled", false);  

		      }
		    });
		
	});
  
  
  </script>     
       
       
       
</body>
</html>