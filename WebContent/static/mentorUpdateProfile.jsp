<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Mentor" %>

<%

Mentor mentor=(Mentor)session.getAttribute("mentor");
if(mentor==null){
	response.sendRedirect("mentorLogin.jsp");
	return;
}


Integer mentorId=mentor.getPkMentorId();


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
<form method="POST"  id="updateDeatilsTeacher" enctype="multipart/form-data">

    <label for="mentor_mail" style="color:black; font-weight: bold; font-size: 15px;">Id</label>
    <input  readonly id="teacherId"  type="text" value="" class="validate">
     <label for="mentor_mail" style="color:black; font-weight: bold; font-size: 15px;">Name</label>
    <input  readonly id="teacherName"  type="text" value="" class="validate">
    
     <label for="mentor_mail" style="color:black; font-weight: bold; font-size: 15px;">Email ID</label>
    <input readonly id="teacherEmail"  type="email" class="validate">
    
    <label for="mentor_mail" style="color:black; font-weight: bold; font-size: 15px;">Recovery Email ID</label>
    <input placeholder="Enter Your Recovery Mail ID" id="teacherRecoveryEmailId" name="recoveryEmail"  type="email" class="validate">
<label for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Mobile Number</label>
<input readonly name="existingPhoneNumber" id="teacherMobileNumber" type="text" class="validate">
<label for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Recovery Mobile Number</label>
<input  placeholder="Enter Your Recovery Mobile Number" id="teacherRecoveryMobileNumber" name="recoveryPhoneNumber" type="text"  class="validate">
<label for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Gender</label>
<input readonly id="teacherGender" type="text" class="validate">
<label for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Date of Birth</label>
<input name="DOB" type="date" id="teacherDOB" class="validate">
<label  for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Upload Photo</label>
<input type="file" name="teacherPhoto"  class="form-control-file border">

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
 var mentorId=<%=mentorId%>;
 
 var phoneNubmerOld;
var recoveryPhoneNubmerOld;
var recoveryemailOld;
var dobOld;

$(document).ready(function () {
	 $('#myModal').show();
	    //Calling Loader
	   $(".loader1").show();
	   fetchMentorDetails(mentorId);
});






$('#updateDetails').click(function (event){
	event.preventDefault();
	$('#updateDetails').prop("disabled", true);  
	 $('#myModal').show();
    //Calling Loader
    $(".loader1").show();
     var form = $('#updateDeatilsTeacher')[0];
// Create an FormData object 
var data = new FormData(form);
data.append("action", "mentorDetails");
data.append("mentorId",mentorId);
data.append("phoneNubmerOld", phoneNubmerOld);
data.append("recoveryPhoneNubmerOld", recoveryPhoneNubmerOld);
data.append("recoveryemailOld",recoveryemailOld); 
data.append("dobOld", dobOld);
   $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url:"/College_Final_Year_Project/changeLoginDetails", 		      
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
         fetchTeacherDetails(teacherId);
      },
      error: function (jqXHR, textStatus, errorThrown) {
    	  $(".loader1").hide();
         $('#myModal').hide();
       swal("Error", data, "error");
       $("#updateDetails").prop("disabled", false);
      }
    });    
});	  

function fetchMentorDetails(mentorId){
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/mentorLogin?mentorId="+mentorId,
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	    	  phoneNubmerOld=JsonData[0].mobileNo;
	    	  recoveryPhoneNubmerOld=JsonData[0].recoveryMobileNumber;
	    	 recoveryemailOld=JsonData[0].recoveryEmailId;
	    	 dobOld=JsonData[0].DOB;
	    	 $('#teacherId').val(JsonData[0].pkMentorId);
	    	 $('#teacherName').val(JsonData[0].name);
	    	 $('#teacherEmail').val(JsonData[0].emailId);
	    	 $('#teacherRecoveryEmailId').val((JsonData[0].recoveryEmailId)==null?"":JsonData[0].recoveryEmailId);
	    	 if(JsonData[0].mobileNo==null || JsonData[0].mobileNo==""){
	    		 $('#teacherMobileNumber').prop("readonly", false); 
	    		 $('#teacherMobileNumber').attr('placeholder', 'Enter Your Mobile No');
	    	 }else{
		    	 $('#teacherMobileNumber').val(JsonData[0].mobileNo);
	    		 $('#teacherMobileNumber').prop("readonly", true); 

	    	 } 
	    	 $('#teacherRecoveryMobileNumber').val((JsonData[0].recoveryMobileNumber)==null?"":JsonData[0].recoveryMobileNumber);
	    	 $('#teacherGender').val(JsonData[0].gender);
	    	 $('#teacherDOB').val((JsonData[0].DOB)==null?"":JsonData[0].DOB);

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