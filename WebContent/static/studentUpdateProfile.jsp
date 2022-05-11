<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Student" %>


<%
Student student=(Student)session.getAttribute("student");
if(student==null){
	response.sendRedirect("studentLogin.jsp");
	return;
}

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GNIT</title>
      <!-- Compiled and minified CSS -->
      <link rel="stylesheet" href="lib/materialize.min.css">

      <!-- Compiled and minified JavaScript -->
      <script src="lib/materialize.min.js"></script>
      <script src="lib/jquery.min.js"></script>
       <script src="./lib/sweetalert.min.js"></script>
<style>
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


/* The Modal (background) */
.modal1 {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content1 {
  background-color: #fefefe;
  margin: auto;
  margin-top: 10%;
  padding: 20px;
  border: 1px solid #888;
  width: 32%;
  height:32%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  margin-left: 97%;
  margin-top: -3%;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
</style>

</head>
<body style="background-color:    #14e058;">
        <!-- Page Content goes here -->
        <div class="conatiner">
<div class="row">
<div class="col m4 offset-m4">
<div class="card">
<div class="card-content" style="margin-top:20%;border: 1px solid white; background-color: yellow;box-shadow: 5px 5px 5px gray;">
    <h5 class="center-align" style="font-weight: bold;color: black;" >Update Profile</h5>
    <div class="form">
<form method="POST"  id="updateDetailsStudent" enctype="multipart/form-data">

    <label  style="color:black; font-weight: bold; font-size: 15px;">College Id</label>
    <input  readonly id="studentCollegeId"  type="text" value="" class="validate">
     <label  style="color:black; font-weight: bold; font-size: 15px;">Name</label>
    <input  readonly id="studentName"  type="text" value="" class="validate">
    
     <label  style="color:black; font-weight: bold; font-size: 15px;">Email ID</label>
    <input readonly id="studentEmail"  type="email" class="validate">
   
<label style="color:black; font-weight: bold;font-size: 15px;">Mobile Number</label>
<input readonly  id="studentMobileNumber" type="text" class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Recovery Mobile Number</label>
<input   id="studentRecoveryMobileNumber" readonly type="text"  class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Gender</label>
<input readonly id="studentGender" type="text" class="validate">
<!-- ----------------------------------------###-------------------------
 -->
 
 <label style="color:black; font-weight: bold;font-size: 15px;">University Roll Number</label>
<input  readonly id="studentUniversityRollNo"  type="text"  class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">University Registration Number</label>
<input readonly id="studentUniversityRegistrationNo" type="text" class="validate">


<label style="color:black; font-weight: bold;font-size: 15px;">Course</label>
<input  readonly id="studentCourse"  type="text"  class="validate">


<label style="color:black; font-weight: bold;font-size: 15px;">Department</label>
<input  readonly id="studentDepartemnt"  type="text"  class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Semester</label>
<input  id="studentSemester" name="semester" type="text" class="validate">


 <label style="color:black; font-weight: bold;font-size: 15px;">Section</label>
<input  readonly id="studentSection"  type="text"  class="validate">


<label style="color:black; font-weight: bold;font-size: 15px;">Date of Birth</label>
<input name="DOB" type="date"  id="studentDOB" class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Blood Group</label>
<input  id="studentBloodGroup" name="bloodGroup"  type="text" class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Guardian Name</label>
<input   id="studentGuardianName" name="guardianName"  type="text"  class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Guardian Mobile Number</label>
<input  id="studentGuardianNumber" name="guardianNumber" type="text" class="validate">


<label style="color:black; font-weight: bold;font-size: 15px;">Guardian Email Id</label>
<input  id="studentGuardianEmailId" name="guardianEmailId" type="text" class="validate">

<label style="color:black; font-weight: bold;font-size: 15px;">Address</label>
<input  id="studentAddress" name="studentAddress" type="text" class="validate">

<label  style="color:black; font-weight: bold;font-size: 15px;">Upload Photo</label>
<input type="file" name="studentPhoto"  class="form-control-file border">

<div class="btn-group center-align"  style="margin-top:10px;" role="group">
<button type="submit" id="updateDetails" value="submit"  class="btn #2196f3 blue">Update</button>
  </div>
</form>



    </div>

    <div id="myModal" class="modal1">

        <!-- Modal content -->
        <div class="modal-content1">
          <span class="close" style="display: none;" >&times;</span>
          <div class="loader1" style="display:none;">
            <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;"> 
            </div>
      
      <h5 id="loaderText" style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;">Please wait....</h5>       
        </div>
        </div>
      
      </div>
 
</div>
</div>
</div>
</div>
 </div>
 
<script>
 
 var id=<%=student.getPkRegistrationId()%>;
 var oldSemester;


$(document).ready(function () {
	 $('#myModal').show();
	    //Calling Loader
	   $(".loader1").show();
	  fetchStudentDetails("1");
});


$('#updateDetails').click(function (event){
	event.preventDefault();
	$('#updateDetails').prop("disabled", true);  
	 $('#myModal').show();
    //Calling Loader
    $(".loader1").show();
     var form = $('#updateDetailsStudent')[0];
// Create an FormData object 
var data = new FormData(form);
data.append("action", "updateStudentDetails");
data.append("id",id);
data.append("oldSemester", oldSemester);


   $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url:"/College_Final_Year_Project/studentProfileUpdate", 		      
      data: data,
      processData: false,
      contentType: false,
      success: function (data, textStatus, jqXHR) {
         $(".loader1").hide();
         $('#myModal').hide();
         if (data.trim().includes("Successfully")) {
           swal("Done", data, "success");
         
         }
         else {
           swal("Error", data, "error");
         }
         $("#updateDetails").prop("disabled", false);
         fetchStudentDetails(1);
      },
      error: function (jqXHR, textStatus, errorThrown) {
    	  $(".loader1").hide();
         $('#myModal').hide();
       swal("Error", data, "error");
       $("#updateDetails").prop("disabled", false);
      }
    });    
});	  

function fetchStudentDetails(studentId){
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/studentLogin?id="+studentId,
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	
	    	 dobOld=JsonData[0].DOB;
	    	 	    	 
	    	 $('#studentCollegeId').val(JsonData[0].collegeId);
	    	 $('#studentName').val(JsonData[0].name);
	    	 $('#studentEmail').val(JsonData[0].emailId);
		     $('#studentMobileNumber').val(JsonData[0].mobileNumber);
	    	 $('#studentRecoveryMobileNumber').val(JsonData[0].recoverMobileNumber);
	    	 $('#studentGender').val(JsonData[0].gender);
	    	 $('#studentDOB').val(JsonData[0].dob==""?"":JsonData[0].dob);

	    	 
	    	 $('#studentUniversityRollNo').val(JsonData[0].universityRollNo);
	    	 $('#studentUniversityRegistrationNo').val(JsonData[0].universityRegistrationNo);
	    	 $('#studentCourse').val(JsonData[0].courseName);
	    	 $('#studentDepartemnt').val(JsonData[0].departmentName);
	    	 
	    	 if(JsonData[0].isAccountUpdationAllowed==0){
	    		 $('#studentSemester').prop("readonly", true); 
	    	 }else{
	    		 $('#studentSemester').prop("readonly", false); 

	    	 }

		     $('#studentSemester').val(JsonData[0].semster);
	    	 $('#studentSection').val(JsonData[0].section);
	    	 
	    	 if(JsonData[0].bloodGroup=="(NULL)"){
	    	 	 $('#studentBloodGroup').attr('placeholder', 'Enter Your Blood Group'); 
	    	 }
	    	 if(JsonData[0].gurdianName=="(NULL)"){
	    	 	 $('#studentGuardianName').attr('placeholder', 'Enter Your Gurdian Name'); 
	    	 }
	    	
	    	 if(JsonData[0].gurdianContactNumber=="(NULL)"){
	    	 	 $('#studentGuardianNumber').attr('placeholder', 'Enter Your Gurdian Contact Number'); 
	    	 }
	    	 if(JsonData[0].gurdianEmailid=="(NULL)"){
	    	 	 $('#studentGuardianEmailId').attr('placeholder', 'Enter Your Gurdian Email id'); 
	    	 }
	    	 
	    	 if(JsonData[0].address==null){
	    	 	 $('#studentAddress').attr('placeholder', 'Enter Your Address'); 
	    	 }
	    	 $('#studentBloodGroup').val(JsonData[0].bloodGroup=="(NULL)"?"":JsonData[0].bloodGroup);
	    	 $('#studentGuardianName').val(JsonData[0].gurdianName=="(NULL)"?"":JsonData[0].gurdianName);
	    	 $('#studentGuardianNumber').val(JsonData[0].gurdianContactNumber=="(NULL)"?"":JsonData[0].gurdianContactNumber);
	    	 $('#studentGuardianEmailId').val(JsonData[0].gurdianEmailid=="(NULL)"?"":JsonData.gurdianEmailid);
	    	 $('#studentAddress').val(JsonData[0].address==null?"":JsonData[0].address);
	    	  
	    	 
	    	   oldSemester=JsonData[0].semster;
	    	  
	    	 
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



</script> 
 
</body>
</html>