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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
   <script src="./lib/jquery.min.js"></script>
   <script src="./lib/sweetalert.min.js"></script>
   <!-- bootstrap cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/css/bootstrap.min.css">
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
  
}
section.login{
   margin: 100px;
    background-color: whitesmoke;
    box-shadow: 5px 5px 5px solid gray;
    height: 600px;
    box-shadow: 5px 5px 5px gray;
    border-radius: 40px;
   
   
}
form{
   
   border-radius: .5rem;
   background-color:rgb(247, 248, 248);
   padding:2rem;
   margin:0 auto;
   max-width: 50rem;
   padding-top: 100px;
   padding-bottom: 100px;
}

form .message{
   margin-bottom: 2rem;
   border-radius: .5rem;
   background-color: var(--blue);
   padding:1.2rem 1rem;
   font-size: 1.7rem;
   color:var(--white);
   text-align: center;

}

form .box{
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

form span{
   font-size: 1.7rem;
   color:var(--black);
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
      margin-top: 15%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 30%;
      height: 40%;
    }
    
    </style>
    <title>Delete account</title>
</head>
<body style="background-image: url(./images/background/properback.png);background-repeat: no-repeat;background-size: cover;">
    
    <section class="login">
        <br>
        <h1 class="text-center" style= "font-size: 50px; font-weight: 900;font-family: 'Times New Roman', Times, serif;
        padding-top: 1rem;
        color: rgb(116, 35, 116); text-shadow: 0.4rem 0.4rem 0 rgba(12, 12, 12, 0.2); ">Delete Account</h1>
        <br>
        <div class="col-md-12">
         <div class="row">
             <div class="col-md-6">
               <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets5.lottiefiles.com/packages/lf20_5tkuwdgq.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player>
             </div>
             <div class="col-md-6">
               <form  id="deleteForm">
          
                   
                   <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter The  Id To Be Deleted :<strong class="text-danger">*</strong></span>
                   <input type="text" name="id"  id="accId" placeholder="enter Id" class="box" required>
                   <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter your Email:<strong class="text-danger">*</strong></span>
                   <input type="text" name="email" id="emailId" placeholder="enter your email" class="box" required>
                   
                   <input type="submit" value="Delete" name="submit" id="deleteAccountButton" class="link-btn" style="margin-right: 5px;">
                   <input type="submit" value="Clear" name="submit" id="ClearButton" class="link-btn">
                </form>   
           </div>
         </div>
     </div>
   </section>

         <!-- Loader Modal Start -->
   <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="loader1" style="display:none;">
        <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;">
        </div>

        <h4
          style="font-size:20px;margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
 <!-- Loader Modal end -->
            
      <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">OTP</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
        <label><b style="font-size:15px; text-transform: none;" id="teacherName" ></b></label>
 
      <input type="text" name="otp" id="otpfield" placeholder="Enter OTP" class="box"  required style="border:1px solid skyblue;width:400px; height:50px;font-size:18px;">
   
      <br>
       <br>
         <div style="text-align:center;">
     
      <input type="submit" id="otpSubmit"  value="Submit" class="link-btn" >
     
     </div>
         
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel" class="link-btn" style="background-color:red;">Close</button>
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->      



<script>
var id,email;

$("#deleteAccountButton").click(function (event) {
	 event.preventDefault();
	$('#myModal').show();
	//Calling Loader
	$(".loader1").show();

	id=$('#accId').val();
	email=$('#emailId').val();
	
    var form = $('#deleteForm')[0];
    // Create an FormData object 
    var data = new FormData(form);
    data.append("action", "adminAccountDeleteOtp");
    // disabled the submit button
    $("#deleteAccountButton").prop("disabled", true);
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
        	  $('#deleteForm')[0].reset();
        	//Calling Loader
        	  $('#myModalQuestionPaper').show();
        }else{
        	 swal("Error", data, "error");
        }
      
        $("#deleteAccountButton").prop("disabled", false);
      },
      error: function (jqXHR, textStatus, errorThrown) {
    	  $(".loader1").hide();
      	$('#myModal').hide();
    	  swal("Error", data, "error");
        $("#deleteAccountButton").prop("disabled", false);
      }
    });
	
});

$("#closeQuestionPaperModel").click(function (event) {
	 event.preventDefault();
	  $('#myModalQuestionPaper').hide();
	});

$("#ClearButton").click(function (event) {
	 event.preventDefault();
    $('#deleteForm')[0].reset();
	});

$("#otpSubmit").click(function (event) {
	 event.preventDefault();
	  $('#myModalQuestionPaper').hide();
	$('#myModal').show();
	//Calling Loader
	$(".loader1").show();

  var otp=$("#otpfield").val();
   // Create an FormData object 
   var data = new FormData();
   data.append("otp",otp);
   data.append("id",id);
   data.append("email",email);
   data.append("action", "adminAccountDelete");
   // disabled the submit button
   $("#otpSubmit").prop("disabled", true);
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
       	//Calling Loader
       	  
          swal("Done", data, "success");

       }else{
       	 swal("Error", data, "error");
       }
       var otp=$("#otpfield").val(" ");
       $('#myModalQuestionPaper').hide();
       $("#otpSubmit").prop("disabled", false);
     },
     error: function (jqXHR, textStatus, errorThrown) {
   	  $(".loader1").hide();
     	$('#myModal').hide();
   	  swal("Error", data, "error");
   	$('#myModalQuestionPaper').hide();
       $("#otpSubmit").prop("disabled", false);
     }
   });
	
});



</script>
</body>
</html>