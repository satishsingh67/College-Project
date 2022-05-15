<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.CanvasAccount" %>
<%

CanvasAccount canvasAccount=(CanvasAccount)session.getAttribute("canvas");
if(canvasAccount==null){
	response.sendRedirect("canvasLogin.jsp");
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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">
   
   
    <script src="./lib/jquery.min.js"></script>
    <script src="./lib/sweetalert.min.js"></script>
    
    <style>
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
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }
    th {
	position: sticky;
	top: 0px;
	height: 10px;
}
    .view-btn{
          width: 100px;
          height:40px;
          background-color: skyblue;
        }
   
        .heading {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.heading span {
  color: #2597f4;
}

.btn {
  display: inline-block;
  margin-top: 1rem;
  padding: 1rem 3rem;
  cursor: pointer;
  background: #fff;
  font-size: 1.7rem;
  text-transform: capitalize;
  color: #334;
  border: 0.2rem solid #334;
}

.btn:hover {
  background: #2597f4;
  border-color: #2597f4;
  color: #fff;
}

.header .contact-info {
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
  background: #39b32e;
}

.header .contact-info p {
  font-size: 1.5rem;
  color: #fff;
}

.header .contact-info p i {
  padding-right: 0.5rem;
  color: yellow;
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
  background: rgb(25, 122, 167);
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
  width: 130px;
  height: 60px;
}

.header .navbar .logo i {
  color: #2597f4;
}

.header .navbar .links a {
  margin-left: 2rem;
  font-size: 2rem;
  text-transform: capitalize;
  color: rgb(254, 254, 255);
}

.header .navbar .links a:hover {
  text-decoration: underline;
  color: #eefa41;
}

.header #menu-btn {
  font-size: 3rem;
  cursor: pointer;
  color: #334;
  display: none;
}

.home {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  gap: 3rem;
}

.home .image {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .image img {
  width: 50%;
}

.home .content {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .content h3 {
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.home .content p {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding: 1rem 0;
}
section {
  padding: 5rem 10%;
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

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
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
.modalLoader {
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
.modal-content-loader {
	background-color: #fefefe;
	margin: auto;
	margin-top: 10%;
	padding: 20px;
	border: 1px solid #888;
	width: 35%;
	height: 30%;
}

    </style>
    
    <title>Canvas Management </title>
</head>
<body>
  <header class="header">
    <nav class="navbar">
 
       <img src="./images/GNIT_Kolkata_logo.png" class="logo">  
        <p style="color:white;font-size:22px;">GURU NANAK INSTITUTE OF TECHNOLOGY</p>
       <div style="width:350px;margin-left:40px;">
                   <a href="chnagePasswordCanvas.jsp" target="_blank" style="color:red;"><p style="font-size:20px;margin-left:70px;">Change Password</p></a>
          <a href="/College_Final_Year_Project/logout?action=canvas" style="color:red;"><p style="font-size:20px;margin-left:250px;margin-top:-45px;">Logout</p></a>
       </div>
       <img src="./images/jis1.png" class="logo">  
       <div id="menu-btn" class="fa fa-bars"></div>
 
    </nav>
 
 </header>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">
 <div class="content" style="margin-top:-110px;height:140px;">
<p style="color:black">Id: <%=canvasAccount.getPkId() %></p>
<p style="color:black; margin-top:-65px;">Name: <%=canvasAccount.getName() %></p>
<p style="color:black;margin-top:-65px;">Email Id: <%=canvasAccount.getEmailId()%></p>
<p style="color:black;margin-top:-65px;">Department: <%=canvasAccount.getDepartmentLongName() %></p>


 </div>

</section>
  <section style="height:200px;">
  <div style="margin-top:-75px;margin-left:-110px;width:120%;height:350px;overflow-y:auto;">
    <table id="customers">
      <thead >
       <th style="text-align:center;">Sl.No</th>
        <th style="text-align:center;">Name</th>
        <th style="text-align:center;">Relation with College</th>
         <th style="text-align:center;">Person Id</th>
        <th style="text-align:center;">Department</th>
        <th style="text-align:center;">Post Type</th>
        <th style="text-align:center;">Title</th>
        <th style="text-align:center;">File Type</th>
         <th style="text-align:center;">Create Date</th>
          <th style="text-align:center;">Update Date</th>
        <th style="text-align:center;">Status</th>
        <th style="text-align:center;">View</th>
        <th style="text-align:center;">Accept</th>
        <th style="text-align:center;">Reject</th>
        
      </thead>
     <tbody id="Table">
     
     
     </tbody>
    </table>
  
  </div>
   
  </section>
  
  
  <div class="loader2" style="margin-top:-10%;margin-left:45%;display: none;" id="myLoader"></div>
  
  <div id="myModal" class="modalLoader">

		<!-- Modal content -->
		<div class="modal-content-loader">
			<div class="loader1" style="display: none;">
				<div class="loader"
					style="margin: auto; margin-left: 40%; margin-top: 10%;"></div>

				<h4
					style="margin: auto; margin-left: 30%; margin-top: 0%; color: rgb(30, 169, 224); letter-spacing: 5px; padding: 10px; font-size: 20px;">
					Please wait....</h4>
			</div>
		</div>

	</div>
  
<script>
$(document).ready(function () {
	$('#myLoader').show();
	
	fetchFiles();

});

function fetchFiles(){
	
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/canvas?action=fetchAllFiles",
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	    	  $('#Table').empty();
	    	 if(JsonData.length==0){
		     $("#Table").html('<tr class="no-records"><td colspan="9" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
	    		$('#myLoader').hide();
	    	 }
	    	 else{
	          $(JsonData).each(function (index, item) {  
	        	
	        	 $('#Table').append(
	        			  '<tr style="height:20px">'+
	        			'<td style="text-align: center;display:none;">'+item.pkId+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.SlNo+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.personType+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.collegeId+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.departmentName+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.postType+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;"><textarea name="title" readonly style="font-size: 15px; border: 2px solid skyblue;text-transform: none;  width:200px;"  cols="50" rows="5">'+(item.title==null?" ":item.title)+'</textarea></td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.fileType+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+(item.updateDate==null?" ":item.updateDate)+'</td>'+
	        			 '<td style="text-align: center;font-size: 15px;">'+item.status+'</td>'+
	        			 '<td style="text-align: center;"><a href="'+item.filePath+'" target="_blank" class="view-btn"  >View</a></td>'+
	        		     '<td style="text-align: center;">'+(item.status=="Approved"?'<input type="submit" value="Approve" onclick=myFunction() disabled class="view-btn" id=button >':'<input type="submit" value="Approve" onclick=myFunction('+item.pkId+')  class="view-btn" >')+'</td>'+
	        		     '<td style="text-align: center;">'+(item.status=="Rejected"?'<input type="submit" value="Reject" onclick=myFunction1() disabled class="view-btn" id=button >':'<input type="submit" value="Reject" onclick=myFunction1('+item.pkId+')  class="view-btn"  >')+'</td>'+
	        		      '</tr>'
	        	  );
	        	  
	        	  
		      });
	    		$('#myLoader').hide();

	    	 }
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
	    		$('#myLoader').hide();
          alert("Sorry Something went wrong while loading.");
      
	      }
	    });  
}


function myFunction(id){
	changeStatus("Approved",id);
}
function myFunction1(id){
	
	changeStatus("Rejected",id);
	
}

function changeStatus(action,id){
		 $(".loader1").show();
       $('#myModal').show();
  	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/canvas?action=changeStatus&action1="+action+"&id="+id,
		      success: function (data, textStatus, jqXHR) {
		    	  $(".loader1").hide();
		        $('#myModal').hide();
		        if (data.trim().includes("Successfully")) {
		          swal("Done", data, "success");
		        }
		        else {
		          swal("Error", data, "error");
		        }
		        fetchFiles();
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
		    	  $(".loader1").hide();
			        $('#myModal').hide();
		    	  swal("Error", errorThrown, "error");
		    	  fetchFiles();
		 		
		      }
		    });  
}


</script>

</body>
</html>





