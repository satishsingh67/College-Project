<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.model.TeacherDetails" %>
<%@page import="com.college.model.MapTeacherSubject" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.college.teacher.dao.MapTeacherSubjectDao" %>
<%@page import="com.college.teacher.dao.TeacherLoginCheck" %>
<%
TeacherDetails teacher=(TeacherDetails)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect("teacherLogin.jsp");
	return;
}
Integer fkTeacherPkId=teacher.getPkTeacherId();
Integer fkDepartment=teacher.getFkdepartment();

//Subject List
Map<String,Object> subjectList=new MapTeacherSubjectDao().getAllSubjects(fkTeacherPkId,fkDepartment);
List<MapTeacherSubject> subjects=(List<MapTeacherSubject>)subjectList.get("subjects");
Integer notesCount=new MapTeacherSubjectDao().getTotalNotes(fkTeacherPkId, null, null, null, null, "total");

String image=new TeacherLoginCheck().fetchTeacherPhoto(fkTeacherPkId);

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Teacher page</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/teacherpage.css">
<script src="./lib/jquery.min.js"></script>
    <link rel="stylesheet" href="css/studentLabCSS.css">
   <script src="./lib/sweetalert.min.js"></script> 
</head>
<body>
   
<!-- header section starts  -->

<header class="header">

   <nav class="navbar">

      <img src="./images/GNIT_Kolkata_logo.png" class="logo">  

      <div class="links">
         <a href="#home">home</a>
         <a href="#about">Information</a>
         <a href="#classes">Classes</a>
         
         
         <a href="#contact">Contact Admin</a>
         <a href="changePasswordTeacher.jsp" target="_blank">Change Password</a>
         <a href="teacherUpdateProfile.jsp" target="_blank">Update Profile</a>
         <a href="/College_Final_Year_Project/logout?action=teacher" class="nav__link">Logout</a>
         
      </div>
      <img src="./images/teachers/1200px-JIS_University.svg.png" class="logo">  
      <div id="menu-btn" class="fa fa-bars"></div>

   </nav>

</header>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">

  <div class="image">
 <%
 if(image!=null){
 %>
   <img class="logo" src="data:image/jpg;base64,<%=image %>" style="margin-top:10%;margin-left:20%;width:50%; height:60%"> 
	<%
	
	}else{
	%>
	   <img class="logo" src="images/clg-1/review1.png" style="margin-top:10%;margin-left:20%;width:50%; height:60%"> 
	<%
	}
	%>
	
		</div>

   <div class="content">
      <p style="font-size:20px;" ><b><%=teacher.getTecherName() %></b></p>
       <p style="font-size:17px;" ><b><%=teacher.getDesignation()+" of "+teacher.getDepartmentName() %></b></p>
   </div>

</section>

<!-- home section ends -->

<!-- fun fact section starts  -->

<section class="fun-fact">

   <div class="box">
      <img src="images/teachers/undraw_teaching_f-1-cm.svg" alt="">
     <div class="info">
      <p>Total Classes</p>
      <h3><%= subjectList.get("totalSubjects") %></h3>
     </div>
   </div>

   <div class="box">
      <img src="images/teachers/undraw_multitasking_hqg3.svg" alt="">
      <div class="info">
      <p>Total Lab</p>  
      <h3><%= subjectList.get("totalLabs") %></h3>
       
      </div>
   </div>

   <div class="box">
      <img src="images/teachers/undraw_multitasking_hqg3.svg" alt="">
      <div class="info">
        <p>Total Notes</p>
         <h3><%=notesCount %></h3>
      </div>
   </div>

   

</section>

<!-- fun fact section ends -->

<!-- about section starts  -->

<section class="about" id="about">

   <div class="content">
      <h3>Information For Controlling The site</h3>
      <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Enim laboriosam quidem eaque, ex qui fugit velit veniam veritatis a nostrum amet perspiciatis pariatur ducimus ipsam officiis quae cumque maiores voluptates!</p>
      <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Repellendus iste ab eos ea rerum obcaecati illo ex recusandae expedita aspernatur?</p>
      <a href="#services" class="btn">read more</a>
   </div>

   <div class="image">
      <img src="images/teachers/undraw_version_control_re_mg66.svg" alt="">
   </div>

</section>

<!-- about section ends -->

<div class="container">

    <h1 class="heading">MY CLASSES</h1>
   <div id="classes" class="box-container" id="subject">
 <%
if(subjects.size()==0){
	%>
	 <label style="color:red; font-weight: bold; text-align:center;  font-size: 20px;">Sorry , You are not mapped with any subjects </label>
	<%
}
else{
for(MapTeacherSubject obj:subjects){
	
	%>
 <div class="box" style="display:inline-block">
        <div class="image">
            <img src="images/teachers/undraw_teaching_f-1-cm.svg" alt="">
         </div>
         <div class="content" style=" text-align: center">
            <h2><%=obj.getSubjectCode()+"-"+obj.getSubjectName() %></h2>
            <p>
            <%= obj.getCourseType()+" , "+obj.getDepartmentShortName()+"-"+obj.getSection()%>
            <br>
            <%= (obj.getYear()==1)?( obj.getYear()+"st Year"):(obj.getYear()==2)?( obj.getYear()+"nd Year"):(obj.getYear()==3)?( obj.getYear()+"rd Year"):obj.getYear()+"th Year" %>
            <%= "-" %>
            <%=  (obj.getSemester()==1)?( obj.getSemester()+"st Semester"):(obj.getSemester()==2)?( obj.getSemester()+"nd Semester"):(obj.getSemester()==3)?( obj.getSemester()+"rd Semester"):obj.getSemester()+"th Semester"%>
            </p>

        <a href="<%=(obj.getSubjectType()==1?"teacherSubject.jsp?":"teacherLab.jsp?")%><%="subjectId="+obj.getFkSubjectId()+"&"+"subjectName="+obj.getSubjectName()+"&"+"subjectCode="+obj.getSubjectCode() +"&section="+obj.getSection()+"&semester="+obj.getSemester()+"&year="+obj.getYear()+"&courseId="+obj.getCourseTypeId()+"&courseName="+obj.getCourseType()%>"  class="btn">Enter The Class</a>
   
         </div>
       </div>
	<%
}
}
%>
    </div>
   
 
 </div>
 

<!-- contact section starts  -->

<section  class="contact" id="contact">

		<h1 class="heading">
			<span>contact</span> With Admin
		</h1>

		<div class="row" >

			<img class="map" src="./images/teachers/90514-teacher-discussion.gif"  height="420">
			<form  id="doubtStudentForm" style="border:1px solid blue;height:300px;">
				<h3>get in touch</h3>
				<textarea name="doubtMessage" placeholder="message"  cols="30" rows="10"></textarea>
				<input class="btn btn-primary" type="submit" id="doubtSubmit" value="Submit" style="border:1px solid blue;">
				<button type="button" class="btn btn-outline-primary" id="viewDoubt" style="margin-left:10px;border:1px solid blue;">View Doubt</button>
			</form>

		</div>
	</section>

<!-- contact section ends -->


<script>
    let menu = document.querySelector('#menu-btn');
let navbarLinks = document.querySelector('.header .navbar .links');

menu.onclick = () =>{
   menu.classList.toggle('fa-times');
   navbarLinks.classList.toggle('active');
}

window.onscroll = () =>{
   menu.classList.remove('fa-times');
   navbarLinks.classList.remove('active');

   if(window.scrollY > 60){
      document.querySelector('.header .navbar').classList.add('active');
   }else{
      document.querySelector('.header .navbar').classList.remove('active');
   }
}
</script>

</section>

<!-- footer section ends -->
<!-- Doubt Modal Start -->
  <div class="container">
    <!-- The Modal -->
<div class="modalDoubt" id="myModalDoubt">
    <div class="modal-contentDoubt">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center; font-size: 25px;">Doubt History</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        <div style="height:270px;overflow-y: auto;">
      <table id="doubtTable" class="table table-striped">
    <thead >
        <th style="text-align: center;font-size: 15px;">Create Date</th>
        <th style="text-align: center;font-size: 15px;">Update Date</th>
        <th style="text-align: center;font-size: 15px;">Question</th>
        <th style="text-align: center;font-size: 15px;">Answered</th>
    </thead>
    <tbody id="doubtBody">
    </tbody>
  </table>
  </div>
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" style="margin-top:15px;">
        <button type="button" id="close" class="btn btn-danger" style="float: right;">Close</button>
      </div>

    </div>
</div>
</div>
<!-- Doubt Modal end -->
	
 <!-- Loader Modal Start -->
   <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="loader1" style="display:none;">
        <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;">
        </div>

        <h4
          style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;font-size:20px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
 <!-- Loader Modal end -->	

<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

<!-- custom js file link  -->

<script>
   lightGallery(document.querySelector('.gallery .gallery-container'));
</script>
<script>

var teacherId=<%=fkTeacherPkId%>;

$(document).ready(function () {
	  console.log("Jquery loded");
	// $('#myModal').show();
	 //$('.loader1').show();
	 
	 
	  $('#close').click(function (event) {
		  $('#myModalDoubt').hide();
		 $('#viewDoubt').prop("disabled", false);
	  });
});


$('#doubtSubmit').click(function (event){
	event.preventDefault();
	$('#doubtSubmit').prop("disabled", true);  
	 $('#myModal').show();
    //Calling Loader
    $(".loader1").show();
     var form = $('#doubtStudentForm')[0];
// Create an FormData object 
var data = new FormData(form);
data.append("action", "askDoubtAdmin");
data.append("teacherId",teacherId);    
   $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url:"/College_Final_Year_Project/doubt", 		      
      data: data,
      processData: false,
      contentType: false,
      success: function (data, textStatus, jqXHR) {
         $(".loader1").hide();
         $('#myModal').hide();
         if (data.trim().includes("Succesfully")) {
           swal("Done", data, "success");
           $('#doubtStudentForm')[0].reset();
         }
         else {
           swal("Error", data, "error");
         }
         $("#doubtSubmit").prop("disabled", false);
      },
      error: function (jqXHR, textStatus, errorThrown) {
    	  $(".loader1").hide();
         $('#myModal').hide();
       swal("Error", data, "error");
       $("#doubtSubmit").prop("disabled", false);
      }
    });    
});	  


$('#viewDoubt').click(function (event){
  	event.preventDefault();
    $('#myModalDoubt').show();
 	 $('#viewDoubt').prop("disabled", true);  
        $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/doubt?action=viewDoubt&action1=adminDoubt&teacherId="+teacherId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#doubtBody').empty();
		    	 if(JsonData.length==0){
			     $("#doubtBody").html('<tr class="no-records"><td colspan="4" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  
		        
		        	 $('#doubtBody').append(
		        			  '<tr style="height:20px">'+
		        		       '<td style="text-align: center;font-size: 15px;">'+item.createDate+'</td>'+
		        		         '<td style="text-align: center;font-size: 15px;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;">'+item.question+'</textarea></td>'+
		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;">'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading doubt history.");
		      }
		    });  
          }); 
  

</script>
</body>
</html>