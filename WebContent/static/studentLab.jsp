<%@page import="com.college.model.Student" %>
<%@page import="com.college.dao.studentDao.MapStudentSubjectDao" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="com.college.dao.Link.MettingLinks" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import=" com.college.dao.Exam.ExamPaper"%>
<%@page import=" com.college.dao.Exam.AnswerScript"%>
<%@page import="com.college.dao.Exam.LabDataHandling" %>
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
String subjectId=request.getParameter("subjectId");
String subjectName=request.getParameter("subjectName");
String subjectcode=request.getParameter("subjectCode");

//Lab Class Link
MettingLinks mettingLinks=new MettingLinks();
String dailyClassLink=mettingLinks.getDailyClassLink(String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId);
String semExamLink=mettingLinks.getExamMeetingLink(3,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId);

//Lab Final Exam Paper
Map<String,Object> semPaperStatus =new ExamPaper().getExamPaperActiveStatus(3,String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId);

//Lab Final Sem Answer Script Submission
Map<String,Object> semExamAnswerSubmissionStatus =new HashMap<String,Object>();
semExamAnswerSubmissionStatus.put("status", false);

if((boolean)semPaperStatus.get("status")){
	semExamAnswerSubmissionStatus =new AnswerScript().checkAnswerScriptSubmissionStatus(String.valueOf(semPaperStatus.get("pkQuestionPaperId")),"3");
}

//Lab Final Sem Answer Script Download
Map<String,Object> semExamAnserScriptCheckForDownload =new HashMap<String,Object>();
semExamAnserScriptCheckForDownload.put("status",false);
if((boolean)semPaperStatus.get("status")){
	semExamAnserScriptCheckForDownload =new AnswerScript().checkAnswerScriptAvailableForDownload(String.valueOf(semPaperStatus.get("pkQuestionPaperId")), "3", String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId);
}

//Final Lab Copy and Others Files Download Status
LabDataHandling labDataHandlingObj=new LabDataHandling();

String finalLabCopy=labDataHandlingObj.checkFinalLabCopyAndOthersFilesStatus(String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId, "checkFinalLabCopy");
String labAppLink=labDataHandlingObj.checkFinalLabCopyAndOthersFilesStatus(String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId, "checkApplicationLink");
String labManual=labDataHandlingObj.checkFinalLabCopyAndOthersFilesStatus(String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId, "checkLabManual");
String labOtherData=labDataHandlingObj.checkFinalLabCopyAndOthersFilesStatus(String.valueOf(studentId), String.valueOf(departmentId), String.valueOf(semesterId),String.valueOf(sectionId), subjectId, "checkLabOtherData");

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
  <title>Subject Lab</title>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
   <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script> 
  
  <!-- OWN CSS -->
  <link rel="stylesheet" href="css/subject.css">
  <link rel="stylesheet" href="css/responsive-style.css">
   <link rel="stylesheet" href="css/studentLabCSS.css">
  
  
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
              <a class="nav-link active" aria-current="page" href="#home">Home</a>
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
            <h2 style="font-family: 'Times New Roman', Times, serif;"><%=subjectName +" ["+subjectcode+"]"%></h2>
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
            
             <h3>Application Link</h3>
             <p>Join The virtual Lab With This Application Link</p>
             <%
             if(labAppLink==null){
             %>
             <button  class="link-btn" disabled>Join  <i class="fas fa-users-class"></i></button>
             <%
             }else{
             %>
           <a href="<%=labAppLink%>" target="_blank" class="link-btn" >Join  <i class="fas fa-users-class"></i></a>   
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
            
            <%
            if(labManual==null){
            %>
           <button class="main-btn" disabled>Lab Manual <i class="fas fa-users-class"></i></button>
            
           <%
            }else{    
            %>            
            <a href="/College_Final_Year_Project/lab?action=Download&action1=downloadLabManual&id=<%=labManual %>" target="_self"   class="main-btn">Lab Manual <i class="fas fa-users-class"></i></a>
            
            <%
            }
            %>
            
            
         </div>
   
         <div class="box">
            <img src="image/unnamed.png" alt="">
            
              <%
            if(labOtherData==null){
            %>
            <button class="main-btn" disabled>Others Information <i class="fas fa-users-class"></i></button>
            
           <%
            }else{    
            %>            
            <a href="/College_Final_Year_Project/lab?action=Download&action1=downloadLabOtherFile&id=<%=labOtherData %>" target="_self"   class="main-btn">Others Information  <i class="fas fa-users-class"></i></a>
            
            <%
            }
            %>
            
         </div>
   
         
   
      </div>
   
   </section>
<br>
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
       <hr>
       <section >
       <div id="assignment"class="container food-type">
         <div class="row align-items-center">
           <div class="col-lg-7 col-md-12 text-sec mb-lg-0 mb-5">
            <h2>Lab Copy Submission</h2>
            <p>Do Your Lab Properly and be Updated by Submitting All Things</p>
            <ul class="list-unstyled py-3">
              <li><a href=""><span>Post Your Weekly Lab Experiment Here</span></a>
                <form>
                
                  <input type="file"  id="weeklyLabCopy"  placeholder="Choose File">
                  <input type="submit" id="weeklyLabCopySubmitButton" value="Submit" class="main-btn mt-4">
               <button class="main-btn" id="viewWeeklyLabCopy" style="margin-left:10px;">View</button>
                  
               </form></li>
              <li><a href=""><span>Submit Your Experiment Output</span></a>
                <form >
                
                  <input type="file"  id="weeklyLabOutPut" placeholder="Choose File">
                  <input type="submit" id="weeklyLabOutPutSubmitButton" value="Submit" class="main-btn mt-4">
                  <button class="main-btn" id="viewWeeklyLabOutPut" style="margin-left:10px;">View</button>
                  
               </form></li>
              <li>
               <a href=""><span>Submit Your Final LabCopy</a>
                <form >
                
                <input type="file" id="SemLabCopy" placeholder="Choose File">
                <input type="submit" id="SemLabCopySubmitButton" value="Submit" class="main-btn mt-4">
             
             <%
             if(finalLabCopy==null){
            	 %>
            	 <a class="main-btn"  style="margin-left:10px;" disabled>View</a>
            	 <%
             }else{
            	 %>
            <a href="/College_Final_Year_Project/lab?action=Download&action1=downloadFinalLabCopy&id=<%=finalLabCopy %>" target="_self" class="main-btn"  style="margin-left:10px;" >View</a>
             <%
             }
             %>
                
                
             </form></li>
            </ul> 
            
           </div>
           <div class="col-lg-5 col-md-12">
             <div class="card border-0">
               <img src="images/Good-Grade.svg" class="img-fluid">
             </div>
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
                <h2>Lab Examination</h2>
              <h2> <span>Semester  Exam</span></h2>
            
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
                <h4>Invagilation & Viva Link</h4>       
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
            if((boolean)semExamAnserScriptCheckForDownload.get("status")){
            %>
        <a href="/College_Final_Year_Project/submit?action=answerScriptDownload&id=<%=semExamAnserScriptCheckForDownload.get("pkAnswerScriptId")%>" target="_self" class="btn btn-primary btn-md">View</a>	
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
          <div class="col-md-12 text-center">
            <a class="footer-link" href="#">Blog</a>
            <a class="footer-link" href="#">Contact Us</a>
            <a class="footer-link" href="#">Affiliate</a>
            <a class="footer-link" href="#">FAQ</a>
            <div class="footer-social pt-4 text-center">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-youtube"></i></a>
              <a href="#"><i class="fab fa-dribbble"></i></a>
              <a href="#"><i class="fab fa-linkedin"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="footer-copy">
              <div class="copy-right text-center pt-5">
                <p class="text-light">©Developer.Sornali Hazra & Satish Singh</p>
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
        <th style="text-align: center;">Submitted Date</th>
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
  <script>
  var studentId =<%=studentId%>;
  var departmentId=<%=departmentId %>;
  var sectionId=<%=sectionId%>;
  var semesterId=<%=semesterId %>;
  var subjectId=<%=subjectId %>;

  $(document).ready(function () {
	  console.log("Jquery loded");
	
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
  data.append("action", "askDoubt");
	data.append("studentId",studentId);    
	data.append("departmentId",departmentId);
	data.append("semesterId",semesterId);    
	data.append("sectionId",sectionId);
	data.append("subjectId",subjectId);
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
	      }
	    });    
	});	  
  
  $('#close').click(function (event) {
	  event.preventDefault();
	  $('#myModalDoubt').hide();
	  $('#viewDoubt').prop("disabled", false);
  }); 
  
  $('#viewDoubt').click(function (event){
  	event.preventDefault();
    $('#myModalDoubt').show();
 	 $('#viewDoubt').prop("disabled", true);  
        $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/doubt?action=viewDoubt&studentId="+studentId+"&departmentId="+departmentId+"&semesterId="+semesterId+"&sectionId="+sectionId+"&subjectId="+subjectId,
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
  
  $('#semExamAnswerScriptSubmit').click(function (event){
  	event.preventDefault();
  
  	var fileId="semExamAnswerScript";
  	var questionPaperId= <%= String.valueOf(semExamAnswerSubmissionStatus.get("pkQuestionPaperId")) %>;
  	
  	submitAnswerScript(fileId,questionPaperId,3,"semExamAnswerScriptSubmit");
  
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
  
  $('#weeklyLabCopySubmitButton').click(function (event){
	  	event.preventDefault();
	  
	  	var fileId="weeklyLabCopy";
	  	var action="submitWeeklyLabCopy";
	  	submitLabCopy(fileId,action,false,"weeklyLabCopySubmitButton");
	  
	  });
  $('#weeklyLabOutPutSubmitButton').click(function (event){
	  	event.preventDefault();
	  
	  	var fileId="weeklyLabOutPut";
	  	var action="submitWeeklyLabOutput";
	  	submitLabCopy(fileId,action,false,"weeklyLabOutPutSubmitButton");
	  
	  });
  
  $('#SemLabCopySubmitButton').click(function (event){
	  	event.preventDefault();
	  
	  	var fileId="SemLabCopy";
	  	var action="submitSemFinalLabCopy";
	  	submitLabCopy(fileId,action,true,"SemLabCopySubmitButton");
	  
	  });
  
  
	  
	  function submitLabCopy(fileId,action,isFinalLabCopy,buttonId){
	      $("#"+buttonId).prop("disabled", true);
	       $('#myModal').show();
	    $(".loader1").show();
	      
	      var file_data= $('#'+fileId).prop("files")[0];
	         
	      if(file_data==null){
	    	  $(".loader1").hide();
	          $('#myModal').hide();
	          $("#"+buttonId).prop("disabled", false);
	    	  alert("Please choose a file");
	    	  
	      }
	      else{
      // Create an FormData object 
      var data = new FormData();
      data.append("file",file_data);
      data.append("action", action);
      data.append("studentId",studentId);    
      data.append("departmentId",departmentId);
   	  data.append("semesterId",semesterId);    
   	  data.append("sectionId",sectionId);
  	  data.append("subjectId",subjectId);
  	  data.append("isFinalLabCopy",isFinalLabCopy);
   	   $.ajax({
		      type: "POST",
		      enctype: 'multipart/form-data',
		      url:"/College_Final_Year_Project/lab", 		      
		      data: data,
		      processData: false,
		      contentType: false,
		      success: function (data, textStatus, jqXHR) {
		         $(".loader1").hide();
		         $('#myModal').hide();
		         if (data.trim().includes("Successfully")) {
		           swal("Done", data, "success");
		           $('#'+fileId).val(null);
		         }
		         else {
		           swal("Error", data, "error");
		         }
		         $("#"+buttonId).prop("disabled", false);
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
		    	  $(".loader1").hide();
		         $('#myModal').hide();
		       swal("Error", data, "error");
		       $("#"+buttonId).prop("disabled", false);
		      }
		    });    
		}
	  }
	  
	  $('#viewWeeklyLabCopy').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Weekly Lab copy");
			 $('#viewWeeklyLabCopy').prop("disabled", true);  
			 fetchLabCopyRecords('viewWeeklyLabCopy');
			
			  $('#myModalNotes').show();
	  });	 
	  
	  $('#viewWeeklyLabOutPut').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Lab Output File");
			 $('#viewWeeklyLabOutPut').prop("disabled", true);  
     		 fetchLabCopyRecords('viewWeeklyLabOutput');
			
			  $('#myModalNotes').show();
	  });
	  
	  $('#closeNotes').click(function (event){
			event.preventDefault();
			 $('#myModalNotes').hide();
			 $('#viewWeeklyLabCopy').prop("disabled", false);  
			 $('#viewWeeklyLabOutPut').prop("disabled", false);  
			
		});
	function fetchLabCopyRecords(action) {
		  $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/lab?action="+action+"&studentId="+studentId+"&departmentId="+departmentId+"&semesterId="+semesterId+"&sectionId="+sectionId+"&subjectId="+subjectId,
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
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/lab?action=Download&action1='+action+'&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+
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
	  
	  
  </script>
  
</body>
</html>

