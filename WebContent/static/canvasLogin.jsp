<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.Message" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="./css/committes.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.1/css/bootstrap.min.css">
   
 <script src="./lib/jquery.min.js"></script>
   <script src="./lib/sweetalert.min.js"></script> 
   

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

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
   padding-top: 20px;
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
   margin: 10px;
}

.link-btn:hover{
   background-color: var(--black);
   color:var(--white);
}
#customers {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    
    #customers td, #customers th {
      border: 2px solid rgb(56, 52, 52);
      padding: 8px;
     
    }
    
    #customers tr:nth-child(odd){background-color: #76fc65;}
    #customers tr:nth-child(even){background-color: #76fc65;}
    
    #customers tr:hover {background-color: rgb(236, 84, 84);}
    
    #customers th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #484ac2;
      color: white;
    }
    .view-btn{
          width: 90px;
          background-color: lightblue;
        }
   
        .container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
  top: 9px;
  left: 9px;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: white;
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
  background: #fff;
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
  width: 90px;
  height: 50px;
}

.header .navbar .logo i {
  color: #2597f4;
}

.header .navbar .links a {
  margin-left: 10rem;
  font-size: 2rem;
  text-transform: capitalize;
  color: #334;
  letter-spacing: 3px;
  font-family: 'Times New Roman', Times, serif;
}

.header .navbar .links a:hover {
  text-decoration: underline;
  color: #2597f4;
}

.header #menu-btn {
  font-size: 3rem;
  cursor: pointer;
  color: #334;
  display: none;
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
<body>
    <header>
        <a href="#" class="logo"><img class="brand1" src="./images/teachers/1200px-JIS_University.svg.png"></i> </a>
    <a href="#" class="logo"><img src="./image/GNIT_Kolkata_logo.png"></i> </a>
        <div class="brand">
            <h2 class="text1 text-center">GURUNANAK INSTITUTE OF TECHNOLOGY</h2> 
        </div>
       
    </header>
             <hr > 
             <main>
                
                <section id="reg" style="background-image: url(./images/background/back7.jpg) ;background-repeat: no-repeat; background-size: cover;">
                    <h1 class="heading">Log In As Canvas<span> Co-ordinator </span> </h1>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets8.lottiefiles.com/packages/lf20_9wpyhdzo.json"  background="transparent"  speed="2"  style="width: 500px; height: 600px;"  loop  autoplay></lottie-player>  </div>
                                <div class="col-md-6">
                                  <form id="canvasLoginForm"  style="border:2px solid skyblue;height:620px;" >
                               	<%
					  Message msg = (Message) session.getAttribute("message");
						if (msg != null) {
						%>
						<label
							style="color: Green; font-weight: bold; font-size: 15px;"><%=msg.getContent()%></label>
						<br>
						<%
						session.removeAttribute("message");
						}
						
						%>
						
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;"> Name:<strong class="text-danger">*</strong></span>
                                            <input type="text" name="name" placeholder="Enter  Name" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Email Id:<strong class="text-danger">*</strong></span>
                                            <input type="email" name="email" placeholder="Enter Email Id " class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Department:<strong class="text-danger">*</strong></span>
                                            <select class="box" name="department"  id="departmentSelect">
                                                <option>--Select Department--</option>
                                              
                                            </select><br>
                                          <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;"> Password:<strong class="text-danger">*</strong></span>
                                            <input type="password" name="password" placeholder="Enter Password" class="box" required>
                                             
                                             
                                            <input type="submit" value="Log In" name="Submit" id="canvasLogin" class="link-btn" style="margin-right: 5px;background-color: black;">
                                            <input type="submit" value="Clear" name="submit" id="acconutCreationClear" class="link-btn"  style="background-color: black;">
                                            
                                        <a href="forgetPassword.jsp" target="_blank" class="link-btn"  style="background-color: black;">Forget Password</a>
                                        
                                   
                                 </form>   
                            </div>
                        </div>
                    </div>
                </section>
             </main>
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
   
       <script>
       
       fetchDropDown("department","departmentSelect");

       
       
        $('#canvasLogin').click(function (event){
  		    event.preventDefault();
  		    
  		$('#myModal').show();
  		//Calling Loader
  		$(".loader1").show();

  		    var form = $('#canvasLoginForm')[0];
  		    // Create an FormData object 
  		    var data = new FormData(form);
  		    data.append("action", "canvasLogin");
  		    // disabled the submit button
  		    $("#canvasLogin").prop("disabled", true);
  		    $.ajax({
  		      type: "POST",
  		      enctype: 'multipart/form-data',
  		      url: "/College_Final_Year_Project/canvas",
  		      data: data,
  		      processData: false,
  		      contentType: false,
  		      success: function (data, textStatus, jqXHR) {
  		        $(".loader1").hide();
  		        $('#myModal').hide();
  		        if (data.trim().includes(".jsp")) {
  		        $('#canvasLoginForm')[0].reset();
        	    window.location.href = data;
  		        }
  		        else {
  		          swal("Error", data, "error");
  		        }
		         
  		        $("#canvasLogin").prop("disabled", false);
  		      },
  		      error: function (jqXHR, textStatus, errorThrown) {
  		        $(".loader1").hide();
  		        $('#myModal').hide();
  		        swal("Error", data, "error");
  		        $("#canvasLogin").prop("disabled", false);
  		      }
  		    });
    });
    
    
    $('#acconutCreationClear').click(function (event){
	    event.preventDefault();
        $('#canvasAccountForm')[0].reset();

    });
    
    function fetchDropDown(action,id){
      	
     	 $.ajax({
     		      type: "GET",
     		      url:"/College_Final_Year_Project/dropdown?action="+action,
     		      success: function (data, textStatus, jqXHR) {
     		    	  var JsonData= jQuery.parseJSON(data);
     		    	 if(JsonData==null){
     		    		 $('#'+id).append(new Option("No Option is Present",""));
     		    	 }
     		    	 else{
     		          $(JsonData).each(function (index, item) {  
     		        	  $('#'+id).append(new Option(item.name.trim(), item.pkId));
     		          }); 
     		    	 }
     		      },
     		      error: function (jqXHR, textStatus, errorThrown) {
     		    	  $('#'+id).append(new Option("No Option is Present",""));
     		      }
     		    });  
     }
     
    
       </script>
              
        
    </body>
</html>