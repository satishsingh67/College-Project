<%@page import="com.college.model.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
     <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

/* coding with nick */

*{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}

body{
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
    background-color: black;
}

a{
    text-decoration: none;
    color: unset;
}
a:hover{
    color: #3ac6e1 !important;
}
.container{
    width: 100vw;
    height: 100vh;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    padding: 0 2rem;
}
.img{
    width: 100%;
    height: 100vh;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}
.img img{
    width: 500px;
}

.login-content{
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}
.title-container{
    text-align: left;
    padding-bottom: 40px;
}
.title-container h1{
    color: #3ac6e1;
    font-size: 30px;
    font-weight: 600;
}
.title-container h2{
    font-size: 30px;
    font-weight: 600;
    text-transform: none;
    margin: 2px 0;
}
.title-container p{
    font-size: 15px;
    font-weight: 500;
    color: #c0c0c0;
}
.login-inner-content{
    padding-top: 5px;
    padding-right: 10px;
    padding-bottom: 20px;
    padding-left: 10px;
    border-radius: 10px;
    box-shadow: 0px 0px 26px -6px rgba(0,0,0,0.10);
}
.login-content .input-div{
    position: relative;
    display: grid;
    grid-template-columns: 7% 93%;
    margin: 5px;
    padding: 5px 0;
    border-bottom: 2px solid #d9d9d9;
}
.login-content .input-div.one{
    margin-top: 0;
}

.i{
    color: #d9d9d9;
    display: flex;
    justify-content: center;
    align-items: center;
}
.i i{
    transition: .3s;
}
.input-div > div{
    position: relative;
    height: 45px;
}
.input-div > div{
    position: relative;
    height: 45px;
}
.input-div > div > h5{
    position: absolute;
    left: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    font-size: 15px;
    transition: .3s;
    font-weight: 500;
}
.input-div:before, .input-div:after{
    content: '';
    position: absolute;
    bottom: -2px;
    width: 0%;
    height: 2px;
    background-color: #3ac6e1;
    transition: .4s;
}
.input-div:before{
    right: 50%;
}
.input-div:after{
    left: 50%;
}
.input-div.focus:before, .input-div.focus:after{
    width: 50%;
}

.input-div.focus > div > h5{
    top: 3px;
    font-size: 10px;
    font-weight: 500;
}
.input-div > div > input{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    border: none;
    outline: none;
    background: none;
    padding: 0.5rem 0.7rem;
    font-size: 15px;
    color: #555;
    font-family: 'poppins', sans-serif;
}
.input-div.pass{
    margin-bottom: 4px;
}

.login-inner-content a{
    display: block;
    text-align: right;
    color: rgb(0, 0, 0);
    margin-top: 10px;
    font-size: 10px;
    font-weight: 600;
    transition: .3s;
}
.btn{
    display: block;
    width: 100%;
    height: 50px;
    border-radius: 50px;
    outline: none;
    border: none;
    background-image: linear-gradient(to right, #5bdffa, #36cbe9, #5bdffa );
    background-size: 200%;
    font-size: 1.2rem;
    color: #fff;
    font-family: 'poppins',sans-serif;
    margin: 1rem 0;
    cursor: pointer;
    transition: .5s;
}
.btn:hover{
    background-position: right;
}

h5{
    font-size: 12px;
    font-weight: 600;
}


/* Mobile Responsive */

@media screen and (max-width: 1050px){
    .container{
        grid-gap: 5rem;
    }
}
@media screen and (max-width: 1000px){
   .title-container h2{
       font-size: 25px !important;
   }
   form{
       width: 290px;
   }
   .login-content h2{
       font-size: 2.4rem;
       margin: 8px 0;
   }
   .img img{
       width: 400px;
   }
}
@media screen and (max-width: 900px){
    .container{
        grid-template-columns: 1fr;
    }
    .img{
        display: none;

    }
    .login-content{
        justify-content: center;
    }
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
<body>
    <div class="container">

        <div class="img">
            <img src="images/teachers/65229-classroom.gif" alt="BG">
        </div>

        <div class="login-content">

            <form id="teacherLoginForm">
                <div class="title-container" style="height:85px;">
                    <h1> Teachers Login</h1>
            <%

Message msg=(Message)session.getAttribute("message");
if(msg !=null){
	%>
	 <label style="color:green; font-weight: bold;  font-size: 15px;"><%= msg.getContent()%></label>
	<%
 session.removeAttribute("message");
}
%>
                    <p>Enter your personal details</p>
                </div>
                <div class="login-inner-content">


                    <div class="input-div one">
                        <div class="i">
                            <i class="far fa-user-circle"></i>
                        </div>
                        <div class="div">
                            <h5>Faculty Name :<strong class="text-danger"style="color:red;">*</strong></h5>
                            <input name="teacherName" type="text" style="color:white;" class="input">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-eye" ></i>
                        </div>
                        
                            <select name="departmentId" class="div "required="">
								<option>-Select Faculty Depertment -</option>
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
                       
                    </div>
                    <div class="input-div one">
                        <div class="i">
                            <i class="far fa-user-circle"></i>
                        </div>
                        <div class="div">
                            <h5>Email Id :<strong class="text-danger" style="color:red;">*</strong></h5>
                            <input name="emailId" style="color:white;" type="email" class="input">
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-eye" onclick="show()"></i>
                        </div>
                        <div class="div">
                            <h5>Password:<strong class="text-danger" style="color:red;">*</strong></h5>
                            <input name="pass" style="color:white;" id="pswrd" type="password" class="input">
                        </div>
                    </div>

                   

                </div>

                <input type="submit" id="teacherLogin"  class="btn" value="Login">

                <input type="submit" id="clearForm" class="btn" value="Clear">

            </form>
        </div>
    </div>
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
        const inputs = document.querySelectorAll(".input");

function addcl(){
    let parent = this.parentNode.parentNode;
    parent.classList.add("focus");
}

function remcl(){
    let parent = this.parentNode.parentNode;
    if(this.value == ""){
        parent.classList.remove("focus");
    }
   
}

inputs.forEach(input => {
    input.addEventListener("focus", addcl);
    input.addEventListener("blur", remcl)
});


// See Password

function show() {
    var pswrd = document.getElementById('pswrd');
    var icon = document.querySelector('.fas');
    if (pswrd.type === "password") {
        pswrd.type = "text";
        icon.style.color = "#4dd8f3";
    } else{
        pswrd.type = "password";
        icon.style.color = "#d9dde4";
    }


}
    </script>
  <script>
  $(document).ready(function () {
	    console.log("Page loaded");
	    $('#teacherLogin').click(function (event) {
	      event.preventDefault();

	      $('#myModal').show();
	      //Calling Loader
	      $(".loader1").show();
	      //Scrolling window to  top 
	      $(window).scrollTop(0);
	      

	      var form = $('#teacherLoginForm')[0];
	      // Create an FormData object 
	      var data = new FormData(form);

	      // disabled the submit button
	      $("#teacherLogin").prop("disabled", true);
	      $.ajax({
	        type: "POST",
	        enctype: 'multipart/form-data',
	        url: "/College_Final_Year_Project/teacherLogin",
	        data: data,
	        processData: false,
	        contentType: false,
	        success: function (data, textStatus, jqXHR) {
	        	  $(".loader1").hide();
	              $('#myModal').hide();
	          if (data.trim().includes(".jsp")) {
	        	  $('#teacherLoginForm')[0].reset();
	        	    window.location.href = data;
	        	 }    
	          else {
	        	  swal("Error", data, "error");
	        	  $("#teacherLogin").prop("disabled", false);
	          }
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	          $(".loader1").hide();
	          $('#myModal').hide();
	          $('#teacherLoginForm')[0].reset();
	          swal("Error", data, "error");
	          $("#teacherLogin").prop("disabled", false);
	        }
	      });
	    }); 
	  });
  
  $('#clearForm').click(function (event) {
      event.preventDefault();
      $('#teacherLoginForm')[0].reset();
  });
  
  
  </script>  
    
</body>
</html>