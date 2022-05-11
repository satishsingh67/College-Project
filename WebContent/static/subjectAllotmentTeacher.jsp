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
    
    
    .heading span {
  color: #2597f4;
}

.btn {
  display: inline-block;
  margin-top: 1rem;
  padding: 1rem 3rem;
  cursor: pointer;
  background: #fff;
  font-size: 1.7rem;
  text-transform: capitalize;
  color: #334;
  border: 0.2rem solid #334;
}

.btn:hover {
  background: #2597f4;
  border-color: #2597f4;
  color: #fff;
}

.header .contact-info {
  padding: 2rem 10%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background: #39b32e;
}

.header .contact-info p {
  font-size: 1.5rem;
  color: #fff;
}

.header .contact-info p i {
  padding-right: 0.5rem;
  color: yellow;
}

.header .navbar {
  padding: 2rem 10%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background: rgb(25, 122, 167);
  border-bottom: 0.2rem solid #334;
  position: relative;
  z-index: 1000;
}

.header .navbar.active {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  border-bottom: none;
  -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
}

.header .navbar .logo {
  width: 130px;
  height: 60px;
}

.header .navbar .logo i {
  color: #2597f4;
}

.header .navbar .links a {
  margin-left: 2rem;
  font-size: 2rem;
  text-transform: capitalize;
  color: rgb(254, 254, 255);
}

.header .navbar .links a:hover {
  text-decoration: underline;
  color: #eefa41;
}

.header #menu-btn {
  font-size: 3rem;
  cursor: pointer;
  color: #334;
  display: none;
}

.home {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  gap: 3rem;
}

.home .image {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .image img {
  width: 50%;
}

.home .content {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .content h3 {
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.home .content p {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding: 1rem 0;
}
section {
  padding: 5rem 10%;
}
    
    
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


<header class="header">
    <nav class="navbar">
 
       <img src="./images/GNIT_Kolkata_logo.png" class="logo">  
        <p style="color:white;font-size:22px;margin-left:40px;">GURU NANAK INSTITUTE OF TECHNOLOGY</p>
       
       <img src="./images/teachers/1200px-JIS_University.svg.png" class="logo">  
       <div id="menu-btn" class="fa fa-bars"></div>
 
    </nav>
 
 </header>

   <form id="allotForm">
        <table id="customers">
          <thead >
           
            <th style="text-align: center;">Teacher Name</th>
            <th style="text-align: center;">Subject</th>
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

		var teacherName=$('#studentDropdown').val();
		var subjects=$('#subjectDropDown').val();
		
		
		   
		 	  var form_data = new FormData(); 
		 	 form_data.append("teacherName",teacherName);
		 	form_data.append("subjects",subjects);
		 	form_data.append("action","teachers");
		 	form_data.append("department",departmentId);
		 	form_data.append("section",sectionId);
		 	form_data.append("course",courseType);
		 	form_data.append("yearSemester",year);
		 	
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