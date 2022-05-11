<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Admin" %>

<%
Admin admin=(Admin)session.getAttribute("admin");
if(admin==null){
	response.sendRedirect("adminLogin.jsp");
	return;
}
Integer adminId=admin.getPkadminId();

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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- bootstrap cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/css/bootstrap.min.css">

<script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>

    <title>Change Password</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600&display=swap');

:root{
   --blue:#00b8b8;
   --black:#333;
   --white:#fff;
   --light-color:#666;
   --light-bg:#eee;
   --border:.2rem solid rgba(0,0,0,.1);
   --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
}

*{
   font-family: 'Poppins', sans-serif;
   margin:0; padding:0;
   box-sizing: border-box;
   outline: none; border:none;
   text-decoration: none !important;
   text-transform: capitalize;
}

*::-webkit-scrollbar{
   height: .5rem;
   width: 1rem;
}

*::-webkit-scrollbar-track{
   background-color: transparent;
}

*::-webkit-scrollbar-thumb{
   background-color: var(--blue);
}

html{
   font-size: 62.5%;
   overflow-x: hidden;
   scroll-behavior: smooth;
   scroll-padding-top: 6.5rem;
}

section{
   padding:7rem 2rem;
}

.heading{
   text-align: center;
   font-size: 4rem;
   color:var(--black);
   text-transform: uppercase;
   font-weight: bolder;
   margin-bottom: 3rem;
}

.link-btn{
   display: inline-block;
   padding:1rem 3rem;
   border-radius: .5rem;
   background-color: var(--blue);
   cursor: pointer;
   font-size: 1.7rem;
   color:var(--white);
}

.link-btn:hover{
   background-color: var(--black);
   color:var(--white);
}
.contact form{
   border-radius: .5rem;
   background-color:none;
   padding:2rem;
   margin:0 auto;
   max-width: 50rem;
}

.contact form .message{
   margin-bottom: 2rem;
   border-radius: .5rem;
   background-color: var(--blue);
   padding:1.2rem 1rem;
   font-size: 1.7rem;
   color:var(--white);
   text-align: center;
}

.contact form .box{
   width: 100%;
   margin-top: 1rem;
   margin-bottom: 2rem;
   border-radius: .5rem;
   background-color: var(--white);
   padding:1.2rem 1.4rem;
   font-size: 1.7rem;
   color:var(--black);
   text-transform: none;
}

.contact form span{
   font-size: 1.7rem;
   color:var(--black);
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
    </style>
</head>
<body >
    <section class="contact" id="contact" style="background-image: url(./images/background/ranger-4df6c1b6.png);background-repeat: no-repeat;background-size: cover;" >

        <h1 class="heading" style= "font-size: 40px; font-weight: 1000;font-family: 'Times New Roman', Times, serif;
        padding-top: 1rem;
        color: rgb(5, 5, 5); text-shadow: 0.4rem 0.4rem 0 rgba(12, 12, 12, 0.2);">Change Password</h1>
        <hr>
     <div class="col-md-12" style="box-shadow:  5px 5px 5px solid grey;">
         <div class="row">
             <div class="col-md-6">
                <img src="./images/background/web development.svg">
               </div>
             <div class="col-md-6">
                <form id="adminForm" >
           
                    <span style="font-weight: bold;color: black; font-size: 20px;">your name :<strong class="text-danger">*</strong></span>
                    <input type="text" name="name" placeholder="Enter Your Name" class="box" required>
                    <span style="font-weight: bold;color: black; font-size: 20px;">your email :<strong class="text-danger">*</strong></span>
                    <input type="email" name="email" placeholder="Enter Your Email" class="box" required>
                    <span style="font-weight: bold;color: black; font-size: 20px;">your Mobile number :<strong class="text-danger">*</strong></span>
                    <input type="text" name="mobileNumber" placeholder="Enter Your Mobile Number" class="box" required>
                    <span style="font-weight: bold;color: black; font-size: 20px;">your Old Password:<strong class="text-danger">*</strong></span>
                    <input type="password" name="oldPassword" placeholder="Enter Old Password" class="box" required>
                     <span style="font-weight: bold;color: black; font-size: 20px;">your New Password:</span>
                    <input type="password" name="password" placeholder="Enter New Password" class="box" required>
                    <span style="font-weight: bold;color: black; font-size: 20px;">confirm your Password:<strong class="text-danger">*</strong></span>
                    <input type="password"  name="ConfirmPassword" placeholder="Confirm Your Password" class="box" required>
                    <input type="submit" id="adminChangesButton" style="background-color: black;" value="Submit" name="submit" class="link-btn"> 
                    <input type="submit" id="adminClearButton" style="background-color: black;" value="Clear" name="Submit" class="link-btn" style="border-bottom-right-radius: 20px;">
                 </form>  
            </div>
         </div>
     </div>
     </section>
    
    <div id="myModal" class="modal1">

        <!-- Modal content -->
        <div class="modal-content1">
          <span class="close" style="display: none;" >&times;</span>
          <div class="loader1" style="display:none;">
            <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;"> 
            </div>
      
      <h5 id="loaderText" style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;font-size:20px;">Please wait....</h5>       
        </div>
        </div>
      
      </div>
    
    
    <script>
    
	  $("#adminChangesButton").click(function (event) {
	    event.preventDefault();

	    $('#myModal').show();
	    //Calling Loader
	    $(".loader1").show();

	    var form = $('#adminForm')[0];
	    // Create an FormData object 
	    var data = new FormData(form);
	    data.append("action", "adminChangePassword");
	    // disabled the submit button
	    $("#adminChangesButton").prop("disabled", true);
	    $.ajax({
	      type: "POST",
	      enctype: 'multipart/form-data',
	      url: "/College_Final_Year_Project/create",
	      data: data,
	      processData: false,
	      contentType: false,
	      success: function (data, textStatus, jqXHR) {

	        $(".loader1").hide();
	        $('#myModal').hide();

	        if (data.trim().includes("Successfully")) {
	          swal("Done", data, "success");
	          $('#adminForm')[0].reset();
	        }
	        else {
	          swal("Error", data, "error");
	        }
	        $("#adminChangesButton").prop("disabled", false);
	      },
	      error: function (jqXHR, textStatus, errorThrown) {

	        $(".loader1").hide();
	        $('#myModal').hide();

	        swal("Error", data, "error");
	        $("#adminChangesButton").prop("disabled", false);
	      }
	    });
	  });
	    $("#adminClearButton").click(function (event) {
  	    event.preventDefault();
  	    $('#adminForm')[0].reset();
	    });
 
    </script>
     
</body>
</html>