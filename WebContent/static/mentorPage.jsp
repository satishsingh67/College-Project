<%@page errorPage="errorPage.jsp" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.college.model.Mentor" %>
<%@page import="com.college.mentor.dao.AllotedClass" %>

<%
Mentor mentor=(Mentor)session.getAttribute("mentor");
if(mentor==null){
	response.sendRedirect("mentorLogin.jsp");
	return;
}
Integer fkMentorPkId=mentor.getPkMentorId();


//Subject List
List<Mentor> classList=new AllotedClass().getAllotedClass(fkMentorPkId);

String image=new AllotedClass().fetchMentorPhoto(fkMentorPkId);

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Mentor page</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">

    <link rel="stylesheet" href="css/studentLabCSS.css">
   <script src="./lib/jquery.min.js"></script>
   <script src="./lib/sweetalert.min.js"></script> 

   <!-- custom css file link  -->
   
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600&display=swap');
* {
  font-family: 'Montserrat', sans-serif;
  margin: 0;
  padding: 0;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  outline: none;
  border: none;
  text-decoration: none;
  -webkit-transition: all 0.2s linear;
  transition: all 0.2s linear;
}

html {
  font-size: 62.5%;
  overflow-x: hidden;
  scroll-behavior: smooth;
  scroll-padding-top: 6rem;
}

html::-webkit-scrollbar {
  width: 1rem;
}

html::-webkit-scrollbar-track {
  background: #fff;
}

html::-webkit-scrollbar-thumb {
  background: #2597f4;
  border-radius: 5rem;
}

section {
  padding: 5rem 10%;
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
  background: #2597f4;
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
  margin-left: 2rem;
  font-size: 2rem;
  text-transform: capitalize;
  color: #334;
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
  width: 70%;
}

.home .content {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .content h3 {
  font-size: 4.5rem;
  text-transform: capitalize;
  color: #334;
}

.home .content p {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding: 1rem 0;
}

.fun-fact {
  display: -ms-grid;
  display: grid;
  -ms-grid-columns: (minmax(30rem, 1fr)) [auto-fit];
  grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
  
  gap: 2rem;
  background: #f5f5f5;
  gap: 3.5rem;
}

.fun-fact .box {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  gap: 1rem;
}

.fun-fact .box img {
  height: 20rem;
}

.fun-fact .box h3 {
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.fun-fact .box button {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding-top: 0.5rem;
}

.about {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -ms-flex-wrap: wrap-reverse;
  flex-wrap: wrap-reverse;
  gap: 3rem;
}

.about .image {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.about .image img {
  width: 100%;
}

.about .content {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.about .content h3 {
  font-size: 3rem;
  text-transform: capitalize;
  color: #334;
  padding-bottom: 0.5rem;
}

.about .content p {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding: 1rem 0;
}

.container .heading {
  font-size: 40px;
  margin-bottom: 20px;
  color: #334;
}

.container .box-container {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 20px;
}

.container .box-container .box {
  background-color: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  display: none;
}

.container .box-container .box:nth-child(1),
.container .box-container .box:nth-child(2),
.container .box-container .box:nth-child(3) {
  display: inline-block;
}

.container .box-container .box .image {
  margin-bottom: 20px;
  overflow: hidden;
  height: 400px;
  border-radius: 5px;
}

.container .box-container .box .image img {
  height: 100%;
  width: 100%;
  object-fit: cover;
}

.container .box-container .box:hover .image img {
  transform: scale(1.1);
}

.container .box-container .box .content h3 {
  font-size: 20px;
  color: #334;
}

.container .box-container .box .content p {
  font-size: 15px;
  color: #777;
  line-height: 2;
  padding: 15px 0;
}

.container .box-container .box .content .btn {
  display: inline-block;
  padding: 10px 30px;
  border: 1px solid #334;
  color: #334;
  font-size: 16px;
}

.container .box-container .box .content .btn:hover {
  background-color: crimson;
  border-color: crimson;
  color: #fff;
}

.container .box-container .box .content .icons {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-top: 20px;
  padding-top: 15px;
  border-top: 1px solid #334;
}

.container .box-container .box .content .icons span {
  font-size: 14px;
  color: #777;
}

.container .box-container .box .content .icons span i {
  color: crimson;
  padding-right: 5px;
}

#load-more {
  margin-top: 20px;
  display: inline-block;
  padding: 13px 30px;
  border: 1px solid #334;
  color: #334;
  font-size: 16px;
  background-color: #fff;
  cursor: pointer;
}

#load-more:hover {
  background-color: crimson;
  border-color: crimson;
  color: #fff;
}

@media (max-width: 450px) {
  .container .heading {
    font-size: 25px;
  }

  .container .box-container {
    grid-template-columns: 1fr;
  }

  .container .box-container .box .image {
    height: 200px;
  }

  .container .box-container .box .content p {
    font-size: 12px;
  }

  .container .box-container .box .content .icons span {
    font-size: 12px;
  }
}
#load-more {
  margin-top: 20px;
  display: inline-block;
  padding: 13px 30px;
  border: 1px solid #334;
  color: #334;
  font-size: 16px;
  background-color: #fff;
  cursor: pointer;
}

#load-more:hover {
  background-color: crimson;
  border-color: crimson;
  color: #fff;
}

.contact .row {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  gap: 3rem;
}

.contact .row .map {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
  width: 40%;
}

.contact .row form {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
  padding: 2rem;
  border: 0.2rem solid #334;
}

.contact .row form h3 {
  font-size: 2.5rem;
  text-transform: capitalize;
  color: #334;
  padding-bottom: 1rem;
}

.contact .row form .inputBox {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
}

.contact .row form .inputBox input {
  width: 49%;
}

.contact .row form .inputBox input,
.contact .row form textarea {
  padding: 1.2rem 1.4rem;
  font-size: 1.6rem;
  color: #777;
  margin: 0.7rem 0;
  border: 0.2rem solid #334;
}

.contact .row form .inputBox input:focus,
.contact .row form textarea:focus {
  background: #334;
  color: #fff;
}

.contact .row form .inputBox input:focus::-webkit-input-placeholder,
.contact .row form textarea:focus::-webkit-input-placeholder {
  color: #fff;
}

.contact .row form .inputBox input:focus:-ms-input-placeholder,
.contact .row form textarea:focus:-ms-input-placeholder {
  color: #fff;
}

.contact .row form .inputBox input:focus::-ms-input-placeholder,
.contact .row form textarea:focus::-ms-input-placeholder {
  color: #fff;
}

.contact .row form .inputBox input:focus::placeholder,
.contact .row form textarea:focus::placeholder {
  color: #fff;
}

.contact .row form textarea {
  width: 100%;
  height: 15rem;
  resize: none;
}

.footer {
  background: #f5f5f5;
}

.footer .box-container {
  display: -ms-grid;
  display: grid;
  -ms-grid-columns: (minmax(25rem, 1fr)) [auto-fit];
  grid-template-columns: repeat(auto-fit, minmax(25rem, 1fr));
  gap: 2rem;
}

.footer .box-container .box h3 {
  font-size: 2.2rem;
  text-transform: capitalize;
  color: #334;
  padding: 1rem 0;
}

.footer .box-container .box .link {
  display: block;
  padding: 0.5rem 0;
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
}

.footer .box-container .box .link i {
  padding-right: 0.5rem;
  color: #2597f4;
}

.footer .box-container .box .link:hover {
  color: #2597f4;
}

.footer .box-container .box .link:hover i {
  padding-right: 2rem;
}

.footer .box-container .box p {
  padding: 0.5rem 0;
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
}

.footer .box-container .box p span {
  color: #2597f4;
}

.footer .box-container .box .email {
  width: 100%;
  border: 0.2rem solid #334;
  padding: 1.6rem 1.4rem;
  font-size: 1.6rem;
  color: #777;
  margin: 1rem 0;
}

.footer .box-container .box .share {
  margin-top: 2rem;
}

.footer .box-container .box .share a {
  height: 4.5rem;
  width: 4.5rem;
  line-height: 4.5rem;
  font-size: 1.7rem;
  background: #334;
  color: #fff;
  margin-right: 0.3rem;
  text-align: center;
}

.footer .box-container .box .share a:hover {
  background: #2597f4;
}

.footer .credit {
  font-size: 2rem;
  text-transform: capitalize;
  color: #334;
  margin-top: 3rem;
  padding-top: 3rem;
  border-top: 0.2rem solid #334;
  text-align: center;
}

.footer .credit span {
  color: #2597f4;
}

@media (max-width: 1200px) {
  .header .contact-info {
    padding: 2rem 5%;
  }
  .header .navbar {
    padding: 2rem 5%;
  }
  section {
    padding: 3rem 5%;
  }
}

@media (max-width: 991px) {
  html {
    font-size: 55%;
  }
  .header .contact-info {
    padding: 2rem;
  }
  .header .navbar {
    padding: 2rem;
  }
  section {
    padding: 3rem 2rem;
  }
}

@media (max-width: 768px) {
  .header .contact-info {
    display: none;
  }
  .header #menu-btn {
    display: inline-block;
  }
  .header #menu-btn.fa-times {
    -webkit-transform: rotate(180deg);
    transform: rotate(180deg);
  }
  .header .navbar .links {
    position: absolute;
    top: 99%;
    left: 0;
    right: 0;
    background: #fff;
    border-top: 0.2rem solid #334;
    border-bottom: 0.2rem solid #334;
    -webkit-clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
    clip-path: polygon(0 0, 100% 0, 100% 0, 0 0);
  }
  .header .navbar .links.active {
    -webkit-clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
    clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%);
  }
  .header .navbar .links a {
    display: block;
    margin: 2.5rem 2rem;
    font-size: 2.5rem;
  }
  .fun-fact {
    padding: 5rem 2rem;
  }
  .fun-fact .box {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-flow: column;
    flex-flow: column;
    text-align: center;
  }
}

@media (max-width: 450px) {
  html {
    font-size: 50%;
  }
  .home .content h3 {
    font-size: 3rem;
  }
  .contact .row form .inputBox input {
    width: 100%;
  }
  .heading {
    font-size: 3rem;
  }
}

</style>
</head>
<body>
   
<!-- header section starts  -->

<header class="header">


   <nav class="navbar">

      <img src="./images/GNIT_Kolkata_logo.png" class="logo">  

      <div class="links">
         
         <a href="#classes">Allotted Classes</a>
         
         
         <a href="#contact">Contact Admin</a>
         <a href="./mentorUpdateProfile.jsp" target="_blank">Profile</a>
         <a href="./changePasswordMentor.jsp" target="_blank">Change Password</a>
         <a href="/College_Final_Year_Project/logout?action=mentor">Logout</a>
         
         
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
      <p><b>Name Of The Mentor: </b><%=mentor.getName() %></p>
     <p><b>Mentor Id: </b><%=mentor.getPkMentorId() %></p>
   </div>

</section>

<!-- home section ends -->



<!-- about section starts  -->



<!-- about section ends -->

<div class="container">

    <h1 class="heading">Allotted Classes</h1>
 
    <div id="classes" class="box-container">
 <%
 if(classList.size()!=0 && classList!=null){
 for(Mentor obj:classList){
	
 %>
      <div class="box" style="display:inline-block;height:530px;width:400px; ">
        <div class="image">
            <img src="images/teachers/undraw_teaching_f-1-cm.svg" style="border:1px solid red;height:300px;" alt="">
         </div>
         <div class="content" style=" text-align: center;margin-top:-30%;">
            <p style="margin-top:-30%;"><%=obj.getDepartmentShortName()+"-"+ obj.getFkSectionId() %></p>
            
           <p style="margin-top:-10%;"><%=(obj.getYear().trim().equalsIgnoreCase("1")?"1st":obj.getYear().trim().equalsIgnoreCase("2")?"2nd":obj.getYear().trim().equalsIgnoreCase("3")?"3rd":"4th")+" Year"+" - "+((obj.getSemester()==1)?( obj.getSemester()+"st Semester"):(obj.getSemester()==2)?( obj.getSemester()+"nd Semester"):(obj.getSemester()==3)?( obj.getSemester()+"rd Semester"):obj.getSemester()+"th Semester")%></p>            
         
       <a href="mentorGuideStudent.jsp?departmentId=<%=obj.getFkDepartmentId()+"&sectionId="+obj.getFkSectionId()+"&courseType="+obj.getFkCourseTypeId()+"&courseName="+obj.getCourseShortName()+"&year="+obj.getYear() %>"  class="btn">Enter The Class</a>
   
         </div>
       </div>
       
      <%
 }
 }
 else{
      %>
 	 <label style="color:red; font-weight: bold; text-align:center;  font-size: 20px;">Sorry , You are not mapped with any class </label>
 
      <%
 }
      %>
    </div>
 
   
 
 </div>
 
 <script>
 
 let loadMoreBtn = document.querySelector('#load-more');
 let currentItem = 3;
 
 loadMoreBtn.onclick = () =>{
    let boxes = [...document.querySelectorAll('.container .box-container .box')];
    for (var i = currentItem; i < currentItem + 3; i++){
       boxes[i].style.display = 'inline-block';
    }
    currentItem += 3;
 
    if(currentItem >= boxes.length){
       loadMoreBtn.style.display = 'none';
    }
 }
 
 </script>

<!-- services section ends -->
<script>

    let loadMoreBtn = document.querySelector('#load-more');
    let currentItem = 3;
    
    loadMoreBtn.onclick = () =>{
       let boxes = [...document.querySelectorAll('.services .box-container .box')];
       for (var i = currentItem; i < currentItem + 3; i++){
          boxes[i].style.display = 'inline-block';
       }
       currentItem += 3;
    
       if(currentItem >= boxes.length){
          loadMoreBtn.style.display = 'none';
       }
    }
    
    </script>




<!-- contact section starts  -->

<section class="contact" id="contact">

   <h1 class="heading"> <span>contact</span> Admin </h1>

   <div class="row">

    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<lottie-player src="https://assets9.lottiefiles.com/packages/lf20_isbiybfh.json"  background="transparent"  speed="1"  style="width: 500px; height: 500px;"  loop  autoplay></lottie-player>
      <form  id="doubtStudentForm" style="border:1px solid blue;width:50px;height:300px;">
				<h3>get in touch</h3>
				<textarea name="doubtMessage" placeholder="message"  cols="30" rows="10"></textarea>
				<input class="btn btn-primary" type="submit" id="doubtSubmit" value="Submit" style="border:1px solid blue;">
				<button type="button" class="btn btn-outline-primary" id="viewDoubt" style="margin-left:10px;border:1px solid blue;">View Doubt</button>
			</form>

   </div>

</section>

<!-- contact section ends -->


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


<script src="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/js/lightgallery.min.js"></script>

<!-- custom js file link  -->

<script>
   lightGallery(document.querySelector('.gallery .gallery-container'));
</script>

<script>
var mentorId=<%=fkMentorPkId%>;


$('#viewDoubt').click(function (event){
  	event.preventDefault();
    $('#myModalDoubt').show();
 	 $('#viewDoubt').prop("disabled", true);  
        $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/doubt?action=viewDoubt&action1=adminMentorDoubt&mentorId="+mentorId,
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
  
$('#close').click(function (event) {
	  $('#myModalDoubt').hide();
	 $('#viewDoubt').prop("disabled", false);
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
data.append("action", "askDoubtMentorAdmin");
data.append("mentorId",mentorId);    
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




</script>

</body>
</html>