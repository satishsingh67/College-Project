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
.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid blue;
  border-bottom: 16px solid blue;
  width: 50px;
  height: 50px;
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
 </style>
</head>
<body>
    <header>
        <a href="#" class="logo"><img class="brand1" src="./images/teachers/1200px-JIS_University.svg.png"></i> </a>
    <a href="#" class="logo"><img src="./image/GNIT_Kolkata_logo.png"></i> </a>
        <div class="brand">
            <h2 class="text1 text-center">GURUNANAK INSTITUTE OF TECHNOLOGY</h2> 
        </div>
        <header class="header">

          
         
            <nav class="navbar">
         
             
         
               <div class="links" style="margin-left:15%;">
                  <a href="#home">home</a>
                  <a href="#reg">New Teacher Registration</a>
            
                  <a href="#contact">Reply To Teacher</a>
                  <a href="#delete">Delete Account</a>
               </div>
              
               <div id="menu-btn" class="fa fa-bars"></div>
         
            </nav>
         
         </header>
    </header>
    <hr > 
             <main>
                
                <section style="background-image: url(./images/background/back7.jpg) ;background-repeat: no-repeat; background-size: cover;">
                    <h1 class="heading">New Teacher <span>Registration </span> </h1>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-5">
                                <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                                <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_bjyiojos.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player></div>
                            <div class="col-md-7">
                                <form style="border: 1px solid red;height:530px;" >
                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Name:</span>
                                            <input type="text" name="name" placeholder="Enter Teacher Name" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Email:</span>
                                            <input type="email" name="email" placeholder="Enter Teacher Email" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Department:</span>
                                            <select class="box">
                                                <option>Select Department</option>
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
                                        <div class="col-md-6">
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Post:</span>
                                            
                                            <input type="text" name="number" placeholder="enter Teacher Post" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Teacher Mobile no.:</span>
                                            
                                            <input type="text" name="number"  placeholder="enter Teacher Mobile No" class="box" required>
                                            <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Gender</span>
                                                <select class="box">
                                              <option>--Select--</option>
											<option>Male</option>
											<option>Female</option>
											<option>Others</option>

										</select> 
										
										 
									   </div>
									   
									     <div class="col-md-6">
									     <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Joining Date</span>
                                            
                                            <input type="date" name="number"  class="box" required>                                      
									     
									     </div>
									     <div class="col-md-6">
									     <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Password</span>
                                            
                                            <input type="password" name="number"  class="box" required>                                      
									     
									     </div>
                                    </div>
                                    <input type="submit" value="Create" name="submit" id="btn" class="link-btn" style="margin-right: 5px; background-color: black;">
                                    <input type="submit" value="Cancel" name="submit" id="btn" class="link-btn" style="background-color: black;">
                                </div>
                    
                                   
                                 </form>   
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <h1 class="heading"> Reply To <span>Teachers </span> </h1>
                     <!--Table-->
            <div style=" height:350px;width:110%;margin-left:-5%;border:1px solid skyblue; overflow-y: auto;">
            <table id="customers">
           
                 <thead >
                          <th style="text-align:center;">Teacher Name</th>
                          <th style="text-align:center;">Email Id</th>
                          <th style="text-align:center;">Contact Number</th>
                          <th style="text-align:center;">Department Name</th>
                           <th style="text-align:center;">Create Date</th>
                           <th style="text-align:center;">Update Date</th>
                          <th style="text-align:center;">Messege</th>
                          <th style="text-align:center;">Answer</th>
                          <th style="text-align:center;">Reply</th>
                          
                        </thead>                       
                   
            <tbody id='Table'>
          </tbody>
           </table>
           </div>
                </section>
               <section style="background-image: url(./images/background/backg.jpg);background-repeat: no-repeat;background-size: cover;">
                <h1 class="heading" style="color: white;"> Delete  <span>Account </span> </h1>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-6">
                            <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                            <lottie-player src="https://assets10.lottiefiles.com/packages/lf20_nux6g0kx.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player>        </div>
                        <div class="col-md-6">
                          <form  >
                     
                              
                              <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter The  Id To Be Deleted :</span>
                              <input type="text"  placeholder="enter Id" class="box" required>
                              <span style="font-family: 'Times New Roman', Times, serif;font-weight: bold;">Enter Email</span>
                              <input type="text" name="password" placeholder="enter your email" class="box" required>
                              
                              <input type="submit" value="Delete" name="submit" id="btn" class="link-btn" style="margin-right: 5px;background-color: black;"><input type="submit" value="Cancel" name="submit" id="btn" class="link-btn"  style="background-color: black;">
                           </form>   
                      </div>
                    </div>
                </div>
               </section>
             </main>
             
                          <div class="loader" style="margin-top:-55%;margin-left:43%; display:none;" id="myLoader"></div>
             
             
          <script>
          
          $(document).ready(function () {
        	  console.log("Jquery loded");
        	 $('#myLoader').show();
        	  fetchDoubt();
        	  
        	  
        });

        function fetchDoubt(){
        	
        	 $.ajax({
   		      type: "GET",
   		      url:"/College_Final_Year_Project/fetch?action=teacherDoubt",
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
   		        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
   		        			 '<td style="text-align: center;font-size: 15px; text-transform: none; ">'+item.emailId+'</td>'+
   		        			 '<td style="text-align: center;font-size: 15px;">'+item.mobileNumber+'</td>'+
   		        			 '<td style="text-align: center;font-size: 15px;">'+item.departmentName+'</td>'+
   		        		       '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
   		        		         '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
   		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;">'+item.question+'</textarea></td>'+
   		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;">'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
   		        		     '<td style="text-align: center;"><input type="submit" value="Submit" onclick=myFunction()  class="link-btn"></td>'+
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
          
          
          function myFunction(){
        	  
        	  alert("Hii");
        	  
        	  
          }
          
          
          </script>
          
             
             
             
    </body>
    </html>