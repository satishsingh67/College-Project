<%@page import="com.college.model.Message" %>
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
    <title>Admin Login</title>
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
.login{
   margin: 100px;
    background-color: whitesmoke;
    box-shadow: 5px 5px 5px solid gray;
    height: 600px;
    box-shadow: 5px 5px 5px gray;
    border-radius: 40px;
    border-bottom-right-radius:20px ;
   
   
}
 form{
   border-radius: .5rem;
   background-color:none;
   padding:2rem;
   margin:0 auto;
   max-width: 50rem;
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
    </style>
</head>
<body style="background-image: url(./images/background/properback.png);background-repeat: no-repeat;background-size: cover;">
    <section  class="login" id="contact" style="height:640px; background-color: rgb(158, 158, 240);" >

        <h1 class="heading" style= "font-size: 40px; font-weight: 900;font-family: 'Times New Roman', Times, serif;
        padding-top: 1rem;
        color: rgb(252, 250, 255); text-shadow: 0.4rem 0.4rem 0 rgba(12, 12, 12, 0.2);">Admin Login</h1>
     <div class="col-md-12" style="box-shadow:  5px 5px 5px solid grey;">
         <div class="row"  >
             <div class="col-md-6">
               <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
               <lottie-player src="https://assets4.lottiefiles.com/packages/lf20_1z0fledt.json"  background="transparent"  speed="1"  style="width: 500px; height: 530px;"  loop  autoplay></lottie-player>
               
               </div>
             <div class="col-md-6">
                <form id="loginForm" style="background-color: rgb(224, 170, 224);box-shadow: 5px 5px 5px solid rgb(129, 47, 47);border-radius: 10px;height: 450px"><br><br>
						<%
							Message msg = (Message) session.getAttribute("message");
						if (msg != null) {
						%>
						<label
							style="color: Green; font-weight: bold; font-size: 15px; margin-left: 20px;"><%=msg.getContent()%></label>
						<%
							session.removeAttribute("message");
						}
						%>

				<div class="col-md-12">
              <div class="row">
              
                 <div class="col-md-6">

                  <span>your name :<strong class="text-danger" style="color:red;">*</strong></span>
                  <input type="text" name="name" placeholder="enter your name" class="box" required>
                  <span>your email :<strong class="text-danger" style="color:red;">*</strong></span>
                  <input type="email" name="email" placeholder="enter your email" class="box" required>
                  
                 </div>
                 <div class="col-md-6">
                  <span>your mobile number :<strong class="text-danger" style="color:red;">*</strong></span>
                  <input type="text" name="mobileNumber" placeholder="enter your mobile number" class="box" required>
                  <span>your Password:<strong class="text-danger" style="color:red;">*</strong></span>
                  <input type="password" name="password" placeholder="enter your Password" class="box" required>
                  
               </div>
              </div>
           </div>
                  
                    <input type="submit" id="loginSubmit" style="background-color: black;margin: 20px;" value="Submit" name="submit" class="link-btn"> 
                    <input type="submit" id="loginClear" style="background-color: black;margin: 20px;" value="Clear" name="Submit" class="link-btn" style="border-bottom-right-radius: 20px;">
                    <a href="forgetPassword.jsp" target="_blank" style="background-color: black;margin: 20px;"  class="link-btn" style="border-bottom-right-radius: 20px;">Forget Password</a>
               
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
   
   
     
     <script >
     
     $("#loginSubmit").click(function (event) {
    	 event.preventDefault();
    	$('#myModal').show();
    	//Calling Loader
    	$(".loader1").show();

    	id=$('#accId').val();
    	email=$('#emailId').val();
    	
        var form = $('#loginForm')[0];
        // Create an FormData object 
        var data = new FormData(form);
        data.append("action", "adminAccountDeleteOtp");
        // disabled the submit button
        $("#loginSubmit").prop("disabled", true);
        $.ajax({
          type: "POST",
          enctype: 'multipart/form-data',
          url: "/College_Final_Year_Project/adminLogin",
          data: data,
          processData: false,
          contentType: false,
          success: function (data, textStatus, jqXHR) {
        	  $(".loader1").hide();
          	$('#myModal').hide();
          	if (data.trim().includes(".jsp")) {
	        	  $('#loginForm')[0].reset();
	        	    window.location.href = data;
	        	 } else{
            	 swal("Error", data, "error");
            }
           
            $("#loginSubmit").prop("disabled", false);
          },
          error: function (jqXHR, textStatus, errorThrown) {
        	  $(".loader1").hide();
          	$('#myModal').hide();
        	  swal("Error", textStatus, "error");
            $("#loginSubmit").prop("disabled", false);
          }
        });
    	
    });
     $("#loginClear").click(function (event) {
    	 event.preventDefault();
    	  $('#loginForm')[0].reset();
     });
     
     </script>
     
     
</body>
</html>