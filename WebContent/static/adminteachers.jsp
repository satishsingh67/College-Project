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
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 5px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
  font-size:17px;
}

  
   th {
	position: sticky;
	top: 0px;
	height: 10px;
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
  margin-left: 5rem;
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
      margin-top: 5%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 50%;
      height: 85%;
    }
    .modalViewQuestionPaper1 {
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
    .modal-contentViewQuestionPaper1 {
      background-color: #fefefe;
      margin: auto;
      margin-top: 5%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 35%;
      height: 30%;
    }
 </style>
</head>
<body>
    <header>
        <a href="#" class="logo"><img class="brand1" src="./images/jis1.png"></i> </a>
    <a href="#" class="logo"><img src="./image/GNIT_Kolkata_logo.png"></i> </a>
        <div class="brand">
            <h2 class="text1 text-center">GURU NANAK INSTITUTE OF TECHNOLOGY</h2> 
        </div>
        <header class="header">

          
         
            <nav class="navbar">
         
             
         
               <div class="links" style="margin-left:-5%;">
                  <a href="adminpage.jsp" >Home</a>
                  <a href="#RegTeacher" >New Teacher Registration</a>
                  <a href="#ReplyTeacher">Reply To Teacher</a>
              <a href="#upgradeTeacher"  >Upgrade Teacher Designation</a>
                  
                  <a href="#Delete" style="font-size:20px;">Delete Account</a>
               </div>
              
               <div id="menu-btn" class="fa fa-bars"></div>
         
            </nav>
         
         </header>
    </header>
    <hr > 
             <main>
                
                <section style="background-image: url(./images/background/back7.jpg) ;background-repeat: no-repeat; background-size: cover;">
                    <h1 class="heading">New Teacher <span>Registration </span> </h1>
                    <div id="RegTeacher" class="col-md-12">
                        <div class="row">
                            <div class="col-md-5">
                                <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                                <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_bjyiojos.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player></div>
                            <div class="col-md-7">
                                <form id="teacherAccountForm" style="border: 1px solid red;height:530px;" >
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Name:<strong class="text-danger">*</strong></span>
                                            <input type="text" name="name" placeholder="Enter Teacher Name" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Email:<strong class="text-danger">*</strong></span>
                                            <input type="email" name="email" placeholder="Enter Teacher Email" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Department:<strong class="text-danger">*</strong></span>
                                            <select name="department" id="departmentSelect" class="box">
                                                <option>--Select Department--</option>
											
										</select>
                                        </div>
                                        <div class="col-md-6">
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Designation:<strong class="text-danger">*</strong></span>
                                             <select name="post" id="designationSelect" class="box">
                                                <option>--Select Designation--</option>
											
										</select>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Mobile no.:<strong class="text-danger">*</strong></span>
                                            
                                            <input type="text" name="mobileNumber"  placeholder="enter Teacher Mobile No" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Gender<strong class="text-danger">*</strong></span>
                                                <select name="gender" class="box">
                                              <option>--Select--</option>
											<option>Male</option>
											<option>Female</option>
											<option>Others</option>

										</select> 
										
										 
									   </div>
									   
									     <div class="col-md-6">
									     <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Joining Date<strong class="text-danger">*</strong></span>
                                            
                                            <input type="date"  name="joiningDate"  class="box" required>                                      
									     
									     </div>
									     <div class="col-md-6">
									     <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Password<strong class="text-danger">*</strong></span>
                                            
                                            <input type="password" name="password"  class="box" required>                                      
									     
									     </div>
                                    </div>
                                    <input type="submit" value="Create" name="submit" id="teacherAccountButton" class="link-btn" style="margin-right: 5px; background-color: black;">
                                    <input type="submit" value="Clear" name="submit" id="clearButton" class="link-btn" style="background-color: black;">
                                </div>
                    
                                   
                                 </form>   
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <h1 class="heading"> Reply To <span>Teachers </span> </h1>
                     <!--Table-->
            <div id="ReplyTeacher" style=" height:350px;width:110%;margin-left:-5%;border:1px solid skyblue; overflow-y: auto;">
            <table id="customers">
           
                 <thead >
                          <th style="text-align:center;">Teacher Name</th>
                          <th style="text-align:center;">Email Id</th>
                          <th style="text-align:center;">Contact Number</th>
                          <th style="text-align:center;">Department Name</th>
                           <th style="text-align:center;">Create Date</th>
                           <th style="text-align:center;">Update Date</th>
                          <th style="text-align:center;">Message</th>
                          <th style="text-align:center;">Answer</th>
                          <th style="text-align:center;">Reply</th>
                          
                        </thead>                       
                   
            <tbody id='Table'>
          </tbody>
           </table>
           </div>
                </section>
                
                   <section>
                    <h1 class="heading"> Upgrade Teacher <span>Profile </span> </h1>
                     <!--Table-->
            <div id="upgradeTeacher" style=" height:350px;width:110%;margin-left:-5%;border:1px solid skyblue; overflow-y: auto;">
            <table id="customers">
           
                 <thead >
                             <th style="text-align:center;">Sl.No</th>
                          <th style="text-align:center;">Teacher Name</th>
                           <th style="text-align:center;">Email Id</th>
                          <th style="text-align:center;">Department Name</th>
                           <th style="text-align:center;">Designation</th>
                           <th style="text-align:center;">Update Date</th>
                          <th style="text-align:center;">Update</th>
                          
                        </thead>                       
                   
            <tbody id='upgradeTable'>
          </tbody>
           </table>
           </div>
                </section> 
                
                
               <section style="background-image: url(./images/background/backg.jpg);background-repeat: no-repeat;background-size: cover;">
                <h1 class="heading" style="color: white;"> Delete  <span>Account </span> </h1>
                <div id="Delete" class="col-md-12">
                    <div class="row">
                        <div  class="col-md-6">
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_nux6g0kx.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player>        </div>
                        <div class="col-md-6">
                          <form id="deleteAccountForm"  style="border:1px solid red;height:300px;">
                     
                              
                              <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter The  Id To Be Deleted :<strong class="text-danger">*</strong></span>
                              <input type="text" name="id"  placeholder="enter Id" class="box" required>
                              <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter Email:<strong class="text-danger">*</strong></span>
                              <input type="text" name="email" placeholder="enter your email" class="box" required>
                              
                              <input type="submit" value="Delete" name="submit" id="delteAccount" class="link-btn" style="margin-right: 5px;background-color: black;">
                              <input type="submit" value="Clear" name="submit" id="delteAccountClear" class="link-btn"  style="background-color: black;">
                           </form>   
                      </div>
                    </div>
                </div>
               </section>
             </main>
             
                          <div class="loader2" style="margin-top:-85%;margin-left:43%;" id="myLoader"></div>
                                       <div class="loader2" style="margin-top:27%;margin-left:43%; " id="myLoader1"></div>
             
            
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
            
      <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Doubt and Reply</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
        <label><b style="font-size:15px; text-transform: none;" id="teacherName" ></b></label>
        <br>
       <label><b style="font-size:15px; text-transform: none;" id="teacherEmailId">Email id:</b></label>
       <br>
       <label><b style="font-size:15px; text-transform: none;" id="teacherMobileNumber">Contact Number:</b></label>
        <br>
 
        <div style="width:100px;margin-top:50px;">
        
               <label ><b style="font-size:15px; text-transform: none;" >Question:</b></label>       
        
        
        </div> 
 
       <textarea name="doubtQuestion" readonly placeholder="Question" id="teacherQuestion" style="margin-left:120px;margin-top:-70px;width:70%;font-size:15px;border:2px solid skyblue; text-transform: none;"  cols="50" rows="5"></textarea>
       <br>
       <br>
       
       
        <div style="width:100px;margin-top:50px;">
        
               <label ><b style="font-size:15px; text-transform: none;" >Answer:<strong class="text-danger">*</strong></b></label>       
        
        
        </div> 
 
       <textarea name="doubtAnswer"  placeholder="Answer" id="teacherQuestionAnswer" style="margin-left:120px;margin-top:-70px;width:70%;font-size:15px;border:2px solid skyblue; text-transform: none;"  cols="50" rows="5"></textarea>   
         <div>
     
      <input type="submit" id="doubtSubmit"  value="Submit" class="link-btn" >
     
     </div>
         
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel" class="link-btn" style="background-color:red;">Close</button>
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->      
            
             
             
        <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper1"  id="myModalQuestionPaper1">
    <div class="modal-contentViewQuestionPaper1">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">Update Teacher Designation</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
    
    
     <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;font-size:20px;">Teacher Designation:<strong class="text-danger">*</strong></span>
                                             <select name="post" id="designationSelect1" class="box" style="width:250px;font-size:15px;">
                                                <option>--Select Designation--</option>
											
										</select>
    <br><br>
         <div >
     
      <input type="submit" id="designationSubmit"  value="Submit" class="link-btn" style="margin-left:100px;">
             <button type="button" id="closeQuestionPaperModel1" class="link-btn" style="background-color:red;">Close</button>
     
     </div>
         
  </div>
    </div>
</div>
<!-- View Question Paper Modal end -->              
             
             
             
             
          <script>
          
          var id;
          
          $(document).ready(function () {
        	    
       fetchDropDown("department","departmentSelect");
       fetchDropDown("teacherDesignation","designationSelect");
       fetchDropDown("teacherDesignation","designationSelect1");
       	

        	  fetchDoubt();
        	 fetchTeacherWithDesignation();
	        

        });

        
          
          
          function myFunction(){
        	  
        		
     	         $('#Table td').on('click', function () {
     	        	 
     	        	 $('#myModalQuestionPaper').show();

     	        	
     	             var row = $(this).closest('tr');
     	           
     	              id = $(row).find('td').eq(0).html();
     	            var name = $(row).find('td').eq(1).html();
     	           var  emailId= $(row).find('td').eq(2).html();
     	          var mobileNumber = $(row).find('td').eq(3).html();
     	         var question=$('#question'+id).val();
     	             var answer=$('#answer'+id).val();

     	             $('#teacherName').text("Teacher Name: "+name);
     	            $('#teacherEmailId').text("Email Id : "+emailId);
     	           $('#teacherMobileNumber').text("Contact Number: "+mobileNumber);
     	          $('#teacherQuestion').val(question);
     	          if((answer.length)>1){
         	          $('#teacherQuestionAnswer').val(answer);
  
     	          }
     	          else{
         	          $('#teacherQuestionAnswer').val("");

     	          }
     	             
     	            
     	        }); 
        	
          }
          
          $('#closeQuestionPaperModel').click(function (event){
  			event.preventDefault();
  			 $('#myModalQuestionPaper').hide();
  		});
          $('#closeQuestionPaperModel1').click(function (event){
    			event.preventDefault();
    			 $('#myModalQuestionPaper1').hide();
    		});
                  
          
          $('#doubtSubmit').click(function (event){
    			event.preventDefault();
    			
    			var answer= $('#teacherQuestionAnswer').val();
    			send(id,answer);
    		});
          
          
          
          function send(id,answer){
        	  $("#doubtSubmit").prop("disabled",true);
        	  $('#myModalQuestionPaper').hide();
        	    $('#myModal').show();
        	  $(".loader1").show();
        	console.log(answer.trim().length);
 	          if(answer.trim().length==0){
 	        	  $(".loader1").hide();
 	               $('#myModal').hide();
 	        	  alert("Please Answer the question");
 	      $("#doubtSubmit").prop("disabled",false);
 	     $('#myModalQuestionPaper').show();
 	          }
 	        else{
 	        	  var form_data = new FormData(); // Creating object of FormData class
 	        	  form_data.append("id", id); // Appending parameter named file with properties of file_field to form_data
 	        	  form_data.append("answer", answer); // Adding extra parameters to form_data
 	        	  form_data.append("action", "teacherDoubtAnswer");
 	        	  $.ajax({
 	        		  type: "POST",
 	                  enctype: 'multipart/form-data',
 	                  url: "/College_Final_Year_Project/fetch",
 	                  data: form_data,
 	                  processData: false,
 	                  contentType: false,
 	                  success: function(data,textStatus,jqXHR){
 	                	  $(".loader1").hide();
 	                      $('#myModal').hide();
 	                	  if(data.trim().includes('Successfully')){
 	                	   swal("Done", data, "success");
 	                	  
 	                	  }else{
 	                		  swal("Error",data,"error");
 	                	  }
 	                	 $("#doubtSubmit").prop("disabled",false);
 	            	     $('#myModalQuestionPaper').show();
 	            	    fetchDoubt();
 	                    },
 	                  error:function(jqXHR,textStatus,errorThrown){
 	                	  $(".loader1").hide();
 	                      $('#myModal').hide();
 	                      swal("Error",data,"error");
 	                     $("#doubtSubmit").prop("disabled",false);
 	            	     $('#myModalQuestionPaper').show();

 	                  }
 	        	  }); 
 	          }
          }
          
          function fetchDoubt(){
          	
         	 $.ajax({
    		      type: "GET",
    		      url:"/College_Final_Year_Project/fetch?action=teacherDoubt",
    		      success: function (data, textStatus, jqXHR) {
    		    	  var JsonData= jQuery.parseJSON(data);
    		    	  $('#Table').empty();
    		    	 if(JsonData.length==0){
    			     $("#Table").html('<tr class="no-records"><td colspan="9" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
    		    	 }
    		    	 else{
    		          $(JsonData).each(function (index, item) {  
    		        	  
    		        
    		        	 $('#Table').append(
    		        			  '<tr style="height:20px">'+
    		        			'<td style="text-align: center;display:none;">'+item.pkId+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px; text-transform: none; ">'+item.emailId+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.mobileNumber+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.departmentName+'</td>'+
    		        		       '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
    		        		         '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
    		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;" readonly id=question'+item.pkId+'>'+item.question+'</textarea></td>'+
    		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;text-transform: none; " readonly  id=answer'+item.pkId+'>'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
    		        		     '<td style="text-align: center;"><input type="submit" value="Reply" onclick=myFunction()  class="link-btn" id=button'+item.pkId+' ></td>'+
    		        		      '</tr>'
    		        	  );
    		        	  
    		        	  
    			      });
    		    	 }
    		  	 $('#myLoader').hide();
    		      },
    		      error: function (jqXHR, textStatus, errorThrown) {
    	           alert("Sorry Something went wrong while loading doubt history.");
    		      }
    		    });  
                }  
  
          
          $('#delteAccount').click(function (event){
  			event.preventDefault();
  				
  			$('#myModal').show();
    		//Calling Loader
    		$(".loader1").show();

    		    var form = $('#deleteAccountForm')[0];
    		    // Create an FormData object 
    		    var data = new FormData(form);
    		    data.append("action", "teacherAccountDelete");
    		    // disabled the submit button
    		    $("#delteAccount").prop("disabled", true);
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
    		          $('#deleteAccountForm')[0].reset();
    		        }
    		        else {
    		          swal("Error", data, "error");
    		        }
  		        
    		        $("#delteAccount").prop("disabled", false);
    		      },
    		      error: function (jqXHR, textStatus, errorThrown) {
    		        $(".loader1").hide();
    		        $('#myModal').hide();
    		        swal("Error", data, "error");
    		        $("#delteAccount").prop("disabled", false);
    		      }
    		    });
  		});
          
           
          $('#teacherAccountButton').click(function (event){
        		    event.preventDefault();
        		    
        		$('#myModal').show();
        		//Calling Loader
        		$(".loader1").show();

        		    var form = $('#teacherAccountForm')[0];
        		    // Create an FormData object 
        		    var data = new FormData(form);
        		    data.append("action", "teacherAccount");
        		    // disabled the submit button
        		    $("#teacherAccountButton").prop("disabled", true);
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
          		          $('#teacherAccountForm')[0].reset();

        		        }
        		        else {
        		          swal("Error", data, "error");
        		        }
        		        $("#teacherAccountButton").prop("disabled", false);
        		      },
        		      error: function (jqXHR, textStatus, errorThrown) {
        		        $(".loader1").hide();
        		        $('#myModal').hide();
        		        swal("Error", data, "error");
        		        $("#teacherAccountButton").prop("disabled", false);
        		      }
        		    });
          });
          
          
          $('#clearButton').click(function (event){
  		    event.preventDefault();
	          $('#teacherAccountForm')[0].reset();

          });
          $('#delteAccountClear').click(function (event){
    		    event.preventDefault();
  	          $('#deleteAccountForm')[0].reset();

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

  
    //Teacher Designation upgrade
    
    
    function fetchTeacherWithDesignation(){
          	
         	 $.ajax({
    		      type: "GET",
    		      url:"/College_Final_Year_Project/fetch?action=teacherDesignation",
    		      success: function (data, textStatus, jqXHR) {
    		    	  var JsonData= jQuery.parseJSON(data);
    		    	  $('#upgradeTable').empty();
    		    	 if(JsonData.length==0){
    			     $("#upgradeTable").html('<tr class="no-records"><td colspan="7" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
    		    	 }
    		    	 else{
    		          $(JsonData).each(function (index, item) {  
    		        	  
    		        
    		        	 $('#upgradeTable').append(
    		        			  '<tr style="height:20px">'+
    		        			'<td style="text-align: center;">'+item.SlNo+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px; text-transform: none; ">'+item.emailId+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.departmentName+'</td>'+
    		        			 '<td style="text-align: center;font-size: 15px;">'+item.designation+'</td>'+
    		        		         '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
    		        		     '<td style="text-align: center;"><input type="submit" value="Update" onclick=myFunction1('+item.pkId+')  class="link-btn" id=button'+item.pkId+' ></td>'+
    		        		      '</tr>'
    		        	  );
    		        	  
    		        	  
    			      });
    		    	 }
    		  	 $('#myLoader1').hide();
    		      },
    		      error: function (jqXHR, textStatus, errorThrown) {
    	           alert("Sorry Something went wrong while loading teacher details.");
    		      }
    		    });  
                }  
          
    var desgTeacher;
    
    function myFunction1(id){
 $('#myModalQuestionPaper1').show();
 desgTeacher=id;
    }
          
    
    
    
 $('#designationSubmit').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper1').hide();

		$('#myModal').show();
		//Calling Loader
		$(".loader1").show();

		
	   var value= $('#designationSelect1').val();

		    // Create an FormData object 
		    var data = new FormData();
		    data.append("action", "teacherDesignationUpgrade");
		    data.append("id", desgTeacher);
		    data.append("value",value);
		    
		    // disabled the submit button
		    $("#designationSubmit").prop("disabled", true);
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
		          $('#designationSelect1').val("--Select Designation--");
		          fetchTeacherWithDesignation();
		        }
		        else {
		          swal("Error", data, "error");
		        }
		        $('#myModalQuestionPaper1').show();

		        $("#designationSubmit").prop("disabled", false);
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
		        $(".loader1").hide();
		        $('#myModal').hide();
		        swal("Error", data, "error");
		        $("#designationSubmit").prop("disabled", false);
		        $('#myModalQuestionPaper1').show();

		      }
		    });
	});
   
          </script>
          
             
             
             
    </body>
    </html>
    
