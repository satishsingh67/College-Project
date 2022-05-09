<%@page import="com.college.teacher.dao.LinkManagement" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.college.model.TeacherDetails" %>
<%@page import="com.college.teacher.dao.UploadAndViewLabOtherData" %>
<%
TeacherDetails teacher=(TeacherDetails)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect("teacherLogin.jsp");
	return;
}
Integer fkTeacherPkId=teacher.getPkTeacherId();
Integer fkDepartment=teacher.getFkdepartment();
String subjectId=request.getParameter("subjectId");
String subjectName=request.getParameter("subjectName");
String subjectCode=request.getParameter("subjectCode");
String section=request.getParameter("section");
String year=request.getParameter("year");
String semester=request.getParameter("semester");
String courseId=request.getParameter("courseId");
String courseName=request.getParameter("courseName");

//Meeting Link
LinkManagement mettingLinks=new LinkManagement();
String dailyClassLink=mettingLinks.getDailyClassLink(String.valueOf(fkTeacherPkId), String.valueOf(fkDepartment), semester, section, subjectId);
String semExamLink=mettingLinks.getExamMeetingLink(3,String.valueOf(fkDepartment), String.valueOf(semester),String.valueOf(section), subjectId,String.valueOf(fkTeacherPkId));

//App Link
String labAppLink=mettingLinks.getApplicationLink(String.valueOf(fkTeacherPkId), String.valueOf(fkDepartment), semester, section, subjectId);

//Lab File Download

String labManual=new UploadAndViewLabOtherData().checkLabOthersFilesStatus(String.valueOf(fkTeacherPkId), String.valueOf(fkDepartment), semester,section, subjectId, "checkLabManual");
String labOtherData=new UploadAndViewLabOtherData().checkLabOthersFilesStatus(String.valueOf(fkTeacherPkId), String.valueOf(fkDepartment), semester,section, subjectId, "checkLabOtherData");


%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="Description" content="Enter your description here" />
  <title>teaches Lab</title>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
 
  <!-- OWN CSS -->
  <link rel="stylesheet" href="css/subject.css">
  <link rel="stylesheet" href="css/responsive-style.css">
  <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>
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
.link-btn{
   display: inline-block;
   padding:1rem 3rem;
   border-radius: .5rem;
   background-color: var(--blue);
   cursor: pointer;
   font-size: 1.7rem;
   color:var(--white);
}

.link-btn:hover{
   background-color: var(--black);
   color:var(--white);
}
.heading{
   text-align: center;
   font-size: 2rem;
   color:var(--black);
   text-transform: uppercase;
   font-weight: bolder;
   margin-bottom: 3rem;
}
    .about .row{
   min-height: 50vh;
}

.about .content span{
   font-size: 2rem;
   color:var(--blue);
}

.about .content h3{
   font-size: 3rem;
   color:var(--black);
   margin-top: 1rem;
}

.about .content p{
   padding:1rem 0;
   font-size: 1.4rem;
   color:var(--light-color);
   line-height: 2;
   
}
.process .box-container{
   display: grid;
   grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
   gap:1rem;
}

.process .box-container .box{
   background-color: var(--blue);
   padding:2rem;
   border-radius: .5rem;
   text-align: center;
   box-shadow: var(--box-shadow);
}

.process .box-container .box img{
   height: 10rem;
   margin:1rem 0;
}

.process .box-container .box h3{
   font-size: 2rem;
   color:var(--white);
   margin:1.5rem 0;
}

.process .box-container .box p{
   font-size: 1.5rem;
   color:var(--white);
   line-height: 2;
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
}
th{
 position: sticky;
     top: 0px;
     height:10px;
}
td{
height:1px;
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
      margin-top: 10%;
      padding: 20px;
      border: 1px solid #888;
      width: 45%;
      height: 55%;
    }


  .modalViewQuestionPaper6 {
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
    .modal-contentViewQuestionPaper6 {
      background-color: #fefefe;
      margin: auto;
      margin-top: 10%;
      padding: 20px;
      border: 1px solid #888;
      width: 50%;
      height: 60%;
    }




  </style>
</head>

<body>
  <!-- header design -->
  <header>
    <nav class="navbar navbar-expand-lg navigation-wrap">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="images/GNIT_Kolkata_logo.png"></a>
       
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
          aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-stream navbar-toggler-icon"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="teacherPage.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#application">Application </a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#notes">lab Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#doubt">Doubt Clearence</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#assignment">Lab Copy Submission</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#exam">Exams</a>
            </li>
            <li class="nav-item">
         <a href="/College_Final_Year_Project/logout?action=teacher" class="nav-link">Logout</a>
            </li>
            <li><img class="images" src="images/teachers/1200px-JIS_University.svg.png"></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
   
  <!-- section-1 top-banner -->
  <section id="home">
    <div class="container-fluid px-0 top-banner">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-6">
             <h3 style="font-family: 'Times New Roman', Times, serif;"><%= subjectName+" ["+subjectCode+"]" %></h3>
            <p style="font-family: 'Times New Roman', Times, serif;color:black;font-size:20px;"><%=(Integer.parseInt(year)==1)?(year+"st Year"):(Integer.parseInt(year)==2)?( year+"nd Year"):(Integer.parseInt(year)==3)?(year+"rd Year"):year+"th Year"%> 
           <%=","+((Integer.parseInt(semester)==1)?(semester+"st Semester"):(Integer.parseInt(semester)==2)?( semester+"nd Semester"):
            	(Integer.parseInt(semester)==3)?(semester+"rd Semester"):semester+"th Semester")%>
            	</b></p>
            <p style="font-family: 'Times New Roman', Times, serif;color:black;font-size:20px;"><%=teacher.getDepartmentName()+"-"+section%></p>
            
            <div class="mt-4">
             <%
            if(dailyClassLink != null){
            %>
              <a href="<%=dailyClassLink%>" target="_blank" id="joinClassLink" class="btn btn-primary btn-md">Join Class <i class="fas fa-users-class"></i></a>
             <% 
            }else{
           %>
           <a href="<%=dailyClassLink%>" target="_blank" id="joinClassLink" class="btn btn-primary btn-md disabled">Join Class <i class="fas fa-users-class"></i></a>  
            <%
            }
            %>
            </div>
            <br>
             <input type="text" style="height:37px;" id="classLink" placeholder="Enter class link">
             <button  class="btn btn-primary" id="uploadClassLink">Upload Class Link <i class="fas fa-users-class"></i></button>
         
         <br><br>
         
         <%
         
         String attendanceUrl="AttendanceCheckTeacher.jsp?subjectName="+subjectName+"&subjectCode="+subjectCode+"&subjectId="+subjectId+"&departmentId="+fkDepartment+"&sectionId="+section+"&semseter="+semester+"&courseId="+courseId;
         %>
         
          <button  class="btn btn-primary" id="takeAttendance">Take Attendance <i class="fas fa-users-class"></i></button>
         <a href="<%=attendanceUrl %>" target="_blank" class="btn btn-primary" id="">View Attendance <i class="fas fa-users-class"></i></a>
          
         
          </div>

          <div class="col-lg-5 col-md-6">
            <img src="images/Second213-224.svg" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </section>
  <hr>
  <!-- section-3 story-->
  <section class="about" id="application">

    <div class="container">
 
       <div class="row align-items-center">
 
          <div class="col-md-6 image">
             <img src="./image/unnamed.jpg" class="w-100 mb-5 mb-md-0" alt="">
          </div>
 
          <div class="col-md-6 content">
            <% %>
             <h3>Application Link</h3>
             <p>Join The virtual Lab With This Application Link</p>
            <input type="text" style="height:40px;" id="appLink" placeholder="Enter Application link">
              <button class="btn btn-primary btn-lg" id="uploadAppLink">Upload Link  <i class="fas fa-users-class"></i></button>
           <%
             if(labAppLink==null){
             %>
           <a class="btn btn-primary btn-lg disabled" target="_blank" id="joinAppLink">Join Link <i class="fas fa-users-class"></i></a>
           <%
             }else{
           %>
         <a href="<%=labAppLink %>" class="btn btn-primary btn-lg" target="_blank" id="joinAppLink">Join Link <i class="fas fa-users-class"></i></a>
           <%
             }
           %>
          
          </div>
 
       </div>
 
    </div>
 </section>
 <hr>
    <section class="process" id="notes" style="background:rgb(226, 241, 157);">

      <h1 class="heading" >Lab Manual & Information</h1>
   
      <div class="box-container container" >
   
         <div class="box">
            <img src="image/lab1.jpg" alt="">
            <p>Post Lab Manual</p>
            <form >
                
                <input type="file" id="labManualFile" placeholder="Choose File">
                <input type="submit" id="labManualFileButton" value="Post" class="main-btn mt-4">
             
              <%
            if(labManual==null){
            %>
                <input type="submit" value="View" class="main-btn mt-4" disabled style="background-color: rgb(37, 219, 37);">
            <%
            }else{    
            %>  
             <a href="/College_Final_Year_Project/lab?action=Download&action1=downloadLabManual&id=<%=labManual %>" target="_self"   class="main-btn mt-4">View <i class="fas fa-users-class"></i></a>
            
            <%
            }
            %>
             </form>
            
         </div>
   
         <div class="box">
            <img src="image/unnamed.png" alt="">
            <p>Post Other Lab Information</p>
            <form action="">
                
                <input type="file" id="otherManualFile" placeholder="Choose File">
                <input type="submit" id="otherManualFileButton" value="Post" class="main-btn mt-4">
             
               <%
            if(labOtherData==null){
            %>
         <input type="submit"  value="View" class="main-btn mt-4" disabled style="background-color: rgb(37, 219, 37);">
            
           <%
            }else{    
            %>            
            <a href="/College_Final_Year_Project/lab?action=Download&action1=downloadLabOtherFile&id=<%=labOtherData %>" target="_self"   class="main-btn mt-4">View<i class="fas fa-users-class"></i></a>
            
            <%
            }
            %>
             </form>
         </div>
   
         <br>
   
      </div>
   
   </section>
<br>
<section id="doubt" style="background-color: darkgrey;">
    <div class=" wrapper">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7 col-md-12 mb-lg-0 mb-5">
            <h2 style="text-align:center;">Student's Question</h2>
            <div class="card border-0">
                <div class="col-md-12">
                <!--Table-->
            <div style=" height:470px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="display:none;"></th>
              <th style="text-align:center;">Student Name</th>
              <th style="text-align:center;">Roll No</th>
              <th style="text-align:center;">Create Date</th>
              <th style="text-align:center;">Update Date</th>
              <th style="text-align:center;">Question</th>
              <th style="text-align:center;">Answer</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
            <tr class="doubtRow">
            <td>
            hhh
            </td>
            </tr>
          </tbody>
           </table>
           </div>
                    </div>
            
            </div>
          </div>
          <div class="col-lg-5 col-md-12 text-sec">
           <h2>Replay To The Students</h2>
           <form action="">
                <label style="height:25px;display:none;" class="details"><p id="doubtStudentId" style="font-size:20px;"><b></b></p></label>
                <label style="height:25px;" class="details"><p id="doubtStudentName"  style="font-size:20px;"><b>Student Name:</b></p></label>
               <br>
               
                <label id="doubtStudentRollNo" style="height:25px;" class="details"><p style="font-size:20px;"><b>Roll No:</b></p></label>
              <textarea name="doubtQuestion" id="doubtQuestionStudent" placeholder="Question" readonly  style="height:100px;"  cols="30" rows="5"></textarea>
              <textarea name="doubtAnswer" id="doubtAnswerStudent" placeholder="Answer" style="height:200px;"   cols="30" rows="5"></textarea>               
              <input type="submit" id="doubtSubmit"  value="send message" class="main-btn" style="margin-top:-110px;">
         
            </form>
             
          </div>
        </div>
      </div>
      </div>
      </section>

       
   <section id="assignment">
    <div class="about-section wrapper"style=" background-image: url(./images/light.jpg);background-repeat: no-repeat;background-size: cover;">
      <div class="container">
       
       <div id="assignment"class="container food-type" style="background-color:darkseagreen;">
           <div class="row align-items-center">
             <div class="col-lg-5 col-md-12 text-sec mb-lg-0 mb-5">
                <h2>Lab Copy Submission</h2>
                <p>Check All The Lab Copy And Outputs</p>
                <ul class="list-unstyled py-3">
                     <%
          String weekLyLabUrl="dynamicTableTeacher.jsp?action=WeeklyLab&examType=Weekly Lab File&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
                  <li><a href="<%= weekLyLabUrl %>" target="_blank"><span>Check Weekly Lab Experiment</span></a>
                   </li>
                     <%
          String LabOutPutUrl="dynamicTableTeacher.jsp?action=WeeklyLabOutput&examType=Lab Experiment File&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>  
                  <li><a href="<%=LabOutPutUrl %>" target="_blank"><span>Check Experment Output</span></a>
                   </li>
                           <%
          String finalLabCopy="dynamicTableTeacher.jsp?action=FInalLabCopy&examType=Final Lab Copy Files&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
                  <li>
                   <a href="<%=finalLabCopy %>" target="_blank"><span>Check Final LabCopy</a>
                    </li>
                </ul> 
                
              
             </div>
             <div class="col-lg-7 col-md-12">
               <div class="card border-0">
                 <img src="images/Good-Grade.svg" class="img-fluid">
               </div>
             </div>
           </div>
         </div>
       </div>
        </div>
        
      </div>
      <hr>
      <hr>
     
  </section>

  

  <!-- section-4 explore food-->
   <section id="exam">
     <div class="explore-food wrapper " style=" background-color: lightcyan;">
       <div class="container">
         <div class="row">
           <div class="col-sm-12">
             <div class="text-content text-center">
                <h2>Lab Examination</h2>
              <h2> <span>Semester  Exam</span></h2>
            
           </div>
         </div>
         <div class="row pt-5">
            <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
              <div class="card">
                  <h3>Share Question Paper</h3>
                  <div>
           <input type="file" style="width:105px;" id="semPaperFile" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="semPaperFileButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary" id="viewSemsterPaper">View</button>   
                  </div>
  
              </div>
            </div>
            <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
             <div class="card">
              <h3 style="text-align: center;">Invigilation Link</h3>
              <div style="text-align:center;">
            <%
            if(semExamLink != null){
            %>
        <a href="<%=semExamLink%>" class="btn btn-primary btn-md" target="_blank" >Join<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=semExamLink%>" class="btn btn-primary btn-md disabled">Join<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>     
              </div>
             </div>
           </div>
           <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
             <div class="card">
              <h3 style="text-align: center;">Check Answer Paper</h3>
              <div style="text-align:center;">
                <%
          String semUrl="dynamicTableTeacher.jsp?action=exam&examType=Semester Lab Exam&examTypeCode=3&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
          <a href="<%=semUrl%>" target="_blank" class="btn btn-primary">Check</a>      
           
              </div>
             </div>
           </div>
   </section>

   
  
  <!-- section-9 footer-->
  <footer id="footer">
    <div class="footer py-5">
      <div class="container">
        <div class="row">
        
          <div class="col-sm-12">
            <div class="footer-copy">
              <div class="copy-right text-center pt-5">
                <p class="text-light">@Developer - Sornali Hazra & Satish Singh</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
   
  <!-- Loader Modal Start -->
   <div id="myModal" class="modalLoader">

    <!-- Modal content -->
    <div class="modal-content-loader">
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

<!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper"  id="myModalQuestionPaper">
    <div class="modal-contentViewQuestionPaper">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;">View Question Paper</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        
       <label><b>Paper Name:</b></label>
        <label id="questionPaperName"></label>
        <br>
        <br>
       <label><b>Download Question Paper</b></label>
       <a  target="_self" id="questionPaperView"  class="btn btn-primary" style="margin-left:135px;width:75px;">View</a> 
       <br> 
       <br> 
       <label><b>Enable/Disable Question Paper Download</b></label>              
     <button id="questionPaperActive" style="margin-left:15px;" class="btn btn-primary">Enable</button> 
     <br>
     <br>
     <label><b>Enable/Disable Answer Script Submission</b></label>                  
     <button id="questionPaperAnswerActive" style="margin-left:12px;"  class="btn btn-primary">Enable</button>            
         
        
  </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" id="closeQuestionPaperModel" class="btn btn-danger">Close</button>
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->


<!-- The  Question Paper Modal -->
<div class="modalViewQuestionPaper6"  id="myModalQuestionPaper6">
    <div class="modal-contentViewQuestionPaper6">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;">Take Attendance</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        <div  style="height:200px;border:1px solid skyblue;overflow-y: auto;">
      <table id="customers" class="table table-striped">
    <thead style="color:skyblue;padding: 8px 15px;background-color:green;">
        <th style="text-align: center;"> <input type="checkbox" id="selectAll"></th>
     <th style="text-align: center;">Sl.No</th>
        
        <th style="text-align: center;">Name</th>
        
    </thead>
    <tbody id='attendanceBody'>
  
 
 	</tbody>
  </table>
  </div>
    
   <button id="submitAttendance" style="margin-top:12px;"  class="btn btn-primary">Submit</button>            
        
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel6" class="btn btn-danger">Close</button>
      </div>

    </div>
</div>
<!-- View Question Paper Modal end -->


  <!-- JS Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
  <!-- own js -->
  <script src="js/subject1.js"></script>
  
 
  
  
 <script>
  var fkTeacherPkId=<%= fkTeacherPkId%>;
  var fkDepartment=<%= fkDepartment%>;
  var fksubjectId=<%= subjectId%>;
  var subjectName='<%= subjectName%>';
  var subjectCode='<%= subjectCode%>';
  var fkTeacherPkId=<%= fkTeacherPkId%>;
  var fkSectionId=<%= section%>;
  var fkYear=<%= year%>;
  var fkSemester=<%= semester%>;
  var courseTypeId=<%=courseId%>;

  
  $(document).ready(function () {
	console.log("Page loaded");
	
	  fetchStudentDoubt();
	  fetchstudentList();

  });
  
	function myFunction(){
		
		  $('.doubtRow').on('click',function(){
				
				var row = $(this).closest('tr');
			    
			    var id = $(row).find('td').eq(0).html();
			    var name = $(row).find('td').eq(1).html();
			    var rollNo = $(row).find('td').eq(2).html();
			    var question=$(row).find('td').eq(5).text();
			    var answer=$(row).find('td').eq(6).text();

			    
			    $('#doubtStudentName').empty();
			    $('#doubtStudentRollNo').empty();
			    $('#doubtStudentId').empty();
			    $('#doubtQuestionStudent').text("");
			    $('#doubtStudentId').text(id);
			    $('#doubtStudentName').text("Student Name:"+name);
			    $('#doubtStudentRollNo').text("Roll No:"+rollNo);
			    $('#doubtQuestionStudent').text(question);
			 
			    if(answer.trim().length>0){
				    $('#doubtAnswerStudent').val(answer);

			    }else{
				    $('#doubtAnswerStudent').val("");
			    }
			    
			    $('#doubtStudentName').css("font-size","20px");
			    $('#doubtStudentName').css("color","black");
			    $('#doubtStudentRollNo').css("font-size","20px");
			    $('#doubtStudentRollNo').css("color","black");
			  
			});
			
			
		}
	 $('#doubtSubmit').click(function (event){
			event.preventDefault();
      	  $("#doubtSubmit").prop("disabled", true);
      	
         $('#myModal').show();
         $(".loader1").show();
         
			var id=  $('#doubtStudentId').text();
			var answer=  $('#doubtAnswerStudent').val();
			
		  if(id==""){
				alert("Please Select a doubt to answer");
				 $(".loader1").hide();
                 $('#myModal').hide();
                 $("#doubtSubmit").prop("disabled", false);
			}
			else if(answer==""){
				alert("Please answer the question");
				 $(".loader1").hide();
                 $('#myModal').hide();
                 $("#doubtSubmit").prop("disabled", false);
			}
			else{
				
				var form_data = new FormData();
				  form_data.append("action", 'updateDoubtStudent');
				  form_data.append("id", id);
				  form_data.append("message",answer);

				  
				 $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/solveDoubt",
	                  data:form_data,
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
	                	  fetchStudentDoubt();
	                	  $("#doubtSubmit").prop("disabled", false);
	    	        	  
	                    },
	                  error:function(jqXHR,textStatus,errorThrown){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                      swal("Error",data,"error");
	                	  $("#doubtSubmit").prop("disabled", false);
	                  }
	        	  }); 
				
				
			}
			
			

		});
	  
	 function fetchStudentDoubt(){
		 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/solveDoubt?action=viewDoubt&teacherId="+fkTeacherPkId+"&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#Table').empty();
		    	 if(JsonData.length==0){
			     $("#Table").html('<tr class="no-records"><td colspan="6" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  
		        
		        	 $('#Table').append(
		        			  '<tr class="doubtRow" onclick=myFunction() style="height:20px">'+
		        			  '<td style="text-align: center;display:none;">'+item.doubtId+'</td>'+
		        			  '<td style="text-align: center;">'+item.studentName+'</td>'+
		        			  '<td style="text-align: center;">'+(item.rollNo==null?" ":item.rollNo)+'</td>'+
		        		       '<td style="text-align: center;">'+item.createDate+'</td>'+
		        		         '<td style="text-align: center;">'+(item.updateDate == null ?" ":item.updateDate)+'</td>'+
		        		        '<td style="text-align: center;"><textarea rows="2" cols="20">'+item.question+'</textarea></td>'+
		        		        '<td style="text-align: center;"><textarea rows="2" cols="20">'+(item.answer == null ?" ":item.answer)+'</textarea></td>'+
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
  

  
  $('#uploadClassLink').click(function (event){
	  	event.preventDefault();
	  	$(".loader1").show();
	      $('#myModal').show();
	  	var meetingLink=$('#classLink').val();
	    $("#uploadClassLink").prop("disabled", true);
		  $.ajax({
    		  type: "POSt",
              url: "/College_Final_Year_Project/teacherLink", 
              data:{action:'dailyClasslink',teacherId:fkTeacherPkId,departmentId:fkDepartment,semseter:fkSemester,section:fkSectionId,subjectId:fksubjectId,meetingLink:meetingLink},
              success: function(data,textStatus,jqXHR){
            	  $(".loader1").hide();
                  $('#myModal').hide();
            	  if(data.includes('Successfully')){
            		  
            		  var linkActiveStatus=$('#joinClassLink').attr('class');
            		  
            		  if(linkActiveStatus.trim() =="btn btn-primary btn-md disabled"){
            			 $('#joinClassLink').removeClass("btn btn-primary btn-md disabled");
            			 $('#joinClassLink').addClass("btn btn-primary btn-md");
            			 $("#joinClassLink").attr("href", meetingLink);
            			 $("#joinClassLink").attr("target", "_blank");
            		  }else{
            			  $("#joinClassLink").attr("href", meetingLink);
             			 $("#joinClassLink").attr("target", "_blank");

            		  }
            	   swal("Done", data, "success");
            	  }else{
            		  swal("Error",data,"error");
            	  }
            	  $('#classLink').val("");
            	  $("#uploadClassLink").prop("disabled", false);
                },
              error:function(jqXHR,textStatus,errorThrown){
            	  $(".loader1").hide();
                  $('#myModal').hide();
                  swal("Error",data,"error");
            	  $("#uploadClassLink").prop("disabled", false);
              }
    	  }); 

	});
  
   
  $('#uploadAppLink').click(function (event){
	  	event.preventDefault();
	  	$(".loader1").show();
	      $('#myModal').show();
	  	var appLink=$('#appLink').val();
	    $("#uploadAppLink").prop("disabled", true);
		  $.ajax({
  		  type: "POSt",
            url: "/College_Final_Year_Project/teacherLink", 
            data:{action:'appLink',teacherId:fkTeacherPkId,departmentId:fkDepartment,semseter:fkSemester,section:fkSectionId,subjectId:fksubjectId,appLink:appLink},
            success: function(data,textStatus,jqXHR){
          	  $(".loader1").hide();
                $('#myModal').hide();
          	  if(data.includes('Successfully')){
          		  
          		  var linkActiveStatus=$('#joinAppLink').attr('class');
          		  
          		  if(linkActiveStatus.trim() =="btn btn-primary btn-lg disabled"){
          			 $('#joinAppLink').removeClass("btn btn-primary btn-lg disabled");
          			 $('#joinAppLink').addClass("btn btn-primary btn-lg");
          			 $("#joinAppLink").attr("href", appLink);
          		  }else{
          			  $("#joinAppLink").attr("href", appLink);
          		  }
          	   swal("Done", data, "success");
          	  }else{
          		  swal("Error",data,"error");
          	  }
          	  $('#appLink').val("");
          	  $("#uploadAppLink").prop("disabled", false);
              },
            error:function(jqXHR,textStatus,errorThrown){
          	  $(".loader1").hide();
                $('#myModal').hide();
                swal("Error",data,"error");
          	  $("#uploadAppLink").prop("disabled", false);
            }
  	  }); 

	});
  
  $('#viewSemsterPaper').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper').show();
	});

$('#closeQuestionPaperModel').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper').hide();
	});
  
$('#semPaperFileButton').click(function (event){
	event.preventDefault();
	postQuestionPaper("semPaperFileButton","semPaperFile","3");
});

function postQuestionPaper(buttonId,fileId,examType){
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
	        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form
	        	  form_data.append("teacherId",fkTeacherPkId);
	        	  form_data.append("departmentId",fkDepartment);
	        	  form_data.append("semesterId",fkSemester);
	        	  form_data.append("sectionId",fkSectionId);
	        	  form_data.append("subjectId",fksubjectId);
	        	  form_data.append("examType",examType);
	        	  
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/postQuestionPaper",
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
$('#labManualFileButton').click(function (event){
	event.preventDefault();
	postLabFile("labManualFileButton","labManualFile","manual");

});  

$('#otherManualFileButton').click(function (event){
	event.preventDefault();
	postLabFile("otherManualFileButton","otherManualFile","other");
});
  
function postLabFile(buttonId,fileId,query){
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
	        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form
	        	  form_data.append("teacherId",fkTeacherPkId);
	        	  form_data.append("departmentId",fkDepartment);
	        	  form_data.append("semesterId",fkSemester);
	        	  form_data.append("sectionId",fkSectionId);
	        	  form_data.append("subjectId",fksubjectId);
	        	  form_data.append("action","upload");
	        	  form_data.append("query",query);
	        	  
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/labOtherData",
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

$('#viewSemsterPaper').click(function (event){
	event.preventDefault();
	fetchQuestionPaperDetails(3,"viewSemsterPaper");
});

$('#closeQuestionPaperModel').click(function (event){
	event.preventDefault();
	 $('#myModalQuestionPaper').hide();
});

//Question paper Action

var paperId,paperActive,answerActive;

function fetchQuestionPaperDetails(examType,buttonId){
 $('#myModal').show();
 $(".loader1").show();
$('#'+buttonId).prop("disabled", true);
  var form_data = new FormData(); // Creating object of FormData class
  form_data.append("teacherId",fkTeacherPkId);
  form_data.append("departmentId",fkDepartment);
  form_data.append("semesterId",fkSemester);
  form_data.append("sectionId",fkSectionId);
  form_data.append("subjectId",fksubjectId);
  form_data.append("examType",examType);
  form_data.append("action","viewPaperDetails");
	$('#questionPaperName').text("");

  $.ajax({
	  type: "GET",
      url: "/College_Final_Year_Project/postQuestionPaper?action=viewPaperDetails&teacherId="+fkTeacherPkId+"&departmentId="+fkDepartment+"&semesterId="+fkSemester
    		  +"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&examType="+examType,
      success: function(data,textStatus,jqXHR){
    	  var JsonData= jQuery.parseJSON(data);

    	  $('#'+buttonId).prop("disabled", false);
    	    
        if(data.length>2){
        	paperId=JsonData.id;
        	paperActive=JsonData.isActive;
        	answerActive=JsonData.isActiveAnswer;
        	$('#questionPaperName').text(JsonData.paperName);
        	 $('#questionPaperView').removeClass("btn btn-primary disabled");
			 $('#questionPaperView').addClass("btn btn-primary");
			 $('#questionPaperActive').prop("disabled", false);
        	 $('#questionPaperAnswerActive').prop("disabled", false);
			 if(JsonData.isActive=="0"){
				 $("#questionPaperActive").text('Enable');
			 }else{
				 $("#questionPaperActive").text('Disable');
			 }
			 
			if(JsonData.isActiveAnswer=="0"){
				 $("#questionPaperAnswerActive").text('Enable');
			}
			else{
				 $("#questionPaperAnswerActive").text('Disable');
			}
			 var link="/College_Final_Year_Project/paper?action=questionPaperDownload&id="+JsonData.id;
			  $("#questionPaperView").attr("href",link);
        }else{
        	$('#questionPaperName').text("Sorry No Paper Found.");
        	 $('#questionPaperView').removeClass("btn btn-primary");
			 $('#questionPaperView').addClass("btn btn-primary disabled");
        	 $('#questionPaperActive').prop("disabled", true);
        	 $('#questionPaperAnswerActive').prop("disabled", true);
        }
        $('#myModal').hide();
  	  $(".loader1").hide();
        $('#myModalQuestionPaper').show();
        },
      error:function(jqXHR,textStatus,errorThrown){
          swal("Error",data,"error");
          $('#myModal').hide();
    	  $(".loader1").hide();
          $('#myModalQuestionPaper').show();
        	  $('#'+buttonId).prop("disabled", false);
      }
  }); 
}


$('#questionPaperActive').click(function (event){
	event.preventDefault();
	enableAndDisable("questionPaperActive",paperId,"enableQuestionPaper",paperActive);
});

$('#questionPaperAnswerActive').click(function (event){
	event.preventDefault();
	enableAndDisable("questionPaperAnswerActive",paperId,"enableAnswer",answerActive);
});


function enableAndDisable(buttonId,id,action,isActive){
  $('#'+buttonId).prop("disabled", true);
	 $('#myModalQuestionPaper').hide();
  $('#myModal').show();
  $(".loader1").show();
$.ajax({
	  type: "GET",
    url: "/College_Final_Year_Project/postQuestionPaper?action=updateQuestionPaper&action1="+action+"&id="+id+"&isActive="+isActive,
    success: function(data,textStatus,jqXHR){
  	 $(".loader1").hide();
     $('#myModal').hide();
		 $('#myModalQuestionPaper').show();
	  if(data.trim().includes("Successfully")){
		  if(isActive=="0"){
	       $("#"+buttonId).text('Disable');
		  }else{
   	       $("#"+buttonId).text('Enable');
		  }
		  if(action.trim()=="enableAnswer"){
			  answerActive=(isActive=="0"?1:0);	  
		  }else{
			  paperActive=(isActive=="0"?1:0);	
		  }

		  swal("Done", data, "success");
	       
	       }else{
		  swal("Error",data,"error");
	       }
  	  $('#'+buttonId).prop("disabled", false); 
      },
    error:function(jqXHR,textStatus,errorThrown){
    	 $(".loader1").hide();
         $('#myModal').hide();
        swal("Error",data,"error");
        $('#'+buttonId).prop("disabled", false);
			 $('#myModalQuestionPaper').show();
    }
}); 	
}

//Attendance Module

$('#takeAttendance').click(function (event){
		event.preventDefault();
		 $('#myModalQuestionPaper6').show();
	});

$('#closeQuestionPaperModel6').click(function (event){
	event.preventDefault();
	 $('#myModalQuestionPaper6').hide();
        $("#selectAll").prop('checked', false);

	 $('#attendanceBody tr td input[type="checkbox"]').each(function(){
            $(this).prop('checked', false);
        });
	 
});



function fetchstudentList(){
	  $.ajax({
	      type: "GET",
	      url:"/College_Final_Year_Project/attendance?action=studentList&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&courseTypeId="+courseTypeId,
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	    	  $('#attendanceBody').empty();
	    	 if(JsonData.length==0){
		     $("#attendanceBody").html('<tr class="no-records"><td colspan="3" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
	    	 }
	    	 else{
	          $(JsonData).each(function (index, item) {  
	        	  $('#attendanceBody').append(
	        			  '<tr class="row-select">'
	        			  	+'<td style="text-align: center;display:none">'+item.pkId+'</td>'
							+'<td style="text-align: center;"><input type="checkbox"></td>'
							+'<td style="text-align: center;">'+item.SlNo+'</td>'
							+'<td style="text-align: center;">'+item.name+'</td>'
							+'</tr>'
	        	 
	        	  );
		      });
	    	 }
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
         alert("Sorry Something went wrong while loading ");
	      }
	    });
}
$('#selectAll').click(function (e) {
    $(this).closest('table').find('td input:checkbox').prop('checked', this.checked);
});

$('#submitAttendance').click(function (event){
	event.preventDefault();
	 $('#myModalQuestionPaper6').hide();
	  $('#myModal').show();
	  $(".loader1").show();
	 var presentId = new Array();
	 var absentId = new Array();

	 
	$('.row-select input:checked').each(function() {
	      var id;
	      id = $(this).closest('tr').find('td').eq(0).text();
	      presentId.push(id);
	    });
	$('.row-select input:not(:checked)').each(function() {
	      var id;
	      id = $(this).closest('tr').find('td').eq(0).text();
	      absentId.push(id);
	    });
	
	submitAttendanceMethod(presentId,absentId);
  		});


function submitAttendanceMethod(presentId,absentId){

	 var form_data = new FormData(); // Creating object of FormData class
	  form_data.append("action", "submitAttendance"); // Appending parameter named file with properties of file_field to form
	  form_data.append("teacherId",fkTeacherPkId);
	  form_data.append("departmentId",fkDepartment);
	  form_data.append("semesterId",fkSemester);
	  form_data.append("sectionId",fkSectionId);
	  form_data.append("subjectId",fksubjectId);
	  form_data.append("courseTypeId",courseTypeId);
	  form_data.append("presentId",presentId);
	  form_data.append("absentId",absentId);
	  
	  $.ajax({
		  type: "POST",
        enctype: 'multipart/form-data',
        url: "/College_Final_Year_Project/attendance",
        data: form_data,
        processData: false,
        contentType: false,
	    success: function(data,textStatus,jqXHR){
	  	 $(".loader1").hide();
	     $('#myModal').hide();
			 $('#myModalQuestionPaper6').show();
		  if(data.trim().includes("Successfully")){
			  $("#selectAll").prop('checked', false);
				 $('#attendanceBody tr td input[type="checkbox"]').each(function(){
			            $(this).prop('checked', false);
			        });
			  swal("Done", data, "success");	       
		       }else{
			  swal("Error",data,"error");
		       }
	      },
	    error:function(jqXHR,textStatus,errorThrown){
	    	$('#myModalQuestionPaper6').show();
	    	$(".loader1").hide();
	         $('#myModal').hide();
	        swal("Error",data,"error");
				 
	    }
	});

}
 


  </script> 

</body>
</html>

