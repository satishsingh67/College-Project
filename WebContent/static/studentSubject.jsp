<%@page import="com.college.model.Student" %>
<%@page import="com.college.dao.studentDao.MapStudentSubjectDao" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.college.dao.Link.MettingLinks"%>
<%@page import=" com.college.dao.Exam.ExamPaper"%>
<%@page import=" com.college.dao.Exam.AnswerScript"%>
<%
Student student=(Student)session.getAttribute("student");
if(student==null){
	response.sendRedirect("studentLogin.jsp");
	return;
}
Integer studentId=student.getPkRegistrationId();
Integer departmentId= student.getFkdepartment();
Integer sectionId=student.getSection();
Integer semesterId=student.getSemester();
Integer courseTypeId=student.getCourseTypeId();



String subjectId=request.getParameter("subjectId");
String subjectName=request.getParameter("subjectName");
String subjectcode=request.getParameter("subjectCode");
MapStudentSubjectDao mapStudentSubjectDaoObj=new MapStudentSubjectDao();
Integer notesCount=mapStudentSubjectDaoObj.getTotalNotes(departmentId, semesterId, sectionId, Integer.parseInt(subjectId),courseTypeId) ;
Integer suggestionCount=mapStudentSubjectDaoObj.getTotalSuggestion(departmentId, semesterId, sectionId, Integer.parseInt(subjectId),courseTypeId);
Integer questionBankCount=mapStudentSubjectDaoObj.getTotalQuestionBank(departmentId, semesterId, sectionId, Integer.parseInt(subjectId),courseTypeId);

//Meeting links
MettingLinks mettingLinks=new MettingLinks();
String dailyClassLink=mettingLinks.getDailyClassLink(String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
String unitTest1Link=mettingLinks.getExamMeetingLink(1,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
String unitTest2Link=mettingLinks.getExamMeetingLink(2,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
String semExamLink=mettingLinks.getExamMeetingLink(3,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);

//Exam Paper
Map<String,Object> unitTest1PaperStatus =new ExamPaper().getExamPaperActiveStatus(1,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
Map<String,Object> unitTest2PaperStatus =new ExamPaper().getExamPaperActiveStatus(2,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
Map<String,Object> semPaperStatus =new ExamPaper().getExamPaperActiveStatus(3,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);

//Answer Script

AnswerScript answerScriptObj=new AnswerScript();

Map<String,Object> unitTest1AnswerSubmissionStatus =new HashMap<String,Object>();
Map<String,Object> unitTest2AnswerSubmissionStatus =new HashMap<String,Object>();
Map<String,Object> semExamAnswerSubmissionStatus =new HashMap<String,Object>();

unitTest1AnswerSubmissionStatus.put("status", false);
unitTest2AnswerSubmissionStatus.put("status", false);
semExamAnswerSubmissionStatus.put("status", false);

if((boolean)unitTest1PaperStatus.get("status")){

	unitTest1AnswerSubmissionStatus =answerScriptObj.checkAnswerScriptSubmissionStatus(String.valueOf(unitTest1PaperStatus.get("pkQuestionPaperId")),"1");
}

if((boolean)unitTest2PaperStatus.get("status")){
	unitTest2AnswerSubmissionStatus =answerScriptObj.checkAnswerScriptSubmissionStatus(String.valueOf(unitTest2PaperStatus.get("pkQuestionPaperId")),"2");
}

if((boolean)semPaperStatus.get("status")){
	semExamAnswerSubmissionStatus =answerScriptObj.checkAnswerScriptSubmissionStatus(String.valueOf(semPaperStatus.get("pkQuestionPaperId")),"3");
}

// AnswerScript Download Status Check

Map<String,Object> unitTest1AnswerScriptCheckForDownload =new HashMap<String,Object>();
Map<String,Object> unitTest2AnswerScriptCheckForDownload =new HashMap<String,Object>();
Map<String,Object> semExamAnswerScriptCheckForDownload =new HashMap<String,Object>();

unitTest1AnswerScriptCheckForDownload.put("status",false);
unitTest2AnswerScriptCheckForDownload.put("status",false);
semExamAnswerScriptCheckForDownload.put("status",false);

Map<String,Object> unitTest1PaperStatus1 =new ExamPaper().getExamPaperActiveStatus1(1,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
Map<String,Object> unitTest2PaperStatus1 =new ExamPaper().getExamPaperActiveStatus1(2,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
Map<String,Object> semPaperStatus1 =new ExamPaper().getExamPaperActiveStatus1(3,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);



//checking file is present or not for download
if((boolean)unitTest1PaperStatus1.get("status")){
unitTest1AnswerScriptCheckForDownload =answerScriptObj.checkAnswerScriptAvailableForDownload(String.valueOf(unitTest1PaperStatus1.get("pkQuestionPaperId")), "1", String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
}
if((boolean)unitTest2PaperStatus1.get("status")){
	unitTest2AnswerScriptCheckForDownload =answerScriptObj.checkAnswerScriptAvailableForDownload(String.valueOf(unitTest2PaperStatus1.get("pkQuestionPaperId")), "2", String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
}
if((boolean)semPaperStatus1.get("status")){
	semExamAnswerScriptCheckForDownload =answerScriptObj.checkAnswerScriptAvailableForDownload(String.valueOf(semPaperStatus1.get("pkQuestionPaperId")), "3", String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId,courseTypeId);
}




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
  <title>Subject</title>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
  <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script> 
  
  <!-- OWN CSS -->
  <link rel="stylesheet" href="css/subject.css">
  <link rel="stylesheet" href="css/responsive-style.css">
   <link rel="stylesheet" href="css/studentPageTableCSS.css">
  
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
   grid-template-columns: repeat(auto-fit, minmax(10rem, 1fr));
   gap:1rem;
}

.process .box-container .box{
   background-color: var(--blue);
   padding:1rem;
   border-radius: .5rem;
   text-align: center;
   box-shadow: var(--box-shadow);
   width: 20rem;
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
              <a class="nav-link active" aria-current="page" href="studentPage1.jsp">Home</a>
            </li>
             <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="studentClassroom.jsp">Classroom</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#notes">Notes&Suggestion</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#doubt">Doubt Clearence</a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="#assignment">Assignment</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#exam">Exams</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/College_Final_Year_Project/logout?action=student">Logout</a>
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
            <h3 style="font-family: 'Times New Roman', Times, serif;"><%= subjectName+" ["+subjectcode+"]" %></h3>
                <p style="font-family: 'Times New Roman', Times, serif;color:black;font-size:20px;">
                <%=
                (student.getYear()==1)?( student.getYear()+"st Year"):(student.getYear()==2)?( student.getYear()+"nd Year"):(student.getYear()==3)?( student.getYear()+"rd Year"):student.getYear()+"th Year"
                %>
                <%= "-" %>
            <%=  (student.getSemester()==1)?( student.getSemester()+"st Semester"):(student.getSemester()==2)?( student.getSemester()+"nd Semester"):(student.getSemester()==3)?( student.getSemester()+"rd Semester"):student.getSemester()+"th Semester"%>
            	</p>
            	<p style="font-family: 'Times New Roman', Times, serif;color:black;font-size:20px;">
            	  <%= student.getDepartment()+"-"+student.getSection()%>
            	</p>
            <div class="mt-4">
            <%
            if(dailyClassLink != null){
            %>
      <a href="<%=dailyClassLink%>" class="btn btn-primary btn-md" target="_blank" >Join Class <i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=dailyClassLink%>" class="btn btn-primary btn-md disabled">Join Class <i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
            </div>
          </div>

          <div class="col-lg-5 col-md-6">
            <img src="images/Second213-224.svg" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </section>
<section >

  <section class="process" id="notes" style="background:rgb(226, 241, 157);">

    <h1 class="heading" >Notes & Suggestions</h1>
 
    <div class="box-container container" >
 
       <div class="box">
          <img src="image/lab1.jpg" alt="">
          <p><%=notesCount %></p>
    <button type="button" class="btn btn-success" id="viewNotes">View Notes</button>
          
       </div>
 
       <div class="box">
          <img src="image/unnamed.png" alt="">
          <p><%=suggestionCount %></p>
     <button type="button" class="btn btn-success" id="viewSuggestion">View Suggestion</button>

       </div>
       <div class="box">
        <img src="image/unnamed.png" alt="">
        <p><%=questionBankCount %></p>
           <button type="button" class="btn btn-success" id="viewQuestionBank">View Question Bank</button>

        
     </div>
 
       
 
    </div><br>
 
 </section>
<hr>
 <!-- section-3 about-->
 <section id="assignment">
  <div class="about-section wrapper"style=" background-image: url(./images/light.jpg);background-repeat: no-repeat;background-size: cover;">
    <div class="container">
     
     <div id="assignment"class="container food-type" style="background-color:darkseagreen;width:110%;">
         <div class="row align-items-center">
           <div class="col-lg-9 col-md-12 text-sec mb-lg-0 mb-5" style="width:100%;">
            <h2 style="text-align:center;">Assignment Submission</h2>
            <p style="font-size: 25px;font-weight: bold; color: rgb(245, 229, 10);border-bottom: 2px solid red;text-align: center;">Assignment Details</p>
            
            <ul class="list-unstyled py-3">
              
              <li><a href="#"  style="font-size: 25px;font-weight: bold; color: rgb(245, 229, 10);border-bottom: 2px solid red;text-align: center;"><span> Assignments Status</span></a></li>
            </ul> 
            
           <!--Table-->
            <div style=" height:270px; overflow-y: auto;">
            <table id="customers">
            <tr>
              <thead >
            <tr>
              <th style="display:none;"></th>
              <th style="text-align:center;">Assignment Name</th>
              <th style="text-align:center;">View Assignment</th>
              <th style="text-align:center;">Created Date</th>
              <th style="text-align:center;">Due Date</th>
              <th style="text-align:center;">Status</th>
              <th style="text-align:center;">Post</th>
              <th style="text-align:center;">Submitted Data</th>
              
            </tr>
            </thead>
            <tbody id='Table'>
          </tbody>
           </table>
           </div>
           <div style="text-align:center;margin-top:10px;margin-bottom:10px;">
            <button class="btn btn-primary btn-sm" id="prev">Previous</button>
            <label style="width:40px" id="lablePage"></label>
            <button class="btn btn-primary btn-sm" id="next">Next</button>
             <label style="width:30px;margin-left:10px" id="labelOutOf"></label>
             <label style="width:1px;" >of</label>
              <label style="width:60px" id="labelTotal"></label>
           </div>
            
           </div>
          
         </div>
       </div>
     </div>
     <br>
      </div>
      <br>
    </div>
    <br>
    <hr>
    
   
</section>

  <!-- section-3 about-->
   <section id="doubt">
     <div class="about-section wrapper">
       <div class="container">
         <div class="row align-items-center">
           <div class="col-lg-7 col-md-12 mb-lg-0 mb-5">
             <div class="card border-0">
               <img src="images/publicdomainq-boy.svg" class="img-fluid">
             </div>
           </div>
           <div class="col-lg-5 col-md-12 text-sec">
            <h2>Doubt Clearence</h2>
            <form method="POST" id="doubtStudentForm" enctype="multipart/form-data">
                <textarea name="doubtMessage" placeholder="message"   cols="30" rows="10"></textarea>
               <input type="submit" id="doubtSubmit"  value="send message" class="main-btn" style="margin-top:-110px;">
                <button class="main-btn" style="margin-left:10px;" id="viewDoubt">View Doubt</button>
         
             </form>
              
           </div>
         </div>
       </div>
       </div>
       </section>
   

  <!-- section-4 explore food-->
   <section id="exam">
     <div class="explore-food wrapper " style=" background-color: lightcyan;">
       <div class="container">
         <div class="row">
           <div class="col-sm-12">
             <div class="text-content text-center">
              <h2> <span>Unit Test-1</span></h2>
            
           </div>
         </div>
         <div class="row pt-5">
           <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
             <div class="card">
               <img src="images/sample-paper-featured-image.webp" class="img-fluid">
               <div class="pt-3" style="text-align:center">
                <h4>Question Paper</h4>
                 <%
            if((boolean)unitTest1PaperStatus.get("status")){
            %>
        <a href="/College_Final_Year_Project/paper?action=questionPaperDownload&id=<%=unitTest1PaperStatus.get("pkQuestionPaperId")%>" target="_self" class="btn btn-primary btn-md">View Now</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View Now<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
             </div>
           </div>
           <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card">
              <img src="images/link.jpg" class="img-fluid">
              <div class="pt-3" style="text-align:center">
                <h4>Invigilation Link</h4>
           <%
            if(unitTest1Link != null){
            %>
        <a href="<%=unitTest1Link%>" class="btn btn-primary btn-md" target="_blank" >Join The Exam<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=unitTest1Link%>" class="btn btn-primary btn-md disabled">Join The Exam<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card">
              <img src="images/ans.jpeg" class="img-fluid">
              <div class="pt-3" style="text-align:center;">
                <h4>Answer Paper</h4>
                <%
                if((boolean)unitTest1AnswerSubmissionStatus.get("status")){
                %>
                <input type="file" placeholder="Choose File" id="unitTest1AnswerScript" style="width:25%;">
                <button class="btn btn-primary btn-md" id="unitTest1AnswerScriptSubmit" style="margin-left:15px;margin-right:15px;">Submit</button>
                <%
                }else{
                %>
                <input type="file" placeholder="Choose File" disabled="true" style="width:25%;">
                <button class="btn btn-primary btn-md" disabled="true" style="margin-left:15px;margin-right:15px;">Submit</button>
               <%
                }
               %>
               
                   <%
            if((boolean)unitTest1AnswerScriptCheckForDownload.get("status")){
            %>
        <a href="/College_Final_Year_Project/submit?action=answerScriptDownload&id=<%=unitTest1AnswerScriptCheckForDownload.get("pkAnswerScriptId")%>" target="_self" class="btn btn-primary btn-md">View</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
            </div>
          </div>
         </div>
       </div>
     </div>
   </section>

   <section id="exam">
    <div class="explore-food wrapper"style="background-color: rgb(150, 233, 233);
    ">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
             <h2> <span>Unit Test-2</span></h2>
           
          </div>
        </div>
        <div class="row pt-5">
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card">
              <img src="images/sample-paper-featured-image.webp" class="img-fluid">
              <div class="pt-3" style="text-align:center">
                <h4>Question Paper</h4>
               <%
            if((boolean)unitTest2PaperStatus.get("status")){
            %>
        <a href="/College_Final_Year_Project/paper?action=questionPaperDownload&id=<%=unitTest2PaperStatus.get("pkQuestionPaperId")%>" target="_self" class="btn btn-primary btn-md">View Now</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View Now<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
             <img src="images/link.jpg" class="img-fluid">
            <div class="pt-3" style="text-align:center">
                <h4>Invigilation Link</h4>
                 <%
            if(unitTest2Link != null){
            %>
        <a href="<%=unitTest2Link%>" class="btn btn-primary btn-md" target="_blank" >Join The Exam<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=unitTest2Link%>" class="btn btn-primary btn-md disabled">Join The Exam<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
           </div>
         </div>
         <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
             <img src="images/ans.jpeg" class="img-fluid">
               <div class="pt-3" style="text-align:center;">
                <h4>Answer Paper</h4>
                 <%
                if((boolean)unitTest2AnswerSubmissionStatus.get("status")){
                %>
                <input type="file" placeholder="Choose File" id="unitTest2AnswerScript" style="width:25%;">
                <button class="btn btn-primary btn-md" id="unitTest2AnswerScriptSubmit" style="margin-left:15px;margin-right:15px;">Submit</button>
                <%
                }else{
                %>
                <input type="file" placeholder="Choose File" disabled="true" style="width:25%;">
                <button class="btn btn-primary btn-md" disabled="true" style="margin-left:15px;margin-right:15px;">Submit</button>
               <%
                }
               %> 
             
           <%
            if((boolean)unitTest2AnswerScriptCheckForDownload.get("status")){
            %>
        <a href="/College_Final_Year_Project/submit?action=answerScriptDownload&id=<%=unitTest2AnswerScriptCheckForDownload.get("pkAnswerScriptId")%>" target="_self" class="btn btn-primary btn-md">View</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
           </div>
         </div>
        </div>
      </div>
    </div>
  </section>
  <section id="exam">
    <div class="explore-food wrapper">
      <div class="container">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
             
            <h2><span>Samester Final Exam</span></h2>
          </div>
        </div>
        <div class="row pt-5">
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card">
              <img src="images/sample-paper-featured-image.webp" class="img-fluid">
              <div class="pt-3" style="text-align:center">
               <h4>Question Paper</h4>
                     <%
            if((boolean)semPaperStatus.get("status")){
            %>
        <a href="/College_Final_Year_Project/paper?action=questionPaperDownload&id=<%=semPaperStatus.get("pkQuestionPaperId")%>" target="_self" class="btn btn-primary btn-md">View Now</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View Now<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
             <img src="images/link.jpg" class="img-fluid">
              <div class="pt-3" style="text-align:center">
                <h4>Invigilation Link</h4>
                      <%
            if(semExamLink != null){
            %>
        <a href="<%=semExamLink%>" class="btn btn-primary btn-md" target="_blank" >Join The Exam<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=semExamLink%>" class="btn btn-primary btn-md disabled">Join The Exam<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
           </div>
         </div>
         <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
             <img src="images/ans.jpeg" class="img-fluid">
               <div class="pt-3" style="text-align:center;">
                <h4>Answer Paper</h4>
                  <%
                if((boolean)semExamAnswerSubmissionStatus.get("status")){
                %>
                <input type="file" placeholder="Choose File" id="semExamAnswerScript" style="width:25%;">
                <button class="btn btn-primary btn-md" id="semExamAnswerScriptSubmit" style="margin-left:15px;margin-right:15px;">Submit</button>
                <%
                }else{
                %>
                <input type="file" placeholder="Choose File" disabled="true" style="width:25%;">
                <button class="btn btn-primary btn-md" disabled="true" style="margin-left:15px;margin-right:15px;">Submit</button>
               <%
                }
               %>
            <%
            if((boolean)semExamAnswerScriptCheckForDownload.get("status")){
            %>
        <a href="/College_Final_Year_Project/submit?action=answerScriptDownload&id=<%=semExamAnswerScriptCheckForDownload.get("pkAnswerScriptId")%>" target="_self" class="btn btn-primary btn-md">View</a>	
           <% 
            }else{
           %>
             <a href="#" class="btn btn-primary btn-md disabled">View<i class="fas fa-users-class"></i></a>	
           
           <%
            }
            %>
              </div>
           </div>
         </div>
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
   <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="loader1" style="display:none;">
        <div class="loader" style="margin: auto;margin-left:40%;margin-top:7%;">
        </div>

        <h4
          style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
 <!-- Loader Modal end -->
 
 
 <!-- Doubt Modal Start -->
  <div class="container">
    <!-- The Modal -->
<div class="modalDoubt" id="myModalDoubt">
    <div class="modal-contentDoubt">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;">Doubt History</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        <div style="height:270px;overflow-y: auto;">
      <table id="doubtTable" class="table table-striped">
    <thead >
        <th style="text-align: center;">Create Date</th>
        <th style="text-align: center;">Update Date</th>
        <th style="text-align: center;">Question</th>
        <th style="text-align: center;">Answered</th>
    </thead>
    <tbody id="doubtBody">
    </tbody>
  </table>
  </div>
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" style="margin-top:15px;">
        <button type="button" id="close" class="btn btn-danger">Close</button>
      </div>

    </div>
</div>
</div>
<!-- Doubt Modal end -->

<!-- View Notes Modal Start -->
  <div class="container">
    <!-- The Modal -->
<div class="modalViewNotes" id="myModalNotes">
    <div class="modal-contentViewNotes">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;" id="modalTital"></h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        <div style="height:270px;overflow-y: auto;">
      <table id="doubtTable" class="table table-striped">
    <thead >
        <th style="display:none">NotesId</th>
        <th style="text-align: center;">Create Date</th>
        <th style="text-align: center;">Name</th>
        <th style="text-align: center;">View</th>
    </thead>
    <tbody id='notesBody'>
    </tbody>
  </table>
  </div>
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" style="margin-top:15px;">
        <button type="button" id="closeNotes" class="btn btn-danger">Close</button>
      </div>

    </div>
</div>
</div>
<!-- View Notes Modal end -->

  <!-- JS Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
  <!-- own js -->
  <script src="js/subject1.js"></script>
  <script type="text/javascript">
  var totalRecords;
  var start=0;
  var studentId =<%=studentId%>;
  var departmentId=<%=departmentId %>;
  var sectionId=<%=sectionId%>;
  var semesterId=<%=semesterId %>;
  var subjectId=<%=subjectId %>;
  var courseTypeId=<%=courseTypeId%>;
  
  
  $(document).ready(function () {
	  let dataPerPage=5,pageNo=1;
	  var total;
	  var url="StudentSubjectAssignmentPagination.jsp?requestType=countRecords"+"&"+"studentId="+studentId+"&"+"departmentId="+departmentId+"&"+"sectionId="+sectionId+"&"+"semesterId="+semesterId+"&"+"subjectId="+subjectId+"&courseTypeId="+courseTypeId;
	  $.ajax({
	      type: "GET",
	      url: url,
	      async: false,
	      success: function (data, textStatus, jqXHR) {
	    	  var JsonData= jQuery.parseJSON(data);
	        total=JsonData.count;
	      },
	      error: function (jqXHR, textStatus, errorThrown) {
      
	      }
	    });
	  if(total==0){
		  $("#Table").html('<tr class="no-records"><td colspan="7" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>')
		  $("#prev").prop("disabled", true); 
		  $("#next").prop("disabled", true); 
		  $('#labelOutOf').html(0);
		  $('#labelTotal').html(0);
		  $('#lablePage').html(1);
	  }

	  else{
	  var  currentStack=0;

	  fetchAssignment(start,dataPerPage);

	  currentStack=dataPerPage*pageNo; 
	  if(currentStack>=total){
		  $('#labelOutOf').html(total);
		  $('#labelTotal').html(total);
		  $('#lablePage').html(pageNo);
		  $("#prev").prop("disabled", true); 
		  $("#next").prop("disabled", true); 
	  }
	  
	  else{
let rem=total%dataPerPage;
let sub=((rem!=0)?rem:dataPerPage);
	  $('#labelOutOf').html(currentStack);
	  $('#labelTotal').html(total);
	  
	  if(currentStack<=dataPerPage){
		  $("#prev").prop("disabled", true); 
	  }
	  $('#lablePage').html(pageNo);
	  
	  $('#next').click(function (event) {
		  event.preventDefault();
		  pageNo++;
		  currentStack=dataPerPage*pageNo;
		  start=start+dataPerPage;
		  fetchAssignment(start,dataPerPage);
		  $('#lablePage').html(pageNo);
		  $('#labelOutOf').html(currentStack);
		  buttonEnabled(currentStack,total,dataPerPage,sub);
		
	  });
	  $('#prev').click(function (event) {
		  event.preventDefault();
		  pageNo--;
		  currentStack=dataPerPage*pageNo;
		  start=start-dataPerPage;
		  fetchAssignment(start,dataPerPage);
		  $('#lablePage').html(pageNo);
		  $('#labelOutOf').html(currentStack);
		  buttonEnabled(currentStack,total,dataPerPage,sub);
	  });
	  }
  }
	  
	  function buttonEnabled(currentStack,total,dataPerPage,sub){
		  if(currentStack>dataPerPage){
			  $("#prev").prop("disabled", false); 
		  }
		  if(currentStack<=dataPerPage){
			  $("#prev").prop("disabled", true); 
		  }
		  if(currentStack>=total){
			  $('#labelOutOf').html(currentStack-dataPerPage+sub);
			  $("#next").prop("disabled", true); 
		  }
		  if(currentStack<=(total-sub)){
			  $("#next").prop("disabled", false); 
		  }
	  }
	
	  
	  $('#close').click(function (event) {
		  event.preventDefault();
		  $('#myModalDoubt').hide();
		  $('#viewDoubt').prop("disabled", false);
	  });  
	  
  });
	 function  myFunction(){
		 $(function () {
	         $('#Table td').on('click', function () {
	        	 $('#myModal').show();
	        	    //Calling Loader
	        	    $(".loader1").show();
	        	 
	             var row = $(this).closest('tr');
	           
	             var id = $(row).find('td').eq(0).html();
	             
	          var file_data=   $('#'+id).prop("files")[0];
	             
	          if(file_data==null){
	        	  $(".loader1").hide();
	              $('#myModal').hide();
	        	  alert("Please choose a file");
	        	  
	          }
	          else{
	        	  var form_data = new FormData(); // Creating object of FormData class
	        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form_data
	        	  form_data.append("assignmentId", id); // Adding extra parameters to form_data
	        	  form_data.append("action", "upload");
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/viewAndDownload",
	                  data: form_data,
	                  processData: false,
	                  contentType: false,
	                  success: function(data,textStatus,jqXHR){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                	  if(data.trim()=='Assignment Submitted Successfully'){
	                	   swal("Done", data, "success");
	                	   fetchAssignment(start,5);
	                	  }else{
	                		  swal("Error",data,"error");
	                	  }
	                    },
	                  error:function(jqXHR,textStatus,errorThrown){
	                	  $(".loader1").hide();
	                      $('#myModal').hide();
	                      swal("Error",data,"error");
	                  }
	        	  }); 
	          }
	         });
	     });
		}
	  
	 function fetchAssignment(start,limit){
		  var url1="StudentSubjectAssignmentPagination.jsp?requestType=getRecords"+"&"+"studentId="+studentId+"&"+"departmentId="+departmentId+"&"+"sectionId="+sectionId+"&"+"semesterId="+semesterId+"&"+"subjectId="+subjectId+"&"+"start="+start+"&"+"limit="+limit+"&courseTypeId="+courseTypeId;

		  $.ajax({
		      type: "GET",
		      url: url1,
		      async: false,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		      $('#Table').empty();
		      $(JsonData).each(function (index, item) {  
                  $('#Table').append(
                          '<tr><td style="display:none;">' + item.pkStudentAssignmentStatusId +
                          '</td><td style="text-align:center;">' + item.assignmentName +
                          '</td><td style="text-align:center;"><a href="/College_Final_Year_Project/uploadAssignmentAndView?action=downloadAssignment&id='+item.pkAssignmentId+'" target="_self" class="btn btn-primary btn-sm">View</a>'+
                          '</td><td style="text-align:center;">' + item.createDate +
                          '</td><td style="text-align:center;">' + item.dueDate +
                          '</td><td style="text-align:center;">' + item.status + 
                          '</td><td >'+ 
                          '<div">'+(item.dueDatePassed==1?'<input type="file" placeholder="Choose File" disabled="true" style="margin-top:15px;">'+
                          '<input type="submit" value="Submit" onclick=myFunction()  disabled="true"  class="btn btn-primary btn-sm" style="margin-top:-60px;border:1px solid skyblue;margin-left:80%;opacity: 1;background-color: #00a2ed; border-color: #00a2ed;">':'<input type="file" placeholder="Choose File" id='+item.pkStudentAssignmentStatusId+' style="margin-top:15px;">'+
                          '<input type="submit" value="Submit" onclick=myFunction()  class="btn btn-primary btn-sm" style="margin-left:80%;margin-top:-60px;">')
                        +
                      '</div>'+ (item.status=="Submitted"?'</td><td style="text-align:center;">'+
                      '<a href="/College_Final_Year_Project/viewAndDownload?pkAssignmentStatusId='+item.pkStudentAssignmentStatusId+'" target="_self" class="btn btn-primary btn-sm" style="margin-top:-15px;">View</a>'+
                      '</td></tr>':'</td><td style="text-align:center;">'+
                      '<input type="button" value="view" disabled="true" style="margin-top:-15px;opacity: 1;background-color: #00a2ed; border-color: #00a2ed;" class="btn btn-primary btn-sm">'+
                      '</td></tr>')
             );

		      });
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading assignment.")
		      }
		    });
	 }
	 
	  
	  $('#viewNotes').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Notes");
			 $('#viewNotes').prop("disabled", true);  
			 fetchStudentMaterial('notes');
			 $('#myModalNotes').show();
		});	  
	  $('#closeNotes').click(function (event){
			event.preventDefault();
			 $('#myModalNotes').hide();
			 $('#viewNotes').prop("disabled", false);  
			 $('#viewSuggestion').prop("disabled", false);  
			 $('#viewQuestionBank').prop("disabled", false);  
		});	 
	  
	  $('#viewSuggestion').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Suggestion");
			 $('#viewSuggestion').prop("disabled", true);  
			 fetchStudentMaterial('suggestion');
			 $('#myModalNotes').show();
		});	 
	  
	  $('#viewQuestionBank').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Question Bank");
			 $('#viewQuestionBank').prop("disabled", true);  
			 fetchStudentMaterial('questionBank');
			 $('#myModalNotes').show();
		});	  
	
	  function fetchStudentMaterial(action){
		  $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/view?action="+action+"&departmentId="+departmentId+"&semesterId="+semesterId+"&sectionId="+sectionId+"&subjectId="+subjectId+"&courseTypeId="+courseTypeId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#notesBody').empty();
		    	 if(JsonData.length==0){
			     $("#notesBody").html('<tr class="no-records"><td colspan="3" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  $('#notesBody').append(
		        			  '<tr>'+
		        			  '<td style="text-align: center;display:none">'+item.pkId+'</td>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/view?action='+action+'Download&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+
		        	           '</tr>'
		        	  );
			      });
		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
	           alert("Sorry Something went wrong while loading "+action+".");
		      }
		    });
		  
	  }
			 
	    $('#doubtSubmit').click(function (event){
			event.preventDefault();
			$('#doubtSubmit').prop("disabled", true);  
			 $('#myModal').show();
     	    //Calling Loader
     	    $(".loader1").show();
     	     var form = $('#doubtStudentForm')[0];
        // Create an FormData object 
        var data = new FormData(form);
        data.append("action", "askDoubt");
     	data.append("studentId",studentId);    
     	data.append("departmentId",departmentId);
     	data.append("semesterId",semesterId);    
     	data.append("sectionId",sectionId);
    	data.append("subjectId",subjectId);
    	data.append("courseTypeId",courseTypeId);

    	
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
	    
	    
	    //   function for View Doubt	 

	    $('#viewDoubt').click(function (event){
	    	event.preventDefault();
	       $('#myModalDoubt').show();
	       $('#viewDoubt').prop("disabled", true);  
	    	 $.ajax({
			      type: "GET",
			      url:"/College_Final_Year_Project/doubt?action=viewDoubt&studentId="+studentId+"&departmentId="+departmentId+"&semesterId="+semesterId+"&sectionId="+sectionId+"&subjectId="+subjectId+"&courseTypeId="+courseTypeId,
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
	            });
	 
	    $('#unitTest1AnswerScriptSubmit').click(function (event){
	    	event.preventDefault();
	    
	    	var fileId="unitTest1AnswerScript";
	    	var questionPaperId= <%=String.valueOf(unitTest1AnswerSubmissionStatus.get("pkQuestionPaperId")) %>;
	    	
	    	submitAnswerScript(fileId,questionPaperId,1,"unitTest1AnswerScriptSubmit");
	    
	    });
	    
	    $('#unitTest2AnswerScriptSubmit').click(function (event){
	    	event.preventDefault();
	    
	    	var fileId="unitTest2AnswerScript";
	    	var questionPaperId= <%=String.valueOf(unitTest2AnswerSubmissionStatus.get("pkQuestionPaperId")) %>;
	    	
	    	submitAnswerScript(fileId,questionPaperId,1,"unitTest2AnswerScriptSubmit");
	    
	    });
	    	 
	    $('#semExamAnswerScriptSubmit').click(function (event){
	    	event.preventDefault();
	    
	    	var fileId="semExamAnswerScript";
	    	var questionPaperId= <%=String.valueOf(semExamAnswerSubmissionStatus.get("pkQuestionPaperId")) %>;
	    	
	    	submitAnswerScript(fileId,questionPaperId,1,"semExamAnswerScriptSubmit");
	    
	    });
	    
	function submitAnswerScript(fileId,questionPaperId,examTypeId,buttonId){
        $("#"+buttonId).prop("disabled", true);
		$(".loader1").show();
         $('#myModal').show();
         
        var file_data= $('#'+fileId).prop("files")[0];
           
        if(file_data==null){
      	  $(".loader1").hide();
            $('#myModal').hide();
            $("#"+buttonId).prop("disabled", false);
      	  alert("Please choose a file");
      	  
        }
        else{
      	  var form_data = new FormData(); // Creating object of FormData class
      	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form_data
      	  form_data.append("questionPaperId", questionPaperId); // Adding extra parameters to form_data
      	  form_data.append("examTypeId", examTypeId);
      	  form_data.append("studentId",studentId);    
       	  form_data.append("departmentId",departmentId);
      	  form_data.append("semesterId",semesterId);    
      	  form_data.append("sectionId",sectionId);
      	  form_data.append("subjectId",subjectId); 
      	 form_data.append("action","answerScriptSubmit"); 
      	 form_data.append("courseTypeId",courseTypeId); 

      	 
      	 
      	  $.ajax({
      		  type: "POST",
                enctype: 'multipart/form-data',
                url: "/College_Final_Year_Project/submit",
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
                  $("#"+fileId).val(null);
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
	    }    
  </script>
</body>
</html>