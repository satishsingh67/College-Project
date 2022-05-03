<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.teacher.dao.LinkManagement" %>
<%@page import="com.college.model.Mentor" %>

<%

Mentor mentor=(Mentor)session.getAttribute("mentor");
if(mentor==null){
	response.sendRedirect("mentorLogin.jsp");
	return;
}

String departmentId=request.getParameter("departmentId");
String sectionId=request.getParameter("sectionId");
String courseType=request.getParameter("courseType");
String year=request.getParameter("year");


String meetingLinks=new LinkManagement().getSemExamMeetingLink(3, departmentId, year, sectionId);


%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
     <script src="./lib/jquery.min.js"></script>
   <script src="./lib/sweetalert.min.js"></script> 
   
   
   
   
    <style>
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
      height: 65%;
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
      width: 65%;
      height: 85%;
    }
    
        .modalViewQuestionPaper2 {
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
    .modal-contentViewQuestionPaper2 {
      background-color: #fefefe;
      margin: auto;
      margin-top: 5%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 50%;
      height: 65%;
    }
   
          .modalViewQuestionPaper3 {
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
    .modal-contentViewQuestionPaper3 {
      background-color: #fefefe;
      margin: auto;
      margin-top: 5%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 50%;
      height: 65%;
    } 
   
             .modalViewQuestionPaper4 {
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
    .modal-contentViewQuestionPaper4 {
      background-color: #fefefe;
      margin: auto;
      margin-top: 15%;
      padding: 20px;
      border: 1px solid skyblue;
      width: 35%;
      height: 30%;
    } 
   
    
        /*  import google fonts */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Ubuntu:wght@400;500;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    text-decoration: none;
}
html{
    scroll-behavior: smooth;
}
/* custom scroll bar */
::-webkit-scrollbar {
    width: 10px;
}
::-webkit-scrollbar-track {
    background: #f1f1f1;
}
::-webkit-scrollbar-thumb {
    background: #888;
}
::-webkit-scrollbar-thumb:hover {
    background: #555;
}
/* all similar content styling codes */
section{
    padding: 100px 0;
}
.max-width{
    max-width: 1300px;
    padding: 0 80px;
    margin: auto;
}
.about, .services, .skills, .teams, .contact, footer{
    font-family: 'Poppins', sans-serif;
}
.about .about-content,
.services .serv-content,
.skills .skills-content,
.contact .contact-content{
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
}
.table{
	width: 100%;
	border-collapse: collapse;
    margin: 1px;
}

.table td,.table th{
  padding:12px 15px;
  border:1px solid #ddd;
  text-align: center;
  font-size:16px;
}

.table th{
	background-color: darkblue;
	color:#ffffff;
}
.table td{
    background-color: rgb(183, 212, 183);
}
.table td:hover{
   
    color: rgb(248, 243, 242);
    cursor: pointer;
   
}
.table tbody tr:nth-child(even){
	background-color: #9e9898;
}


   th {
	position: sticky;
	top: 0px;
	height: 10px;
}


/*responsive*/

@media(max-width: 500px){
	.table thead{
		display: none;
	}

	.table, .table tbody, .table tr, .table td{
		display: block;
		width: 100%;
	}
	.table tr{
		margin-bottom:15px;
	}
	.table td{
		text-align: right;
		padding-left: 50%;
		text-align: right;
		position: relative;
	}
	.table td::before{
		content: attr(data-label);
		position: absolute;
		left:0;
		width: 50%;
		padding-left:15px;
		font-size:15px;
		font-weight: bold;
		text-align: left;
	}
}
section .title{
    position: relative;
    text-align: center;
    font-size: 40px;
    font-weight: 500;
    margin-bottom: 60px;
    padding-bottom: 20px;
    font-family: 'Ubuntu', sans-serif;
}
section .title::before{
    content: "";
    position: absolute;
    bottom: 0px;
    left: 50%;
    width: 180px;
    height: 3px;
    background: #111;
    transform: translateX(-50%);
}
section .title::after{
    position: absolute;
    bottom: -8px;
    left: 50%;
    font-size: 20px;
    color: crimson;
    padding: 0 5px;
    background: #fff;
    transform: translateX(-50%);
}
/* navbar styling */
.navbar{
    position: fixed;
    width: 100%;
    z-index: 999;
    padding: 30px 0;
    font-family: 'Ubuntu', sans-serif;
    transition: all 0.3s ease;
}
.container {

width:200px;

position: relative;

}

.click{

background-color: #f85f73;

}

.click:hover {

background-color: #B71C1C;

}

.click,.links {

padding: 12px;

font-size: 1.2em;

font-family: futura Md BT;

border: none;

outline: none;

width:200px;

color:#fff;

transition: 0.3s;

}

.list {

position: absolute;

transform: scaleY(0);

transform-origin: top;

transition: 0.3s;

}

.newlist {

transform: scaleY(1);

}

.links {

background-color: #283c63;

}

.links:hover {

background-color: #01579B;

transform: scale(1.1);

}
.problem{
  width: 70px;
  background-color: tomato;
}
.from-text{
  height:50px;
  width: 300px;
  background-color: wheat;
}
.navbar.sticky{
    padding: 15px 0;
    background: crimson;
}
.navbar .max-width{
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.navbar .logo a{
    color: #fff;
    font-size: 35px;
    font-weight: 600;
}
.navbar .logo a span{
    color: crimson;
    transition: all 0.3s ease;
}
.navbar.sticky .logo a span{
    color: #fff;
}
.navbar .menu li{
    list-style: none;
    display: inline-block;
}
.navbar .menu li a{
    display: block;
    color: #fff;
    font-size: 20px;
    font-weight: 700;
    margin-left: 20px;
    transition: color 0.3s ease;
}
.navbar .menu li a:hover{
    color: crimson;
}
.navbar.sticky .menu li a:hover{
    color: #fff;
}
/* menu btn styling */
.menu-btn{
    color: #fff;
    font-size: 23px;
    cursor: pointer;
    display: none;
}
.scroll-up-btn{
    position: fixed;
    height: 45px;
    width: 42px;
    background: crimson;
    right: 30px;
    bottom: 10px;
    text-align: center;
    line-height: 45px;
    color: #fff;
    z-index: 9999;
    font-size: 30px;
    border-radius: 6px;
    border-bottom-width: 2px;
    cursor: pointer;
    opacity: 0;
    pointer-events: none;
    transition: all 0.3s ease;
}
.scroll-up-btn.show{
    bottom: 30px;
    opacity: 1;
    pointer-events: auto;
}
.scroll-up-btn:hover{
    filter: brightness(90%);
}
/* home section styling */
.home{
    display: flex;
   background-image: url(./fpdf/gnit3.jpg);
    height: 100vh;
    color: #fff;
    min-height: 500px;
    background-size: cover;
    background-attachment: fixed;
    font-family: 'Ubuntu', sans-serif;
}
.home .max-width{
  width: 100%;
  display: flex;
}
.home .max-width .row{
  margin-right: 0;
}
.home .home-content .text-1{
    font-size: 27px;
}
.home .home-content .text-2{
    font-size: 60px;
    font-weight: 600;
    margin-left: -3px;
}
.home .home-content .text-3{
    font-size: 40px;
    margin: 5px 0;
}
.home .home-content .text-3 span{
    color: crimson;
    font-weight: 500;
}
.home .home-content a{
    display: inline-block;
    background: crimson;
    color: #fff;
    font-size: 25px;
    padding: 12px 36px;
    margin-top: 20px;
    font-weight: 400;
    border-radius: 6px;
    border: 2px solid crimson;
    transition: all 0.3s ease;
}
.home .home-content a:hover{
    color: crimson;
    background: none;
}
/* about section styling */
.about .title::after{
    content: "who i am";
}
.about .about-content .left{
    width: 45%;
}
.about .about-content .left img{
    height: 400px;
    width: 400px;
    object-fit: cover;
    border-radius: 6px;
}
.about .about-content .right{
    width: 55%;
}
.about .about-content .right .text{
    font-size: 25px;
    font-weight: 600;
    margin-bottom: 10px;
}
.about .about-content .right .text span{
    color: crimson;
}
.about .about-content .right p{
    text-align: justify;
}
.about .about-content .right a{
    display: inline-block;
    background: crimson;
    color: #fff;
    font-size: 20px;
    font-weight: 500;
    padding: 10px 30px;
    margin-top: 20px;
    border-radius: 6px;
    border: 2px solid crimson;
    transition: all 0.3s ease;
}
.about .about-content .right a:hover{
    color: crimson;
    background: none;
}
/* services section styling */
.services, .teams{
    color:#fff;
    background: #111;
}
.services .title::before,
.teams .title::before{
    background: #fff;
}
.services .title::after,
.teams .title::after{
    background: #111;
    content: "what i provide";
}
.services .serv-content .card{
    width: calc(50% - 20px);
    background: #222;
    text-align: center;
    border-radius: 6px;
    padding: 30px 25px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.services .serv-content .card:hover{
    background: crimson;
}
.services .serv-content .card .box{
    transition: all 0.3s ease;
}
.services .serv-content .card:hover .box{
    transform: scale(1.05);
}
.services .serv-content .card i{
    font-size: 50px;
    color: crimson;
    transition: color 0.3s ease;
}
.services .serv-content .card:hover i{
    color: #fff;
}
.services .serv-content .card .text{
    font-size: 25px;
    font-weight: 500;
    margin: 10px 0 7px 0;
}
/* skills section styling */
.skills .title::after{
    content: "what i know";
}
.skills .skills-content .column{
    width: calc(50% - 30px);
}
.skills .skills-content .left .text{
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 10px;
}
.skills .skills-content .left p{
    text-align: justify;
}
.skills .skills-content .left a{
    display: inline-block;
    background: crimson;
    color: #fff;
    font-size: 18px;
    font-weight: 500;
    padding: 8px 16px;
    margin-top: 20px;
    border-radius: 6px;
    border: 2px solid crimson;
    transition: all 0.3s ease;
}
.skills .skills-content .left a:hover{
    color: crimson;
    background: none;
}
.skills .skills-content .right .bars{
    margin-bottom: 15px;
}
.skills .skills-content .right .info{
    display: flex;
    margin-bottom: 5px;
    align-items: center;
    justify-content: space-between;
}
.skills .skills-content .right span{
    font-weight: 500;
    font-size: 18px;
}
.skills .skills-content .right .line{
    height: 5px;
    width: 100%;
    background: lightgrey;
    position: relative;
}
.skills .skills-content .right .line::before{
    content: "";
    position: absolute;
    height: 100%;
    left: 0;
    top: 0;
    background: crimson;
}
.skills-content .right .html::before{
    width: 90%;
}
.skills-content .right .css::before{
    width: 60%;
}
.skills-content .right .js::before{
    width: 80%;
}
.skills-content .right .php::before{
    width: 50%;
}
.skills-content .right .mysql::before{
    width: 70%;
}

/* footer section styling */
footer{
    background: #111;
    padding: 15px 23px;
    color: #fff;
    text-align: center;
}
footer span a{
    color: crimson;
    text-decoration: none;
}
footer span a:hover{
    text-decoration: underline;
}
/* responsive media query start */
@media (max-width: 1104px) {
    .about .about-content .left img{
        height: 350px;
        width: 350px;
    }
}
@media (max-width: 991px) {
    .max-width{
        padding: 0 50px;
    }
}
@media (max-width: 947px){
    .menu-btn{
        display: block;
        z-index: 999;
    }
    .menu-btn i.active:before{
        content: "\f00d";
    }
    .navbar .menu{
        position: fixed;
        height: 100vh;
        width: 100%;
        left: -100%;
        top: 0;
        background: #111;
        text-align: center;
        padding-top: 80px;
        transition: all 0.3s ease;
    }
    .navbar .menu.active{
        left: 0;
    }
    .navbar .menu li{
        display: block;
    }
    .navbar .menu li a{
        display: inline-block;
        margin: 20px 0;
        font-size: 25px;
    }
    .home .home-content .text-2{
        font-size: 70px;
    }
    .home .home-content .text-3{
        font-size: 35px;
    }
    .home .home-content a{
        font-size: 23px;
        padding: 10px 30px;
    }
    .max-width{
        max-width: 930px;
    }
    .about .about-content .column{
        width: 100%;
    }
    .about .about-content .left{
        display: flex;
        justify-content: center;
        margin: 0 auto 60px;
    }
    .about .about-content .right{
        flex: 100%;
    }
    .services .serv-content .card{
        width: calc(50% - 10px);
        margin-bottom: 20px;
    }
    .skills .skills-content .column,
    .contact .contact-content .column{
        width: 100%;
        margin-bottom: 35px;
    }
}
@media (max-width: 690px) {
    .max-width{
        padding: 0 23px;
    }
    .home .home-content .text-2{
        font-size: 60px;
    }
    .home .home-content .text-3{
        font-size: 32px;
    }
    .home .home-content a{
        font-size: 20px;
    }
    .services .serv-content .card{
        width: 100%;
    }
}
@media (max-width: 500px) {
    .home .home-content .text-2{
        font-size: 50px;
    }
    .home .home-content .text-3{
        font-size: 27px;
    }
    .about .about-content .right .text,
    .skills .skills-content .left .text{
        font-size: 19px;
    }
    .contact .right form .fields{
        flex-direction: column;
    }
    .contact .right form .name,
    .contact .right form .email{
        margin: 0;
    }
    .right form .error-box{
       width: 150px;
    }
    .scroll-up-btn{
        right: 15px;
        bottom: 15px;
        height: 38px;
        width: 35px;
        font-size: 23px;
        line-height: 38px;
    }
}
.cls-1{
    font-size: 20px;
    font-weight: 800;
    color: yellow;
}
.cls-2{
    width: 300px;
    height: 50px;
}
.btn-1{
    margin: 5px;
    height: 40px;
    width: 130px;
    box-shadow: 4px 4px 4px slategray;
    background-color: rgb(207, 106, 106);
}
.btn-2{
    margin: 5px;
    height: 40px;
    width: 160px;
    box-shadow: 4px 4px 4px slategray;
    background-color: rgb(207, 106, 106);
}
.model-container{
    position: fixed;
    top: 90px;
    left: 20px;
    width: 360px;
    height:70vh;
    background-color: deepskyblue;
    box-shadow: 4px 4px 4px gray;
    border: 2px solid red;
    display: flex;
    border-radius: 20px;
    pointer-events: none;

}

.text1{
 font-weight: 700;
  font-size: 20px;
  color: rgb(31, 34, 31);
}
.problem{
    height: 50px;
    margin-bottom: 5px;
}
.problem1{
    height: 50px;
    width: 100px;
    background-color: tomato;
    margin-bottom: 5px;
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
@media (max-width: 768px) {
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


    </style>
</head>
<body>
    <div class="scroll-up-btn">
        <i class="fas fa-angle-up"></i>
    </div>
    <nav class="navbar">
        <div class="max-width">
            <div style="margin-left:-70px;" class="logo"><img class="brand"src="./images/GNIT_Kolkata_logo.png"></div>
            <ul  class="menu">
                <li><a href="./mentorPage.jsp" class="menu-btn">Home</a></li>
                <li><a href="#home" class="menu-btn">Upload Information</a></li>
                <li><a href="#about" class="menu-btn">Guide Students</a></li>
                 <li><a href="#about" class="menu-btn">Students Doubt</a></li>
                <li><a href="#skills" class="menu-btn">Subject Allotment</a></li>
                <li><a href="/College_Final_Year_Project/logout?action=mentor" class="menu-btn">Logout</a></li>
                
                
            </ul>
            <div class="menu-btn">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </nav>
    <!-- home section start -->
    <section class="home" id="home">
        <div class="max-width">
            <div class="home-content">
               
                <div class="text-2">Guru Nanak Institute of Technology</div>
                <div class="text-3"> <span class="typing"></span></div><br><br>
                <div class="container">

            </div>
        </div>
    </section>
    <!-- fun fact section starts  -->

<section class="fun-fact" id="info" style="height:620px;" >

    <div class="box" style="margin-top:-20%;">
   
     <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
     <lottie-player src="https://assets8.lottiefiles.com/packages/lf20_komemhfl.json"  background="transparent"  speed="1"  style="width: 300px; height: 400px;"  loop  autoplay></lottie-player>
      <div class="info">
       <p style="font-size: 15px;font-weight: bold;font-family: 'Times New Roman', Times, serif;border-bottom: 2px solid blueviolet;text-align: center;">Upload Routine</p><br>
       <input id="routineFile" type="file"><br><br>
       <button style="background-color: rgb(70, 206, 70);color: white; width: 80px;font-size: 15px;" id="postRoutine">Post</button>
       <button style="background-color: rgb(70, 206, 70);color: white; width: 80px;font-size: 15px;" id="viewRoutine">View</button>
     
      </div>
    </div>
 
    <div class="box" style="margin-top:-20%;">
     <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
     <lottie-player src="https://assets1.lottiefiles.com/packages/lf20_msxrs1lq.json"  background="transparent"  speed="1"  style="width: 300px; height: 400px;"  loop  autoplay></lottie-player>
 
       <div class="info">
         <p style="font-size: 15px;font-weight: bold;font-family: 'Times New Roman', Times, serif;border-bottom: 2px solid blueviolet;text-align: center;">Upload Syllabus</p><br>
       <input id="syllabusFile" type="file"><br><br>
       <button style="background-color: rgb(70, 206, 70);color: white; width: 80px;font-size: 15px;" id="postSyllabus">Post</button>
       <button style="background-color: rgb(70, 206, 70);color: white; width: 80px;font-size: 15px;"id="viewSyllabus">View</button>
   
       </div>
    </div>
 
    <div class="box" style="margin-top:-20%;">
     <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
     <lottie-player src="https://assets6.lottiefiles.com/packages/lf20_7tbuvbtj.json"  background="transparent"  speed="1"  style="width: 300px; height: 400px;"  loop  autoplay></lottie-player>
       <div class="info">
			
						<p style="font-size: 15px; font-weight: bold; font-family: 'Times New Roman', Times, serif; border-bottom: 2px solid blueviolet; text-align: center;">Upload
						 Link</p>
					<br>
					<form id="mentorlink">
						<select name="LinkType" id="linkSelect"  class="box">
					<option >Select Link Type</option>
					<option value="Subject Choice">Subject Choice</option>
					<option value="Feedback">Feedback</option>
					
					</select>
					<br>
					<input name="link" style=" height: 30px;" type="text"  placeholder="Enter Link Here">
				<br>
				<br>
					<button
						style="background-color: rgb(70, 206, 70); color: white; width: 80px; font-size: 15px;" id="uploadLinkMentor" >Post</button>
					<button
						style="background-color: rgb(70, 206, 70); color: white; width: 80px; font-size: 15px;" id="viewLinkMentor">View</button>
			
			</form>
			</div>
    </div>
 
     <div class="box" style="margin-top:-20%;">
     <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
     <lottie-player src="https://assets6.lottiefiles.com/packages/lf20_7tbuvbtj.json"  background="transparent"  speed="1"  style="width: 300px; height: 400px;"  loop  autoplay></lottie-player>
       <div class="info">
         <p style="font-size: 15px;font-weight: bold;font-family: 'Times New Roman', Times, serif;border-bottom: 2px solid blueviolet;text-align: center;">Upload Exam Link</p><br>
         <input style=" height:30px;" type="text" id="examLink" placeholder="Enter Link Here"><br><br>
         <button style="background-color: rgb(70, 206, 70);color: white; width: 80px;font-size: 15px;" id="postExamLink" >Post</button>
			
			<%
			if(meetingLinks==null){
			
			%>
			
				<a href="" target="_blnak"
					style="pointer-events: none;display: flex; flex-direction: column; justify-content: center; text-align: center; background-color: rgb(70, 206, 70); color: white; margin-left: 85px; margin-top: -42px; width: 45%; height: 42px;"
					 id="joinExamLink">Join</a>
				<%
			}else{
  
                %>
                
                <a href="<%=meetingLinks %>" target="_blnak"
					style="display: flex; flex-direction: column; justify-content: center; text-align: center; background-color: rgb(70, 206, 70); color: white; margin-left: 85px; margin-top: -42px; width: 45%; height: 42px;"
					 id="joinExamLink">Join</a>
                <%
			}
                %>


			</div>
    </div>
 
 
 </section>
 
 <!-- fun fact section ends -->
    <!-- about section start -->
    <section class="about" style="background-color: cadetblue;" id="about">
        <h1 class="text-center" style=" font-size:30px;font-family: 'Times New Roman', Times, serif;font-weight: 900; text-align: center; ">GUIDE STUDENTS</h1><br><br>
        <div style="height:300px;overflow-y: auto;">
        <table class="table">
            <thead>
                <tr>
                  <th>Sl.No</th>
                 <th>Name</th>
                 <th>Email </th>
                 <th>Contact No.</th>
                 <th> University Roll No.</th>
                 <th>Registration No.</th>
                <th>View Details</th>
        
                </tr>
            </thead>
            <tbody id="studentListTable">
          
            </tbody>
          </table>
          </div>
    </section>
    <section class="about" style="background-color: skyblue;height:550px;" id="about">
        <h1 class="text-center" style=" font-size:30px;font-family: 'Times New Roman', Times, serif;font-weight: 900; text-align: center; ">Students Doubt</h1><br><br>
        <div style="height:300px;overflow-y: auto;">
        <table class="table">
            <thead>
                <tr>
                 
               <th style="display:none;"></th>
                 <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Create Date</th>
              <th style="text-align:center;">Update Date</th>
              <th style="text-align:center;">Question</th>
              <th style="text-align:center;">Answer</th>
               <th style="text-align:center;">Reply</th>
        
                </tr>
            </thead>
            <tbody id="doubtTableBody">
          
            </tbody>
          </table>
          </div>
    </section>
    
  
    <!-- services section start -->
    <section class="services" id="services">
        <div class="max-width">
            <h2 class="title">Subject Allotment</h2>
             <h4 style="margin-left:250px;">Teacher</h4>
               <h4 style="margin-left:830px;margin-top:-18px;">Student</h4>
            <div class="serv-content">
      
                <div class="card" style="border:1px solid red;">
                    <div class="box">
                        <i class="fa-solid fa-book"></i><br>
                        <a href="subjectAllotmentTeacher.jsp?departmentId=<%=departmentId+"&sectionId="+sectionId+"&courseType="+courseType+"&year="+year %>" target="_blnak"
					style="display: flex; flex-direction: column; justify-content: center; text-align: center; margin-left:180px; background-color: red;margin-top:5px; color: white;  width: 30%; height: 42px;">Subject Allotment</a>
                    </div>
                </div>
             
                <div class="card" style="border:1px solid red;">
                    <div class="box">
                        <i class="fa-solid fa-book"></i><br>
          
                      <a href="subjectAllotmentStudent.jsp?departmentId=<%=departmentId+"&sectionId="+sectionId+"&courseType="+courseType+"&year="+year %>" target="_blnak"
					style="display: flex; flex-direction: column; justify-content: center; text-align: center; margin-left:180px; background-color: red;margin-top:5px; color: white;  width: 30%; height: 42px;">Subject Allotment</a>
                    </div>
                </div>
                
               </div>
            </div>
        </div>
    </section>
  
    
 <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper1"  id="myModalQuestionPaper1">
    <div class="modal-contentViewQuestionPaper1">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Details</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
        <div style="margin-left:70%;width:20%;height:50%;">
        
       <img class="logo" id="StudentImage" src=""  style="object-fit:contain;
            width:200px;
            height:140px;
            border: solid 1px white"/> 
        
        </div>
        
        <div style="width:50%;margin-top:-130px;">
        
                <label><p "font-size:15px; text-transform: none;" id="studentName" ></p></label>
       
        <br>
        
       <label><p style="font-size:15px; text-transform: none;" id="gender" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="collegeId" ></p></label>
       <br>
        <label><p style="font-size:15px; text-transform: none;" id="studrollNo" ></p></label>
       <br>
        <label><p style="font-size:15px; text-transform: none;" id="registrationNo" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;"  id="mobileNumber" ></p></label>
        <br>
        <label><p style="font-size:15px; text-transform: none;"  id="emaiLId" ></p></label>
        <br>
       <label><p style="font-size:15px; text-transform: none;"  id="Course" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;"  id="department" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="semester" ></p></label>
       <br>
       
       <label><p style="font-size:15px; text-transform: none;" id="section" ></p></label>
           </div>
       <div style="width:49%;margin-left:50%;margin-top:-222px;">
       
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="studDOB" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="bloodGroup" ></p></label>
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="gurdianName" ></p></label>
       
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="gurdianContactNumber" ></p></label>
       
       <br>
       <label><p style="font-size:15px; text-transform: none;" id="gurdianEmailId" ></p></label>
        <br>
      <label><p style="font-size:15px; text-transform: none;"  >Address:</p></label>  <textarea id="address"  style="margin-left: 60px; margin-top: -25px; width: 286px;height: 42px; font-size: 15px; border: 2px solid skyblue;text-transform: none;"  cols="50" rows="5"></textarea> 

       <br>
        </div>
        <br>
        
      <button  id="attendance" style="background-color: skyblue; width: 100px;height:49px;font-size: 15px;">Check Attendance</button>
      <button class="problem1" id="updateStudentRoolNo" style="background-color: skyblue;">Upload Roll & Registration No</button>     
     </div>
         <!-- Modal footer -->
      <div class="modal-footer" >
             <button  id="closeQuestionPaperModel1" style="background-color: red; width: 100px;height:40px;font-size: 15px;margin-left:80%;">Cancel</button>
      </div>
         
  </div>

      
    </div>

<!-- View Question Paper Modal end -->   
            
      <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">View Doubt and Reply</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
        <label><b style="font-size:15px; text-transform: none;" id="studentName1" ></b></label>
        <br>
         <br>
       <label><b style="font-size:15px; text-transform: none;" id="studentRollNo">Roll No:</b></label>
       <br>
        <br>
        <div style="width:100px;margin-top:50px;">
        
               <label ><b style="font-size:15px; text-transform: none;" >Question:</b></label>       
        
        
        </div> 
 
       <textarea name="doubtQuestion" readonly placeholder="Question" id="teacherQuestion" style="margin-left:120px;margin-top:-70px;width:70%;font-size:15px;border:2px solid skyblue; text-transform: none;"  cols="50" rows="5"></textarea>
       <br>
       <br>
       
       
        <div style="width:100px;margin-top:50px;">
        
               <label ><b style="font-size:15px; text-transform: none;" >Answer:<strong style="color:red;">*</strong></b></label>       
        
        
        </div> 
 
       <textarea name="doubtAnswer"  placeholder="Answer" id="teacherQuestionAnswer" style="margin-left:120px;margin-top:-70px;width:70%;font-size:15px;border:2px solid skyblue; text-transform: none;"  cols="50" rows="5"></textarea>   
        
         <div>
      <br>
      <button  id="doubtSubmit" style="background-color: skyblue; width: 100px;height:40px;font-size: 15px;">Submit</button>
     
     </div>
         
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
             <button  id="closeQuestionPaperModel" style="background-color: red; width: 100px;height:40px;font-size: 15px;margin-left:80%;">Cancel</button>
      
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->   
   
   
            
      <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper2"  id="myModalQuestionPaper2">
    <div class="modal-contentViewQuestionPaper2">

      <!-- Modal Header -->
     
        <h4 id="fetchFilesHeader" class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;"></h4>
     

      <!-- Modal body -->
      <div class="modal-body" style="border:1px solid red;height:340px;overflow-y: auto;">
    <table class="table">
            <thead>
                <tr>
							<th style="text-align: center;">Sl.No</th>
							<th style="text-align: center;">File Name</th>
							<th style="text-align: center;">Upload Date</th>
							<th style="text-align: center;">View</th>

						</tr>
            </thead>
            <tbody id="fetchFilesBody">
          
            </tbody>
          </table>
    
    
    
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
             <button  id="closeQuestionPaperModel2" style="background-color: red; width: 100px;height:40px;font-size: 15px;margin-left:80%;margin-top:5px;">Cancel</button>
      
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->   
   
            
      <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper3"  id="myModalQuestionPaper3">
    <div class="modal-contentViewQuestionPaper3">

      <!-- Modal Header -->
     
        <h4 id="fetchLinksHeader" class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;"></h4>
     

      <!-- Modal body -->
      <div class="modal-body" style="border:1px solid red;height:340px;overflow-y: auto;">
    <table class="table">
            <thead>
                <tr>
                 
          
              <th style="text-align:center;">Sl.No</th>
              <th style="text-align:center;">Upload Date</th>
               <th style="text-align:center;">View</th>
        
                </tr>
            </thead>
            <tbody id="fetchLinksBody">
          
            </tbody>
          </table>
    
    
    
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
             <button  id="closeQuestionPaperModel3" style="background-color: red; width: 100px;height:40px;font-size: 15px;margin-left:80%;margin-top:5px;">Cancel</button>
      
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->   
  
   
         <!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper4"  id="myModalQuestionPaper4">
    <div class="modal-contentViewQuestionPaper4">

      <!-- Modal Header -->
     
        <h4  class="modal-title" style="text-align: center;font-size: 20px; text-transform: none;">Update University Roll & Registration No</h4>
     

      <!-- Modal body -->
      <div class="modal-body" style="margin-top:10px;text-align: center;">
    	<form id="roLLNoUpdate">
						<select name="noType" id="linkSelect" style="margin-bottom:10px;width:165px;" class="box">
					<option >Select Type</option>
					<option value="Roll No">Roll No</option>
					<option value="Registration No">Registration No</option>
					
					</select>
					<br>
					<input name="no" style="background-color: white; height: 30px;" type="text"  >
				<br>
				<br>
					<button
						style="background-color: rgb(70, 206, 70); color: white; width: 70px;height:40px; font-size: 15px;" id="updateRollNo" >Update</button>
             <button  id="closeQuestionPaperModel4" style="background-color: red; width: 70px;height:40px;font-size: 15px;">Cancel</button>
				
			</form>
    
  </div>

    

    </div>
</div>
<!-- View Question Paper Modal end -->   
  
   
   
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
  <div class="loader2" style="margin-top:-87%;margin-left:43%;display:none;" id="myLoader"></div>
     <div class="loader2" style="margin-top:35%;margin-left:43%;display:none;" id="myLoader1"></div>
   
      <script>
        $(document).ready(function(){
    $(window).scroll(function(){
        // sticky navbar on scroll script
        if(this.scrollY > 20){
            $('.navbar').addClass("sticky");
        }else{
            $('.navbar').removeClass("sticky");
        }
        
        // scroll-up button show/hide script
        if(this.scrollY > 500){
            $('.scroll-up-btn').addClass("show");
        }else{
            $('.scroll-up-btn').removeClass("show");
        }
    });

    // slide-up script
    $('.scroll-up-btn').click(function(){
        $('html').animate({scrollTop: 0});
        // removing smooth scroll on slide-up button click
        $('html').css("scrollBehavior", "auto");
    });

    $('.navbar .menu li a').click(function(){
        // applying again smooth scroll on menu items click
        $('html').css("scrollBehavior", "smooth");
    });

    // toggle menu/navbar script
    $('.menu-btn').click(function(){
        $('.navbar .menu').toggleClass("active");
        $('.menu-btn i').toggleClass("active");
    });

    // typing text animation script
    var typed = new Typed(".typing", {
        strings: ["Mentor Log in", "Mentor Section", "Guide Students", "Upload Information", "Problem Solving"],
        typeSpeed: 100,
        backSpeed: 60,
        loop: true
    });

   /* var typed = new Typed(".typing-2", {
        strings: ["YouTuber", "Developer", "Blogger", "Designer", "Freelancer"],
        typeSpeed: 100,
        backSpeed: 60,
        loop: true
    });
*/
    // owl carousel script
    $('.carousel').owlCarousel({
        margin: 20,
        loop: true,
        autoplay: true,
        autoplayTimeOut: 2000,
        autoplayHoverPause: true,
        responsive: {
            0:{
                items: 1,
                nav: false
            },
            600:{
                items: 2,
                nav: false
            },
            1000:{
                items: 3,
                nav: false
            }
        }
    });
});
    </script>
    <script>

        let click = document.querySelector('.click');
    
        let list = document.querySelector('.list');
    
        click.addEventListener("click",()=>{
    
            list.classList.toggle('newlist');
    
        });
    
    </script>
  
  <script>
  
  var departmentId=<%=departmentId%>;
  var sectionId=<%=sectionId%>;
  var courseType=<%=courseType%>;
  var year=<%=year%>;

  
  var id;
  var studentId;
  
  $(document).ready(function(){
 $('#myLoader').show();
$('#myLoader1').show();
	  fetchStudentList();
	  fetchStudentDoubt();
  });

  
  
  $('#closeQuestionPaperModel').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper').hide();
	});
  
  $('#closeQuestionPaperModel1').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper1').hide();
	});
  $('#closeQuestionPaperModel2').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper2').hide();
	});
  
  
  $('#closeQuestionPaperModel3').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper3').hide();
	});
  
  $('#closeQuestionPaperModel4').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper4').hide();
		 fetchStudentDetails(studentId);
	});

  
  
  
  function fetchStudentList(){
		 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/guideStudent?action=allStudentDetails&departmentId="+departmentId+"&semesterId="+year+"&sectionId="+sectionId+"&courseTypeId="+courseType,
		      success: function (data, textStatus, jqXHR) {
		    	  $('#myLoader').hide();

		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#studentListTable').empty();
		    	 if(JsonData.length==0){
			     $("#studentListTable").html('<tr class="no-records"><td colspan="7" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  
		        
		        	 $('#studentListTable').append(
		        			  '<tr class="doubtRow" style="height:20px">'+
		        			  '<td style="text-align: center;display:none;">'+item.pkId+'</td>'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;">'+item.emailId+'</td>'+
		        		       '<td style="text-align: center;">'+item.mobileNumber+'</td>'+
		        		       '<td style="text-align: center;">'+(item.universityRollNo==null?"":item.universityRollNo)+'</td>'+
		        		       '<td style="text-align: center;">'+(item.universityRegistrationNo==null?"":item.universityRegistrationNo)+'</td>'+
		        		        '<td style="text-align: center;"><button  onClick="myFunction1()" style="background-color: skyblue; width: 100px;height:40px;font-size: 15px;">View</button>'+

		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading .");
		      }
		    });
	}	  
  
   
  
  
  function fetchStudentDoubt(){
		 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/solveDoubt?action=mentorDoubt&departmentId="+departmentId+"&semesterId="+year+"&sectionId="+sectionId,
		      success: function (data, textStatus, jqXHR) {
		    	  $('#myLoader1').hide();

		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#doubtTableBody').empty();
		    	 if(JsonData.length==0){
			     $("#doubtTableBody").html('<tr class="no-records"><td colspan="6" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  
		        
		        	 $('#doubtTableBody').append(
		        			  '<tr class="doubtRow"  style="height:20px">'+
		        			  '<td style="text-align: center;display:none;">'+item.doubtId+'</td>'+
		        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
		        			  '<td style="text-align: center;">'+item.studentName+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		       '<td style="text-align: center;">'+item.createDate+'</td>'+
		        		         '<td style="text-align: center;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
		        		         '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;" readonly id=question'+item.doubtId+'>'+item.question+'</textarea></td>'+
 		        		        '<td style="text-align: center;"><textarea rows="2" cols="20" style="font-size: 15px;text-transform: none; " readonly  id=answer'+item.doubtId+'>'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
		        		        '<td style="text-align: center;"><button  onClick="myFunction()" style="background-color: skyblue; width: 100px;height:40px;font-size: 15px;">Reply</button>'+

		        		      '</tr>'
		        	  );
		        	  
		        	  
			      });
		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading doubt history.");
		      }
		    });
	}	
  function myFunction1(){
	  
  
  $('#studentListTable td').on('click', function () {
	   $('#myModal').show();
		  $(".loader1").show();
	   var row = $(this).closest('tr');
       
       studentId = $(row).find('td').eq(0).html();
   
       
       fetchStudentDetails(studentId);
       
  });
  }
  
  function fetchStudentDetails(studId){
		 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/guideStudent?action=studentDetails&id="+studId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	
		    	console.log(JsonData[0].name);
		    	 
		  $('#StudentImage').attr('src', 'data:image/png;base64,'+JsonData[0].base64Image); 	
		   $('#studentName').text("Name: "+JsonData[0].name);
		   $('#collegeId').text("College Id: "+JsonData[0].collegeId);	
		   $('#studrollNo').text("University Roll No: "+(JsonData[0].universityRollNo==null?"":JsonData[0].universityRollNo));	
		   $('#registrationNo').text("University Registration No: "+(JsonData[0].universityRegistrationNo==null?"":JsonData[0].universityRegistrationNo));	
		   $('#gender').text("Gender: "+JsonData[0].gender); 	
		   $('#mobileNumber').text("Mobile Number: "+JsonData[0].mobileNumber);	
		   $('#emaiLId').text("Email Id: "+JsonData[0].emailId);	
		   $('#Course').text("Course: "+JsonData[0].courseName);	
		   $('#department').text("Department: "+JsonData[0].departmentName);	
		   $('#semester').text("Semester: "+JsonData[0].semster);
		   $('#section').text("Section: "+JsonData[0].section); 			   
		   $('#studDOB').text("DOB: "+JsonData[0].DOB); 	
		    $('#address').text((JsonData[0].name==null?"":JsonData[0].address));	
		   $('#bloodGroup').text("Blood Group: "+(JsonData[0].bloodGroup=="(NULL)"?"":JsonData[0].bloodGroup));	
		   $('#gurdianName').text("Guardian Name: "+(JsonData[0].gurdianName=="(NULL)"?"":JsonData[0].gurdianName));	
		   $('#gurdianContactNumber').text("Guardian Number: "+(JsonData[0].gurdianContactNumber=="(NULL)"?"":JsonData[0].gurdianContactNumber));	
		   $('#gurdianEmailId').text("Guardian Email Id: "+(JsonData[0].gurdianEmailid=="(NULL)"?"":JsonData[0].gurdianEmailid));	
				  $(".loader1").hide();
				  $('#myModal').hide();
		      $('#myModalQuestionPaper1').show();

		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	          alert("Sorry Something went wrong while loading.");
		      }
		    });
  }
  
  
  function myFunction(){
       $('#doubtTableBody td').on('click', function () {
      	 
    	   $('#myModalQuestionPaper').show();

      	
           var row = $(this).closest('tr');
         
            id = $(row).find('td').eq(0).html();
          var name = $(row).find('td').eq(2).html();
         var  rollNo= $(row).find('td').eq(3).html();
       var question=$('#question'+id).val();
           var answer=$('#answer'+id).val();

          $('#studentName1').text("Student Name: "+name);
          $('#studentRollNo').text("Roll No : "+rollNo);
        $('#teacherQuestion').val(question);
        if((answer.length)>1){
	          $('#teacherQuestionAnswer').val(answer);

        }
        else{
	          $('#teacherQuestionAnswer').val("");

        }
          
      }); 
	
}
  
  
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
   	  form_data.append("message", answer); // Adding extra parameters to form_data
   	  form_data.append("action", "mentorDoubtAnswer");
   	  $.ajax({
   		  type: "POST",
             enctype: 'multipart/form-data',
             url: "/College_Final_Year_Project/solveDoubt",
             data: form_data,
             processData: false,
             contentType: false,
             success: function(data,textStatus,jqXHR){
           	  $(".loader1").hide();
                 $('#myModal').hide();
           	  if(data.trim().includes('Successfully')){
           	   swal("Done", data, "success");
            	  fetchStudentDoubt();

           	  }else{
           		  swal("Error",data,"error");
           	  }
           	 $("#doubtSubmit").prop("disabled",false);
       	     $('#myModalQuestionPaper').show();
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


$('#postExamLink').click(function (event){
	event.preventDefault();
	examLink("postExamLink","examLink","joinExamLink","3");
});
  
  
function examLink(buttonId,filedId,LinkFieldId,examType){
  	$(".loader1").show();
      $('#myModal').show();
  	var meetingLink=$('#'+filedId).val();
    $("#"+buttonId).prop("disabled", true);
	  $.ajax({
		  type: "POST",
          url: "/College_Final_Year_Project/teacherLink", 
          data:{action:'semExamLink',examType:examType,departmentId:departmentId,semseter:year,section:sectionId,meetingLink:meetingLink},
          success: function(data,textStatus,jqXHR){
        	  $(".loader1").hide();
              $('#myModal').hide();
        	  if(data.includes('Successfully')){
        		  
        		  var linkActiveStatus=$('#'+LinkFieldId).css("pointer-events");
        		  
        		  if(linkActiveStatus.trim() =="none"){
        			  $('#'+LinkFieldId).css("pointer-events","auto");
        			$('#'+LinkFieldId).attr("href", meetingLink);
        			$('#'+LinkFieldId).attr("target", "_blank");
        		  }else{
        			  $('#'+LinkFieldId).attr("href", meetingLink);
          			$('#'+LinkFieldId).attr("target", "_blank");

        		  }
        	   swal("Done", data, "success");
        	  }else{
        		  swal("Error",data,"error");
        	  }
        	  $('#'+filedId).val("");
        	  $("#"+buttonId).prop("disabled", false);
        	
            },
          error:function(jqXHR,textStatus,errorThrown){
        	  $(".loader1").hide();
              $('#myModal').hide();
              swal("Error",data,"error");
        	  $("#"+buttonId).prop("disabled", false);
          }
	  }); 

}


$('#postRoutine').click(function (event){
	event.preventDefault();
	uploadfiles("postRoutine","routineFile","Routine");
});

$('#postSyllabus').click(function (event){
	event.preventDefault();
	uploadfiles("postSyllabus","syllabusFile","Syllabus");

});



function uploadfiles(buttonId,fileId,action){
	
	 $('#'+buttonId).prop("disabled", true);  
	 $(".loader1").show();
     $('#myModal').show();
    var file_data=   $('#'+fileId).prop("files")[0];    
	           if(file_data==null){
	        	  $(".loader1").hide();
	              $('#myModal').hide();
	        	  alert("Please choose a file");
	        		 $('#'+buttonId).prop("disabled", false);  
	          }
	          else{
	        	  var form_data = new FormData(); // Creating object of FormData class
	        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form_data
	        	  form_data.append("action",action);
	        	  form_data.append("courseTypeId",courseType);
	        	  form_data.append("departmentId",departmentId);
	        	  form_data.append("semesterId",year);
	        	  form_data.append("sectionId",sectionId);
	        	  
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/mentorUploadFiles",
	                  data: form_data,
	                  processData: false,
	                  contentType: false,
	                  success: function(data,textStatus,jqXHR){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                	  if(data.trim().includes("Successfully")){
	                	   swal("Done", data, "success");
	                	  
	                	  }else{
	                		  swal("Error",data,"error");
	                	  }
	                	  $('#'+fileId).val(null);
	                	
	                		 $('#'+buttonId).prop("disabled", false);  

	    	        	  
	                    },
	                  error:function(jqXHR,textStatus,errorThrown){
 	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                      swal("Error",data,"error");
	                      $('#'+fileId).val(null);
	                		 $('#'+buttonId).prop("disabled", false);  
	                  }
	        	  }); 
	          } 
}








$('#viewRoutine').click(function (event){
	event.preventDefault();
	fetchFiles("Routine Files","Routine");

});

$('#viewSyllabus').click(function (event){
	event.preventDefault();
	fetchFiles("Syllabus Files","Syllabus");
});

function fetchFiles(tableHeader,action){
	$('#myModalQuestionPaper2').show();
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/mentorUploadFiles?action=fetch&action1="+action+"&departmentId="+departmentId+"&semesterId="+year+"&sectionId="+sectionId+"&courseTypeId="+courseType,
	      success: function (data, textStatus, jqXHR) {
	    	  $('#myLoader1').hide();
	    	  $('#fetchFilesHeader').text("");
	    	  $('#fetchFilesHeader').text(tableHeader);
	    	  var JsonData= jQuery.parseJSON(data);
	    	  $('#fetchFilesBody').empty();
	    	 if(JsonData.length==0){
		     $("#fetchFilesBody").html('<tr class="no-records"><td colspan="3" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
	    	 }
	    	 else{
	          $(JsonData).each(function (index, item) {  
	        	  
	        
	        	 $('#fetchFilesBody').append(
	        			  '<tr>'+
	        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
	        			  '<td style="text-align: center;">'+item.name+'</td>'+
	        		       '<td style="text-align: center;">'+item.createDate+'</td>'+
	        		       '<td style="text-align: center;"><a href="/College_Final_Year_Project/mentorUploadFiles?action=download&action1='+action+'&id='+item.pkId+'" target="_self" >View</a></td>'+
	        	           '</tr>'
	        	  );
	        	  
	        	  
		      });
	    	 }
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
          alert("Sorry Something went wrong while loading.");
	      }
	    });
}
  


$('#uploadLinkMentor').click(function (event){
	event.preventDefault();
	 $('#uploadLinkMentor').prop("disabled", true);  
	 $(".loader1").show();
     $('#myModal').show();
     var form = $('#mentorlink')[0];
	        	  var form_data = new FormData(form); // Creating object of FormData class
	        	  form_data.append("courseTypeId",courseType);
	        	  form_data.append("departmentId",departmentId);
	        	  form_data.append("semesterId",year);
	        	  form_data.append("sectionId",sectionId);
	        	  
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/mentorUploadLink",
	                  data: form_data,
	                  processData: false,
	                  contentType: false,
	                  success: function(data,textStatus,jqXHR){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                	  if(data.trim().includes("Successfully")){
	                	   swal("Done", data, "success");
	                	  
	                	  }else{
	                		  swal("Error",data,"error");
	                	  }
	                	  $('#mentorlink')[0].reset();
	                	
	                	  $('#uploadLinkMentor').prop("disabled", false);  

	    	        	  
	                    },
	                  error:function(jqXHR,textStatus,errorThrown){
 	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                      swal("Error",data,"error");
	                      $('#mentorlink')[0].reset();
	                      $('#uploadLinkMentor').prop("disabled", false);  
	                  }
	        	  }); 
});
  

$('#viewLinkMentor').click(function (event){
	event.preventDefault();
	
	var linkType=$('#linkSelect').val();
	
	if(linkType.trim()=="Select Link Type"){
		alert("Please Select Link Type To View");
	}else{
		fetchLinks(linkType,linkType);
	}
	
	
});
  
  
function fetchLinks(tableHeader,action){
	$('#myModalQuestionPaper3').show();
	 $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/mentorUploadLink?action=fetch&linkType="+action+"&departmentId="+departmentId+"&semesterId="+year+"&sectionId="+sectionId+"&courseTypeId="+courseType,
	      success: function (data, textStatus, jqXHR) {
	    	  $('#myLoader1').hide();
	    	  $('#fetchLinksHeader').text("");
	    	  $('#fetchLinksHeader').text(tableHeader+" Links");
	    	  var JsonData= jQuery.parseJSON(data);
	    	  $('#fetchLinksBody').empty();
	    	 if(JsonData.length==0){
		     $("#fetchLinksBody").html('<tr class="no-records"><td colspan="3" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
	    	 }
	    	 else{
	          $(JsonData).each(function (index, item) {  
	        	  
	        
	        	 $('#fetchLinksBody').append(
	        			  '<tr>'+
	        			  '<td style="text-align: center;">'+item.SlNo+'</td>'+
	        		       '<td style="text-align: center;">'+item.createDate+'</td>'+
	        		       '<td style="text-align: center;"><a href='+item.link+' target="_blank" >View</a></td>'+
	        	           '</tr>'
	        	  );
	        	  
	        	  
		      });
	    	 }
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
          alert("Sorry Something went wrong while loading.");
	      }
	    });
}
  

$('#updateStudentRoolNo').click(function (event){
	event.preventDefault();
$('#myModalQuestionPaper1').hide();
$('#myModalQuestionPaper4').show();

});
  
$('#updateRollNo').click(function (event){
	event.preventDefault();
	 $('#updateRollNo').prop("disabled", true);  
	 $(".loader1").show();
     $('#myModal').show();
     var form = $('#roLLNoUpdate')[0];
	        	  var form_data = new FormData(form); // Creating object of FormData class
	        	  form_data.append("id",studentId);
	        	  form_data.append("action","update");
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/guideStudent",
	                  data: form_data,
	                  processData: false,
	                  contentType: false,
	                  success: function(data,textStatus,jqXHR){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                	  if(data.trim().includes("Successfully")){
	                	   swal("Done", data, "success");
	              		 fetchStudentList();

	                	  }else{
	                		  swal("Error",data,"error");
	                	  }
	                	  $('#roLLNoUpdate')[0].reset();
	                	
	                	  $('#updateRollNo').prop("disabled", false);  

	    	        	  
	                    },
	                  error:function(jqXHR,textStatus,errorThrown){
 	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                      swal("Error",data,"error");
	                      $('#roLLNoUpdate')[0].reset();
	                      $('#updateRollNo').prop("disabled", false);  
	                  }
	        	  }); 
});
  
  
  
   </script>
  
  
    <script src="script.js"></script>
</body>
</html>