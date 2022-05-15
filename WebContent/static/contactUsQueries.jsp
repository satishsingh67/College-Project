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
<html>
<head>
<meta charset="ISO-8859-1">
<script src="./lib/jquery.min.js"></script>
<script src="./lib/sweetalert.min.js"></script>
<!-- bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

<title>GNIT</title>
<style>


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

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 5px;
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

td {
	height: 1px;
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
      padding: 20px;
      border: 1px solid skyblue;
      width: 50%;
      height:85%;
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
	height: 35%;
}
    
</style>
</head>
<body>
  <header class="header">
    <nav class="navbar">
 
       <img src="./images/GNIT_Kolkata_logo.png" class="logo">  
        <p style="color:white;font-size:22px;margin-left:40px;">GURU NANAK INSTITUTE OF TECHNOLOGY</p>
       
       <img src="./images/jis1.png" class="logo">  
       <div id="menu-btn" class="fa fa-bars"></div> 
 
    </nav>
 
 </header>

	<H3 style="text-align: center">Contact Us Query</H3>

	<div style="border: 1px solid red; height: 500px; overflow-y: auto;">
		<table id="customers">
			<tr>
			<thead>
				<tr>
				    <th style="text-align: center;">SL No</th>
					<th style="text-align: center;">Name</th>
					<th style="text-align: center;">Email</th>
					<th style="text-align: center;">Mobile No</th>
					<th style="text-align: center;">Question</th>
					<th style="text-align: center;">Answer</th>
					<th style="text-align: center;">Create Date</th>
					<th style="text-align: center;">Update Date</th>
					<th style="text-align: center;">Reply Sent</th>
					<th style="text-align: center;">Action</th>

				</tr>
			</thead>
			<tbody id='Table'>

			</tbody>
		</table>
	</div>

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



  <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Details</h4>
     

      <!-- Modal body -->
     <!-- Modal body -->
      <div class="modal-body">
        
        <label><b style="font-size:15px; text-transform: none;" id="Name" ></b></label>
        <br>
       <label><b style="font-size:15px; text-transform: none;" id="EmailId"></b></label>
       <br>
       <label><b style="font-size:15px; text-transform: none;" id="MobileNumber"></b></label>
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
     
      <input type="submit" id="doubtSubmit"  value="Submit" class="btn btn-primary" >
     
     </div>
         
  </div>
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel" class="btn btn-danger" style="background-color:red;">Close</button>
      </div>
    </div>

</div>
<!-- View Question Paper Modal end -->      
            
  
 
	<script>
	var id;
	 $(document).ready(function () {
          $('#myModal').show();
		  $(".loader1").show();

		 conatctUs();
		 
	 });
	 

	 function myFunction(){
			  $('#Table td').on('click', function () {
  	        	 
  	        	 $('#myModalQuestionPaper').show();

  	        	
  	             var row = $(this).closest('tr');
  	           
  	         
		        id = $(row).find('td').eq(0).html();
				var name = $(row).find('td').eq(2).html();
				var emailId = $(row).find('td').eq(3).html();
				var mobileNo = $(row).find('td').eq(4).html();
				var question=$(row).find('td').eq(5).text();
				var answer=$(row).find('td').eq(6).text();
				
				  $('#Name').text("Name: "+name);
   	            $('#EmailId').text("Email Id : "+emailId);
   	           $('#MobileNumber').text("Contact Number: "+mobileNo);
   	          $('#teacherQuestion').val(question);
   	          if((answer.length)>1){
       	          $('#teacherQuestionAnswer').val(answer);

   	          }
   	          else{
       	          $('#teacherQuestionAnswer').val("");

   	          }
   	             
				
			});
		}

		$('#closeQuestionPaperModel').click(function(event) {
			event.preventDefault();
			$('#myModalQuestionPaper').hide();

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
	        	  form_data.append("action", "contactUs");
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
	            	     conatctUs();
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
		
		 function conatctUs(){
				
	     	 $.ajax({
			      type: "GET",
			      url:"/College_Final_Year_Project/fetch?action=contactUs",
			      success: function (data, textStatus, jqXHR) {
			    	  var JsonData= jQuery.parseJSON(data);
			    	  $('#Table').empty();
			    	 if(JsonData.length==0){
				     $("#Table").html('<tr class="no-records"><td colspan="10" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
			    	 }
			    	 else{
			          $(JsonData).each(function (index, item) {  
			        	
			        	 $('#Table').append(
			        			  '<tr style="height:20px">'+
			        			'<td style="text-align: center;display:none;">'+item.pkId+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.SlNo+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.name+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px; text-transform: none; ">'+item.emailId+'</td>'+
			        			 '<td style="text-align: center;font-size: 15px;">'+item.mobileNumber+'</td>'+
			        			 '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;" readonly id=question'+item.pkId+'>'+item.question+'</textarea></td>'+
 		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;text-transform: none; " readonly  id=answer'+item.pkId+'>'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
			        		       '<td style="text-align: center;font-size: 15px;">'+(item.status)+'</td>'+
			        		     '<td style="text-align: center;"><input type="submit" value="Action" onclick=myFunction()  class="btn btn-primary" id=button'+item.pkId+' ></td>'+
			        		      '</tr>'
			        	  );
			        	  
			        	  
				      });
			    	 }
			    	 $(".loader1").hide();
	                  $('#myModal').hide();
			      },
			      error: function (jqXHR, textStatus, errorThrown) {
		           alert("Sorry Something went wrong while loading Student List.");
			      }
			    });  
			 
			 
		 }
		 

	</script>

</body>
</html>