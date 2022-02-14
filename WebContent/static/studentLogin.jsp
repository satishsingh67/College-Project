<%@page import="com.college.model.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
      <!-- Compiled and minified CSS -->
      <link rel="stylesheet" href="lib/materialize.min.css">

      <!-- Compiled and minified JavaScript -->
      <script src="lib/materialize.min.js"></script>
      <script src="lib/jquery.min.js"></script>
       <script src="./lib/sweetalert.min.js"></script>
      <script src="js/studentLogin.js"></script>
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
<body style="background-color: #63b2f7;">
        <!-- Page Content goes here -->
        <div class="conatiner">
<div class="row">
<div class="col m4 offset-m4">
<div class="card">
<div class="card-content" style="margin-top:20%;border: 1px solid white; background-color: yellow;">
    <h5 class="center-align" style="font-weight: bold;color: skyblue;" >Student Login</h5>
    <div class="form">
<form method="POST"  id="studentLogin" enctype="multipart/form-data">
<%

Message msg=(Message)session.getAttribute("message");
if(msg!=null){
	%>
	 <label style="color:green; font-weight: bold;  font-size: 15px;margin-bottom:10%"><%= msg.getContent() %></label>
	<%
session.removeAttribute("message");
}
%>
<br>
    <label for="first_name" style="color:black; font-weight: bold;  font-size: 15px;">Enter Your Name</label>
    <input placeholder="Enter Your Name" id="first_name" name="studentName" type="text" class="validate">
    <label for="student_id" style="color:black; font-weight: bold; font-size: 15px;">Enter Your ID</label>
    <input placeholder="Enter Your ID" id="student_id" name="idNumber" type="text" class="validate">
    <label for="student_id" style="color:black;font-weight: bold;  font-size: 15px;">Choose Security Question</label>
  <select class="browser-default" name="securityQuestion" style="margin-bottom: 2%;" id="Survey_Qs">
    <option>--Select--</option>
    <option>Your Favourite Color</option>
    <option>Your  Favourite Food</option>
    <option>Your Home Town</option>
    <option>Your Favourite Game</option>
    <option>Your Pet Name</option>
    <option>Your Hobby</option>
    <option>Your Date Of Birth</option>
    <option>Your Year Of Birth</option>
</select>
<label for="securityQuestionAnswer" style="color:black;font-weight: bold;font-size: 15px;">Enter Security Question's Answer</label>
<input placeholder="Enter Security Question's Answer" name="securityQuestionAnswer" id="securityQuestionAnswer" type="text" class="validate">
<label for="first_name" style="color:black; font-weight: bold;font-size: 15px;">Enter Security Pin</label>
<input placeholder="Enter Security Pin" name="securityPin" id="first_name" type="password" class="validate">
<div class="btn-group center-align"  role="group">
    <button type="submit" id="loginSubmit" value="submit"  class="btn #2196f3 blue">Submit</button>
    <button type="clear" value="Clear" class="btn #2196f3 blue" >Clear</button>
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
</body>
</html>