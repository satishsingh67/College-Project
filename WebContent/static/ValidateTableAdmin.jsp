<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Admin" %>

<%
Admin admin=(Admin)session.getAttribute("admin");
if(admin==null){
	response.sendRedirect("adminLogin.jsp");
	return;
}
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

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

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 5px;
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

td {
	height: 1px;
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
      border: 1px solid skyblue;
      width: 70%;
      height:95%;
    }
    
</style>
</head>
<body>


	<H3 style="text-align: center">New Student's Registration</H3>
	<div style="border: 1px solid red; height: 600px; overflow-y: auto;">
		<table id="customers">
			<tr>
			<thead>
				<tr>
				    <th style="text-align: center;">SL No</th>
					<th style="text-align: center;">Student Name</th>
					<th style="text-align: center;">College Id</th>
					<th style="text-align: center;">Gender</th>
					<th style="text-align: center;">Email</th>
					<th style="text-align: center;">Mobile No</th>
					<th style="text-align: center;">Course </th>
					<th style="text-align: center;">Department </th>
					<th style="text-align: center;">Semester</th>
					<th style="text-align: center;">Section</th>
					<th style="text-align: center;">Create Date</th>
					<th style="text-align: center;">Update Date</th>
					<th style="text-align: center;">Status</th>
					<th style="text-align: center;">Action</th>

				</tr>
			</thead>
			<tbody id='Table'>

			</tbody>
		</table>
	</div>

  <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Details</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
        <div style="margin-left:70%;width:20%;height:90%;">
        
       <img class="logo" id="StudentImage" src="" style="width:70%; height:90%"> 
        
        </div>
        
        <div style="width:65%;margin-top:-150px;">
        
                <label><p "font-size:15px; text-transform: none;" id="studentName" ></p></label>
       
        <br>
        
       <label><p style="font-size:15px; text-transform: none;" id="gender" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="collegeId" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;"  id="mobileNumber" ></p></label>
        <br>
        <label><p style="font-size:15px; text-transform: none;"  id="emaiLId" ></p></label>
        <br>
       <label><p style="font-size:15px; text-transform: none;"  id="Course" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;"  id="department" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="semester" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="section" ></p></label>
       
       <br>
       <label><p style="font-size:15px; text-transform: none;"  >Money Recipt:</p></label>
            <a  id="viewReciept" target="_self" class="btn btn-primary" >View</a>
      
        </div>
        <br>
        
      <input type="submit" id="approveStudent"  value="Approve" class="btn btn-primary" >
      <input type="submit" id="rejectStudent"  value="Reject" class="btn btn-primary" >
     
     </div>
         <!-- Modal footer -->
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel" class="btn btn-danger" style="background-color:red;">Close</button>
      </div>
         
  </div>

      
    </div>

<!-- View Question Paper Modal end -->      
            

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
	<script>
	var id;
	 $(document).ready(function () {
		 $(".loader1").show();
         $('#myModal').show();
		 
		 fetchStudentRegistraion();
		 
	 });
	 

	 function myFunction(){
			  $('#Table td').on('click', function () {
  	        	 
  	        	 $('#myModalQuestionPaper').show();

  	        	
  	             var row = $(this).closest('tr');
  	           
  	         
		        id = $(row).find('td').eq(0).html();
				var name = $(row).find('td').eq(2).html();
				var collegeId = $(row).find('td').eq(3).html();
				var gender = $(row).find('td').eq(4).html();
				var emailId = $(row).find('td').eq(5).html();
				var mobileNo = $(row).find('td').eq(6).html();
				var course = $(row).find('td').eq(7).html();
				var department = $(row).find('td').eq(8).html();
				var semester = $(row).find('td').eq(9).html();
				var section = $(row).find('td').eq(10).html();
				var image=$(row).find('td').eq(14).html();
				var status = $(row).find('td').eq(13).html();
				
				
				$('#studentName').text("Student Name: "+name);
				$('#collegeId').text("College Id: "+collegeId);
				$('#mobileNumber').text("Mobile Number: "+mobileNo);
				$('#emaiLId').text("Email Id: "+emailId);
				$('#Course').text("Course: "+course);
				$('#department').text("Department: "+department);
				$('#semester').text("Semester: "+semester);
				$('#section').text("Section: "+section);
				$('#gender').text("Gender: "+gender);
				$('#StudentImage').attr('src', 'data:image/png;base64,'+image);
				$('#viewReciept').attr('href',"/College_Final_Year_Project/view?action=studentRecieptDownload&id="+id);

				if(status.trim()=="Approved"){
				    $("#approveStudent").prop("disabled", true);
					   $("#rejectStudent").prop("disabled", false);
				}else if(status.trim()=="Rejected"){
					 $("#rejectStudent").prop("disabled", true);
					 $("#approveStudent").prop("disabled", false);
				}else{
					  $("#approveStudent").prop("disabled", false);
					   $("#rejectStudent").prop("disabled", false);

				}
				
				
			});
		}

		$('#closeQuestionPaperModel').click(function(event) {
			event.preventDefault();
			$('#myModalQuestionPaper').hide();

		});
		
		$('#approveStudent').click(function(event) {
			event.preventDefault();
			$('#myModalQuestionPaper').hide();
			approve(id,"approveStudent",1,"Approved");
		});
		
		$('#rejectStudent').click(function(event) {
			event.preventDefault();
			$('#myModalQuestionPaper').hide();
			approve(id,"rejectStudent",2,"Rejected");

		});
		
		function approve(id,buttonId,value,message){
	        $("#"+buttonId).prop("disabled", true);
			 $(".loader1").show();
	          $('#myModal').show();
	     	 $.ajax({
			      type: "GET",
			      url:"/College_Final_Year_Project/fetch?action=approve&action1="+message+"&id="+id+"&value="+value,
			      success: function (data, textStatus, jqXHR) {
			    	  $(".loader1").hide();
      		        $('#myModal').hide();
      		        if (data.trim().includes("Successfully")) {
      		          swal("Done", data, "success");
                       
      		          if(message.trim()=="Approved"){
      		        	  $("#rejectStudent").prop("disabled", false);

      		          }else{
      		        	  
      		        	  $("#approveStudent").prop("disabled", false);
      		          }
      		          
      		          
      		        }
      		        else {
      		          swal("Error", data, "error");
      		        $("#"+buttonId).prop("disabled", false);
      		        }
			    	 $(".loader1").hide();
	                  $('#myModal').hide();
	         		 fetchStudentRegistraion();
	                  $('#myModalQuestionPaper').show();
	      	       
			      },
			      error: function (jqXHR, textStatus, errorThrown) {
			    	  swal("Error", errorThrown, "error");
			 		 fetchStudentRegistraion();
		           $('#myModalQuestionPaper').show();
		           $("#"+buttonId).prop("disabled", false);
			      }
			    });  
		}
		 function fetchStudentRegistraion(){
				
	     	 $.ajax({
			      type: "GET",
			      url:"/College_Final_Year_Project/fetch?action=newStudentRegistration",
			      success: function (data, textStatus, jqXHR) {
			    	  var JsonData= jQuery.parseJSON(data);
			    	  $('#Table').empty();
			    	 if(JsonData.length==0){
				     $("#Table").html('<tr class="no-records"><td colspan="8" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
			    	 }
			    	 else{
			          $(JsonData).each(function (index, item) {  
			        	
			        	 $('#Table').append(
			        			  '<tr style="height:20px">'+
			        			'<td style="text-align: center;display:none;">'+item.pkId+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.SlNo+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.collegeId+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.gender+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px; text-transform: none; ">'+item.emailId+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.mobileNumber+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.courseName+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.departmentName+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.semster+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.section+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+item.status+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;display:none;">'+item.base64Image+'</td>'+
			        		     '<td style="text-align: center;"><input type="submit" value="Action" onclick=myFunction()  class="btn btn-primary" id=button'+item.pkId+' ></td>'+
			        		      '</tr>'
			        	  );
			        	  
			        	  
				      });
			    	 }
			    	 $(".loader1").hide();
	                  $('#myModal').hide();
			      },
			      error: function (jqXHR, textStatus, errorThrown) {
		           alert("Sorry Something went wrong while loading Student List.");
			      }
			    });  
			 
			 
		 }
		 

	</script>

</body>
</html>