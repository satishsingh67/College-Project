<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Mentor" %>
<%@page import="com.college.model.Student" %>

<%


Mentor mentor=(Mentor)session.getAttribute("mentor");
Student student=(Student)session.getAttribute("student");
if(mentor==null && student==null){
	response.sendRedirect("errorPage.jsp");
	return;
}

String departmentId=request.getParameter("departmentId");
String sectionId=request.getParameter("sectionId");
String semseter=request.getParameter("semseter");
String courseId=request.getParameter("courseId");
String studentId=request.getParameter("studentId");
String courseName=request.getParameter("courseName");



%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">
   
   
    <script src="./lib/jquery.min.js"></script>
    <script src="./lib/sweetalert.min.js"></script>
    
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
    th {
	position: sticky;
	top: 0px;
	height: 10px;
}
    .view-btn{
          width: 100px;
          height:40px;
          background-color: skyblue;
        }
   
        .heading {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

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

.loader2 {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid blue;
  border-bottom: 16px solid blue;
  width: 50px;
  height: 50px;
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


.modalViewQuestionPaper {
      display: none;
      /* Hidden by default */
      position: fixed;
      /* Stay in place */
      z-index: 1;
      /* Sit on top */
      padding-top: 70px;
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
    .modal-contentViewQuestionPaper {
      background-color: #fefefe;
      margin: auto;
      padding: 20px;
      margin-top:90px;
      border: 1px solid skyblue;
      width: 50%;
      height:65%;
    }
    


    </style>
    
    <title>Attendance</title>
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

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">
 <div class="content" style="margin-top:-110px;height:140px;">
<p style="color:black">Name:Satish Singh</p>
<p style="color:black; margin-top:-65px;">Course: <%=courseName %></p>
<p style="color:black; margin-top:-65px;" id="totalAttendance"></p>
 </div>

</section>
  <section style="height:200px;">
  <div style="margin-top:-95px;margin-left:-110px;width:120%;border:1px solid red;height:350px;overflow-y:auto;">
   <table id="customers">
      <thead >
       <th style="text-align:center;">Sl.No</th>
        <th style="text-align:center;">Subject Name</th>
        <th style="text-align:center;">Total Days</th>
         <th style="text-align:center;">Present Days</th>
        <th style="text-align:center;">Absent Days</th>
        <th style="text-align:center;">Percentage</th>
        <th style="text-align:center;">View Details</th>
      </thead>
     <tbody id="Table">
     
     
     </tbody>
    </table>
  </div>
   
  </section>
  
  
  <div class="loader2" style="margin-top:-14%;margin-left:45%;" id="myLoader"></div>
  
  <div id="myModal" class="modalLoader">

		<!-- Modal content -->
		<div class="modal-content-loader">
			<div class="loader1" style="display: none;">
				<div class="loader"
					style="margin: auto; margin-left: 40%; margin-top: 10%;"></div>

				<h4
					style="margin: auto; margin-left: 30%; margin-top: 0%; color: rgb(30, 169, 224); letter-spacing: 5px; padding: 10px; font-size: 20px;">
					Please wait....</h4>
			</div>
		</div>

	</div>
  
  
  <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Attendance Details</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
     
     <div style="border:1px solid skyblue;height:320px;overflow-y:auto;">
   <table id="customers">
      <thead >
       <th style="text-align:center;">Sl.No</th>
        <th style="text-align:center;">Subject Name</th>
        <th style="text-align:center;">Date</th>
        <th style="text-align:center;">Update Date</th>
         <th style="text-align:center;">Present</th>
        <th style="text-align:center;">Absent</th>
         
      </thead>
     <tbody id="Table1">
     
     
     </tbody>
    </table>
  </div>
     
     
     </div>
         <!-- Modal footer -->
      <div class="modal-footer" style="text-align:right;" >
        <button type="button" id="closeQuestionPaperModel" class="view-btn" style="background-color:red;margin-top:15px;">Close</button>
      </div>
         
  </div>

      
    </div>

<!-- View Question Paper Modal end -->      
            
  
  
  
  <script>
  
  var fkDepartment=<%= departmentId%>;
  var fkSectionId=<%= sectionId%>;
  var fkSemester=<%= semseter%>;
  var courseTypeId=<%=courseId%>;
  var studentId=<%=studentId%>;

  
  
  
  
  $(document).ready(function () {
	  
		fetchStudentAttendanceList();

  
});

  
	$('#closeQuestionPaperModel').click(function(event) {
		event.preventDefault();
		$('#myModalQuestionPaper').hide();

	});
	
	
	 function fetchStudentAttendanceList(){
		  
		  $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/attendance?action=subjectStudentAttendanceList&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&courseTypeId="+courseTypeId+"&studentId="+studentId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.total==null){
			     $("#Table").html('<tr class="no-records"><td colspan="7" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		    		 
		    		 $('#totalAttendance').text("Total Attandance Percentage: "+JsonData.total+"%");
		          $(JsonData.attendance).each(function (index, item) {  
		        	  $('#Table').append(
		        			  '<tr style="height:20px">'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.SlNo+'</td>'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.totalattendance+'</td>'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.presentCount+'</td>'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.absentCount+'</td>'+
		        			 '<td style="text-align: center;font-size: 15px;">'+item.percentageAttendance+'%</td>'+
		        		
		        		     '<td style="text-align: center;"><input type="submit" value="View" onclick=myFunction('+item.pkId+')  class="view-btn"  ></td>'+
		        		      '</tr>'
		        	  );
			      });
		    	 }
		    	 
		 		$('#myLoader').hide();

		      },
		      error: function (jqXHR, textStatus, errorThrown) {
			 		$('#myLoader').hide();

			  $("#Table").html('<tr class="no-records"><td colspan="7" style="text-align:center;text-color:black">Sorry, Something went wrong,Please try again.</td></tr>');
		      }
		    });
		  
	  }

	  function myFunction(id){
		 
		  fetchStudentSubjectAttendanceList(id);
		
	  }

	  function fetchStudentSubjectAttendanceList(id){
			 $('#myModal').show();
			  	//Calling Loader
			  	$(".loader1").show();

			 
			  $.ajax({
			      type: "GET",
			      url:"/College_Final_Year_Project/attendance?action=studentAttendanceList&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+id+"&courseTypeId="+courseTypeId+"&studentId="+studentId,
			      success: function (data, textStatus, jqXHR) {
			    	  var JsonData= jQuery.parseJSON(data);
			    	  $('#Table1').empty();
			    	 if(JsonData.length==0){
				     $("#Table1").html('<tr class="no-records"><td colspan="6" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
			    	 } 
			    	 else{
			          $(JsonData).each(function (index, item) {  
			        	  $('#Table1').append(
			        			  '<tr style="height:20px">'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.SlNo+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.updateDate+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+(item.present==null?"--":item.present)+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+(item.absent==null?"--":item.absent)+'</td>'+
			        		      '</tr>'
			        	  );
				      });
			    	 }
			    	 $('#myModal').hide();
				    	//Calling Loader
				    	$(".loader1").hide();
						$('#myModalQuestionPaper').show();

			      },
			      error: function (jqXHR, textStatus, errorThrown) {
				  $("#Table1").html('<tr class="no-records"><td colspan="6" style="text-align:center;text-color:black">Sorry, Something went wrong,Please try again.</td></tr>');
				  $('#myModal').hide();
			    	//Calling Loader
			    	$(".loader1").hide();

					$('#myModalQuestionPaper').show();

			      }
			    });
		  }
	
	
  </script>
</body>
</html>
