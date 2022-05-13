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
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="./lib/jquery.min.js"></script>
    <script src="./lib/sweetalert.min.js"></script>
    <title>Admin Panel</title>
<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    color: black;
}

body {
    min-height: 100vh;
}

a {
    text-decoration: none;
}

li {
    list-style: none;
}

h1,
h2 {
    color: #444;
}

h3 {
    color: #999;
}

.btn {
    background: #2f756f;
    color: white;
    padding: 5px 10px;
    text-align: center;
}


.title {
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 15px 10px;
    border-bottom: 2px solid #999;
}

table {
    padding: 10px;
}

th,
td {
    text-align: left;
    padding: 8px;
}

.side-menu {
    position: fixed;
    background: #d8e618;
    width: 20vw;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    letter-spacing: 3px;
}

.side-menu .brand-name {
    height: 10vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.side-menu li {
    font-size: 16px;
    padding: 20px 50px;
    color: rgb(0, 0, 0);
    display: flex;
    align-items: center;
   font-weight: 700;
}

.side-menu li:hover {
    background: white;
    color: #f05462;
}

.container {
    position: absolute;
    right: 0;
    width: 80vw;
    height: 100vh;
    background: #ee300f;
}

.container .header {
    position: fixed;
    top: 0;
    right: 0;
    width: 80vw;
    height: 10vh;
    background: brown;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.container .header .nav {
    width: 90%;
    display: flex;
    align-items: center;
}

.container .header .nav .search {
    flex: 3;
    display: flex;
    justify-content: center;
}

.container .header .nav .search input[type=text] {
    border: none;
    background: #f1f1f1;
    padding: 10px;
    width: 50%;
}

.container .header .nav .search button {
    width: 40px;
    height: 40px;
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
}

.container .header .nav .search button img {
    width: 30px;
    height: 30px;
}

.container .header .nav .user {
    flex: 1;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.container .header .nav .user img {
    width: 40px;
    height: 40px;
}

.container .header .nav .user .img-case {
    position: relative;
    width: 50px;
    height: 50px;
}

.container .header .nav .user .img-case img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.container .content {
    position: relative;
    margin-top: 10vh;
    min-height: 90vh;
    background: #f7f7e8;
}

.container .content .cards {
    padding: 10px 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    background-color: rgb(33, 33, 102);
}

.container .content .cards .card {
    width: 220px;
    height: 150px;
    background:rgb(250, 252, 251);
    margin: 8px 8px;
    display: flex;
    align-items: center;
    justify-content: space-around;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.icon-case{
    color: teal;
   
}
.container .content .content-2 {
    min-height: 60vh;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
    flex-wrap: wrap;
    background-color: cadetblue;
}

.container .content .content-2 .recent-payments {
    min-height: 50vh;
    flex: 5;
    background: white;
    margin: 0 25px 25px 25px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    flex-direction: column;
}

.container .content .content-2 .new-students {
    flex: 2;
    background: white;
    min-height: 50vh;
    margin: 0 25px;
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    display: flex;
    flex-direction: column;
}

.container .content .content-2 .new-students table td:nth-child(1) img {
    height: 40px;
    width: 40px;
}

@media screen and (max-width: 1050px) {
    .side-menu li {
        font-size: 18px;
    }
}

@media screen and (max-width: 940px) {
    .side-menu li span {
        display: none;
    }
    .side-menu {
        align-items: center;
    }
    .side-menu li img {
        width: 40px;
        height: 40px;
    }
    .side-menu li:hover {
        background: #f05462;
        padding: 8px 38px;
        border: 2px solid white;
    }
}

@media screen and (max-width:536px) {
    .brand-name h1 {
        font-size: 16px;
    }
    .container .content .cards {
        justify-content: center;
    }
    .side-menu li img {
        width: 30px;
        height: 30px;
    }
    .container .content .content-2 .recent-payments table th:nth-child(2),
    .container .content .content-2 .recent-payments table td:nth-child(2) {
        display: none;
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

<body>
    <div class="side-menu">
        <div class="brand-name" style="background-color: rgb(255, 255, 255);">
           <a> <img src="./images/GNIT_Kolkata_logo.png"></a>
        </div>
        <ul>
            <li> <i class="fas fa-user-graduate"></i>&nbsp;<a href="./ValidateTableAdmin.jsp" target="_blank"><span>Students</span></a> </li>
            <li> <i class="fas fa-chalkboard-teacher"></i>&nbsp;<a href="./adminteachers.jsp" target="_blank"><span>Teachers</span></a> </li>
            <li><i class="fas fa-chalkboard-teacher"></i>&nbsp;<a href="./adminmentor.jsp" target="_blank"><span>Mentors</span> </a></li>
            <li><i class="fas fa-chalkboard-teacher"></i>&nbsp;<a href="./NewAdmin.jsp" target="_blank"><span>New Admin</span></a> </li>
            
            <li>  <i class="fas fa-cog"></i>&nbsp;<a href="./canvasManagement.jsp" target="_blank"><span>Canvas Management</span></a> </li>
            <li>  <i class="fas fa-cog"></i>&nbsp;<a href="./adminChangePassword.jsp" target="_blank"><span>Change Password</span></a> </li>
            <li>  <i class="fas fa-cog"></i>&nbsp;<a href="./adminAccountDelete.jsp" target="_blank"><span>Delete Account</span></a> </li>
        </ul>
    </div>
    <div class="container">
        <div class="header">
            <div class="nav">
                <div class="search">
                   
                </div>
                <div class="user">
                  <a href="./AdminViewProfile.jsp" target="_blank" class="btn"  style="margin-left:100px;background-color:rgb(30, 30, 68);">Profile</a>
                  <a href="/College_Final_Year_Project/logout?action=admin" class="btn" style="background-color:rgb(30, 30, 68);">LogOut</a>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="cards">
                <div class="card">
                    <div class="box">
                        <h1><a href="./ValidateTableAdmin.jsp" target="_blank" style="color:rgb(13, 14, 14);">Students</a></h1>
                        <h3 style="color: black;">Section</h3>
                    </div>
                    <div class="icon-case">
                        <img src="./fontimg/students.png" style="color: rgb(10, 10, 10);" alt="">
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <h1><a href="./adminteachers.jsp" target="_blank" style="color:rgb(16, 17, 17);">Teachers</a></h1>
                        <h3 style="color: black;">Section</h3>
                    </div>
                    <div class="icon-case">
                        <img src="./fontimg/teachers.png" alt="">
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <h1><a href="./adminmentor.jsp" target="_blank" style="color:rgb(14, 15, 15);">Mentors</a></h1>
                        <h3 style="color: black;">Section</h3>
                    </div>
                    <div class="icon-case">
                        <img src="./fontimg/teachers.png" alt="">
                    </div>
                </div>
                <div class="card">
                    <div class="box">
                        <h1><a href="./adminGrievance.jsp" target="_blank" style="color:rgb(13, 14, 14);">Grievance</a></h1>
                        <h3 style="color: black;">Section</h3>
                    </div>
                    <div class="icon-case">
                        <img src="./fontimg/school.png" alt="" style="background-color: rgb(216, 85, 107);">
                    </div>
                </div>
                  <div class="card">
                    <div class="box">
                        <h1><a href="./contactUsQueries.jsp" target="_blank" style="color:rgb(13, 14, 14);">Contact Us</a></h1>
                        <h3 style="color: black;">Section</h3>
                    </div>
                    <div class="icon-case">
                        <img src="./fontimg/school.png" alt="" style="background-color: rgb(216, 85, 107);">
                    </div>
                </div>
            </div>
            <div class="content-2">
                <div class="recent-payments">
                    <div class="title">
                        <h2 id="update">Update Information</h2>
                       
                    </div>
                    <table>
                        <tr>
                            <th style="text-align:center;">Information</th>
                            <th style="text-align:center;">Choose File</th>
                            
                           <th style="text-align:center;">Message</th>
                            <th style="text-align:center;">Select Gallery File Type</th>
                            <th style="text-align:center;">Upload</th>
                        </tr>
                        <tbody id="Table">
                       
                        <tr>
                            <td style="text-align:center;">Post Notice</td>
                            <td style="text-align:center;"><input id="noticeFile" type="file"></td>
                             <td style="text-align:center;"><input id="noticeText" type="text"></td>
                          <td style="text-align:center;">--</td>
                         <td style="text-align:center;"><button type="button" id="postNoticeButton" class="btn btn-primary">Post</button></td>
                        </tr>
                        <tr >
                            <td style="text-align:center;">Update Gallery</td>
                            <td style="text-align:center;"><input id="galleryFile" type="file"></td>
                         <td style="text-align:center;">--</td>
                         <td style="text-align:center;">
                               <select id="galleryType">
                                <option>Select Type</option>
                                   <option value="culturalFest">Cultural Fest</option>
                                   <option value="techFest">Tech Fest</option>
                                   <option value="college">College</option>
                                   <option value="video">Video</option>  
                                   <option value="hostel">Hostel</option>
                                   <option value="other">Others</option>
                               </select>
                           </td>
                           
                         <td style="text-align:center;"><button type="button" id="postGalleryButton" class="btn btn-primary">Post</button></td>
                        </tr>
                        <tr>
                            <td style="text-align:center;">Post Exam Schedule</td>
                            <td style="text-align:center;"><input id="examFile" type="file"></td>
                           <td style="text-align:center;"><input  id="examText" type="text"></td>
                           <td style="text-align:center;">--</td>
                            <td style="text-align:center;"><button type="button" id="postExamButton" class="btn btn-primary">Post</button></td>
                        </tr>
                        <tr >
                            <td style="text-align:center;">Post  PopUp</td>
                            <td style="text-align:center;"><input id="popUpFile"  type="file"></td>
                          <td style="text-align:center;"> <input id="popUpText" type="text"></td>
                           <td style="text-align:center;">--</td>
                         <td style="text-align:center;"><button type="button" id="postPopUpButton" class="btn btn-primary">Post</button></td>
                          </tr>
                        
                        </tbody>
                    </table>
                </div>
            
            </div>
        </div>
    </div>
  
  
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
   
   
  
  
  
<script>



$('#postNoticeButton').click(function (event){
		event.preventDefault();
		uploadInformation("postNoticeButton","noticeFile","noticeText","notice");
});



$('#postExamButton').click(function (event){
		event.preventDefault();
		uploadInformation("postExamButton","examFile","examText","examSchedule");
	});

$('#postPopUpButton').click(function (event){
		event.preventDefault();
		uploadInformation("postPopUpButton","popUpFile","popUpText","popUp");
	});



function uploadInformation(buttonId,file,text,action){
	  $("#"+buttonId).prop("disabled",true);
	    $('#myModal').show();
	  $(".loader1").show();
	  
	  var text1=$("#"+text).val();
     	  var form_data = new FormData(); // Creating object of FormData class
     	  form_data.append("file",  $('#'+file).prop("files")[0]); // Appending parameter named file with properties of file_field to form_data
     	  form_data.append("text", text1); // Adding extra parameters to form_data
     	  form_data.append("action",action);
     	  $.ajax({
     		  type: "POST",
               enctype: 'multipart/form-data',
               url: "/College_Final_Year_Project/update",
               data: form_data,
               processData: false,
               contentType: false,
               success: function(data,textStatus,jqXHR){
             	  $(".loader1").hide();
                   $('#myModal').hide();
             	  if(data.trim().includes('Successfully')){
             	   swal("Done", data, "success");
             	  $('#'+file).val("");
             	 $('#'+text).val("");
             	  }else{
             		  swal("Error",data,"error");
             	  }
             	 $("#"+buttonId).prop("disabled",false);
                 },
               error:function(jqXHR,textStatus,errorThrown){
             	  $(".loader1").hide();
                   $('#myModal').hide();
                   swal("Error",textStatus,"error");
                   $("#"+buttonId).prop("disabled",false);

               }
     	  }); 
       }
  
$('#postGalleryButton').click(function (event){
	event.preventDefault();

	 $('#postGalleryButton').prop("disabled",true);
	    $('#myModal').show();
	  $(".loader1").show();
	  
	  var type=$("#galleryType").val();
  	  var form_data = new FormData(); // Creating object of FormData class
  	  form_data.append("file",  $('#galleryFile').prop("files")[0]); // Appending parameter named file with properties of file_field to form_data
  	 form_data.append("fileType",type);
  	  form_data.append("action","galleryType");
  	  $.ajax({
  		  type: "POST",
            enctype: 'multipart/form-data',
            url: "/College_Final_Year_Project/update",
            data: form_data,
            processData: false,
            contentType: false,
            success: function(data,textStatus,jqXHR){
          	  $(".loader1").hide();
                $('#myModal').hide();
          	  if(data.trim().includes('Successfully')){
          	   swal("Done", data, "success");
          	  $('#galleryFile').val("");
          	 $("#galleryType").val("Select Type");
          	  }else{
          		  swal("Error",data,"error");
          	  }
          	 $('#postGalleryButton').prop("disabled",false);
              },
            error:function(jqXHR,textStatus,errorThrown){
          	  $(".loader1").hide();
                $('#myModal').hide();
                swal("Error",textStatus,"error");
                $('#postGalleryButton').prop("disabled",false);

            }
  	  }); 



});

</script>
</body>

</html>