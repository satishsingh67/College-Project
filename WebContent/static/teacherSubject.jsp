<%@page import="com.college.teacher.dao.LinkManagement" %>
<%@page errorPage="errorPage.jsp" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="com.college.model.TeacherDetails" %>
<%@page import="com.college.teacher.dao.MapTeacherSubjectDao" %>
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

//Metting link
LinkManagement mettingLinks=new LinkManagement();
String dailyClassLink=mettingLinks.getDailyClassLink(String.valueOf(fkTeacherPkId), String.valueOf(fkTeacherPkId), semester, section, subjectId);
String unitTest1Link=mettingLinks.getExamMeetingLink(1,String.valueOf(fkDepartment), String.valueOf(semester),String.valueOf(section), subjectId,String.valueOf(fkTeacherPkId));
String unitTest2Link=mettingLinks.getExamMeetingLink(2,String.valueOf(fkDepartment), String.valueOf(semester),String.valueOf(section), subjectId,String.valueOf(fkTeacherPkId));
String semExamLink=mettingLinks.getExamMeetingLink(3,String.valueOf(fkDepartment), String.valueOf(semester),String.valueOf(section), subjectId,String.valueOf(fkTeacherPkId));

//Notes and Suggestion
MapTeacherSubjectDao mapTeacherSubjectDaoObj=new MapTeacherSubjectDao();
Integer notesCount=mapTeacherSubjectDaoObj.getTotalNotes(fkTeacherPkId, fkDepartment, Integer.parseInt(semester),  Integer.parseInt(section),  Integer.parseInt(subjectId), null);
Integer suggestionCount=mapTeacherSubjectDaoObj.getTotalSuggestion(fkTeacherPkId, fkDepartment, Integer.parseInt(semester),  Integer.parseInt(section),  Integer.parseInt(subjectId));
Integer questionBankCount=mapTeacherSubjectDaoObj.getTotalQuestionBank(fkTeacherPkId, fkDepartment, Integer.parseInt(semester),  Integer.parseInt(section),  Integer.parseInt(subjectId));


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
 
  <!-- OWN CSS -->
  <link rel="stylesheet" href="css/subject.css">
  <link rel="stylesheet" href="css/responsive-style.css">
  <link rel="stylesheet" href="css/responsiveslides.css">
  <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>
 <link rel="stylesheet" href="css/teacherSubject.css">
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
            <h3 style="font-family: 'Times New Roman', Times, serif;"><%= subjectName +" ["+subjectCode+"]" %></h3>
            <p style="font-family: 'Times New Roman', Times, serif;color:black;font-size:20px;"><%=(Integer.parseInt(year)==1)?(year+"st Year"):(Integer.parseInt(year)==2)?( year+"nd Year"):(Integer.parseInt(year)==3)?(year+"rd Year"):year+"th Year"%> 
           <%=","+((Integer.parseInt(semester)==1)?(semester+"st Semester"):(Integer.parseInt(semester)==2)?( semester+"nd Semester"):
            	(Integer.parseInt(semester)==3)?(semester+"rd Semester"):semester+"th Semester")%>
            	</p>
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
          </div>

          <div class="col-lg-5 col-md-6">
            <img src="images/Second213-224.svg" class="img-fluid">
          </div>
        </div>
      </div>
    </div>
  </section>
<section >

</section>
<section id="notes">
    <div class="explore-food wrapper " >
      <div class="container" style="background:azure;">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
               <h2>Share Notes & Suggestion</h2>
            
           
          </div>
        </div>
        <div class="row pt-5" style="height:170px;">
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card">
                <h3>Share Notes</h3>
                <h4>Total Notes:<%=notesCount %></h4>
                     <div>
           <input type="file" style="width:105px;" id="uploadNotes" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="uploadNotesButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary" id="viewNotes">View</button>   
                  </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
            <h3>Share Suggestions</h3>
            <h4>Total Suggestions:<%=suggestionCount %></h4>
                     <div>
           <input type="file" style="width:105px;" id="uploadSuggestions" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="uploadSuggestionsButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary" id="viewSuggestion">View</button>   
                  </div>
           </div>
         </div>
         <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
            <h3>Share Question Bank</h3>
             <h4>Total Question Bank:<%=questionBankCount %></h4>
                     <div>
           <input type="file" style="width:105px;" id="uploadQuestionBank" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="uploadQuestionBankButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary" id="viewQuestionBank">View</button>   
                  </div>
           </div>
         </div>
        </div>
      </div>
    </div>
  </section>

  

  <!-- section-3 about-->
   <section id="assignment">
     <div class="about-section wrapper"style=" background-image: url(./images/light.jpg);background-repeat: no-repeat;background-size: cover;">
       <div class="container">
        
        <div id="assignment"class="container food-type" style="background-color:darkseagreen;">
            <div class="row align-items-center">
              <div class="col-lg-6 col-md-12 text-sec mb-lg-0 mb-5">
               <h2>Assignment Submission</h2>
               <p style="font-size: 25px;font-weight: bold; color: rgb(245, 229, 10);border-bottom: 2px solid red;text-align: center;">Post New Assignment</p>
               <form action="">
                   <input type="file" placeholder="Choose File" id="assignmentFile" style="width:220px;">
                   <label>Set Due Date</label>
                   <input type="datetime-local" step="1" id="assignmentDuedate" style="width:250px;">
                   <input type="submit" value="Post" id="postAssignment" style="margin-left:120px;" class="main-btn mt-4">
                   <input type="submit" value="View" id="viewAssignment" class="main-btn mt-4"style="background-color:green;">
                
                    </form>
               <ul class="list-unstyled py-3">
                  <%
          String assignmentCheckUrl="dynamicTableTeacher.jsp?action=assignmentCheck&examType=Assignment Details&examTypeCode=3&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
                 <li><a href="<%=assignmentCheckUrl %>" target="_blank"  style="font-size: 25px;font-weight: bold; color: rgb(245, 229, 10);border-bottom: 2px solid red;text-align: center;" ><span>Checked Submitted Assignments</span></a></li>
  
              </div>
              <div class="col-lg-6 col-md-12">
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
   


  <section id="doubt" style="background-color: darkgrey;">
    <div class=" wrapper">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7 col-md-12 mb-lg-0 mb-5">
            <h2 style="text-align:center;">Student's Question</h2>
            <div class="card border-0">
                <div class="col-md-12">
                <!--Table-->
            <div style=" height:470px;overflow-y: auto;">
            <table id="doubtTable">
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
                <label style="height:25px;" class="details"><p id="doubtStudentName" style="font-size:20px;"><b>Student Name :</b></p></label>
               <br>
               
               <label id="doubtStudentRollNo" style="height:25px;" class="details"><p style="font-size:20px;"><b>Roll No :</b></p></label>
             <textarea name="doubtQuestion" id="doubtQuestionStudent" placeholder="Question" readonly  style="height:100px;"  cols="30" rows="5"></textarea>
              <textarea name="doubtAnswer" id="doubtAnswerStudent" placeholder="Answer" style="height:200px;"   cols="30" rows="5"></textarea>
               <input type="submit" id="doubtSubmit"  value="send message" class="main-btn" style="margin-top:-110px;">
         
            </form>
             
          </div>
        </div>
      </div>
      </div>
      </section>
  <!-- section-4 explore food-->
  <section id="exam">
    <div class="explore-food wrapper " style=" background-color: rgb(152, 211, 211);">
      <div class="container" style="background:azure;">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
               <h2> Examination</h2>
             <h2> <span>Unit Test-1</span></h2>
           
          </div>
        </div>
        <div class="row pt-5">
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card" style="margin-left:18px;">
                <h3>Share Question Paper</h3>
                         <div>
           <input type="file" style="width:105px;" id="unitTest1PaperFile" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="unitTest1PaperFileButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary"  id="viewUnitTest1Paper">View</button>   
                  </div>
            </div>
          </div>
         

          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
            <h3 style="text-align: center;">Invigilation Link</h3>
          <div style="width:110%;">
		   <input type="text" style="height:37px;" id="examLinkUT1" placeholder="Enter class link">
             <button  class="btn btn-primary" id="uploadExamLinkUT1">Upload Exam Link <i class="fas fa-users-class"></i></button>
		  
		  
             <%
            if(unitTest1Link != null){
            %>
        <a href="<%=unitTest1Link%>" id="unit1TestUrl" class="btn btn-primary btn-md" target="_blank" >Join<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=unitTest1Link%>" id="unit1TestUrl" class="btn btn-primary btn-md disabled">Join<i class="fas fa-users-class"></i></a>	
           
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
          String unit1Url="dynamicTableTeacher.jsp?action=exam&examType=Unit Test-1&examTypeCode=1&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
          <a href="<%=unit1Url%>" target="_blank" class="btn btn-primary">Check</a>      
        
              </div>
           </div>
         </div>
        </div>
      </div><hr>
      <div class="container" style="background:azure;">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
               
             <h2> <span>Unit Test-2</span></h2>
           
          </div>
        </div>
        <div class="row pt-5">
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
            <div class="card" style="margin-left:10px;">
                <h3>Share Question Paper</h3>
                         <div>
           <input type="file" style="width:105px;" id="unitTest2PaperFile" placeholder="Choose File">
          <button style="margin-left:20px;margin-right:20px;" id="unitTest2PaperFileButton" class="btn btn-primary">Post</button>            
            <button class="btn btn-primary" id="viewUnitTest2Paper">View</button>   
                  </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 mb-lg-0 mb-5">
           <div class="card">
            <h3 style="text-align: center;">Invigilation Link</h3>
            <div style="width:110%;">
			 <input type="text" style="height:37px;" id="examLinkUT2" placeholder="Enter class link">
             <button  class="btn btn-primary" id="uploadExamLinkUT2">Upload Exam Link <i class="fas fa-users-class"></i></button>
		  
            <%
            if(unitTest2Link != null){
            %>
        <a href="<%=unitTest2Link%>" id="unit2TestUrl" class="btn btn-primary btn-md"  target="_blank" >Join<i class="fas fa-users-class"></i></a>	
           <% 
            }else{
           %>
             <a href="<%=unitTest2Link%>" id="unit2TestUrl" class="btn btn-primary btn-md disabled">Join<i class="fas fa-users-class"></i></a>	
           
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
          String unit2Url="dynamicTableTeacher.jsp?action=exam&examType=Unit Test-2&examTypeCode=2&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
          <a href="<%=unit2Url%>" target="_blank" class="btn btn-primary">Check</a>      
           
              </div>
           </div>
         </div>
        </div>
      </div>
      <hr>
      <div class="container" style="background:azure;height:200px;">
        <div class="row">
          <div class="col-sm-12">
            <div class="text-content text-center">
               
             <h2> <span>Semester Exam</span></h2>
           
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
          String semUrl="dynamicTableTeacher.jsp?action=exam&examType=Semester Exam&examTypeCode=3&semesterId="+semester+"&year="+year+"&section="+section+"&subject="+subjectId; 
            
            %>
          <a href="<%=semUrl%>" target="_blank" class="btn btn-primary">Check</a>      
           
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
                <p class="text-light">©Developer.Sornali Hazra</p>
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
          style="margin: auto;margin-left:30%;margin-top:0%;color: rgb(30, 169, 224);  letter-spacing: 5px; padding: 10px;font-size:20px;">
          Please wait....</h4>
      </div>
    </div>

  </div>
 <!-- Loader Modal end -->	  

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

 <!-- The Assignement Modal -->
<div class="modalViewAssignment" id="myModalAssignment">
    <div class="modal-contentViewAssignment">

      <!-- Modal Header -->
     
        <h4 class="modal-title" style="text-align: center;">View Uploaded Assignment</h4>
     

      <!-- Modal body -->
      <div class="modal-body">
        <div style="height:270px;overflow-y: auto;">
      <table id="doubtTable" class="table table-striped">
    <thead >
        <th style="text-align: center;">Upload Date</th>
        <th style="text-align: center;">Due Date</th>
        <th style="text-align: center;">Name</th>
        <th style="text-align: center;">View</th>
    </thead>
    <tbody id='assignmentBody'>
    </tbody>
  </table>
  </div>
  </div>

      <!-- Modal footer -->
      <div class="modal-footer" style="margin-top:15px;">
        <button type="button" id="closeAssignment" class="btn btn-danger">Close</button>
      </div>

    </div>
</div>
</div>
<!-- View Assignment Modal end -->


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
       <a  target="_self" id="questionPaperView"   class="btn btn-primary" style="margin-left:135px;width:75px;">View</a> 
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
      <div class="modal-footer" >
        <button type="button" id="closeQuestionPaperModel" class="btn btn-danger">Close</button>
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
  var fkSectionId=<%= section%>;
  var fkYear=<%= year%>;
  var fkSemester=<%= semester%>;
  $(document).ready(function () {
	
	  fetchStudentDoubt();

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
  
  //Uploading Class Link
  
  $('#uploadClassLink').click(function (event){
	  	event.preventDefault();
	  	$(".loader1").show();
	      $('#myModal').show();
	  	var meetingLink=$('#classLink').val();
	    $("#uploadClassLink").prop("disabled", true);
		  $.ajax({
    		  type: "POST",
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
             			$('#'+LinkFieldId).attr("target", "_blank");
            		  }else{
            			  $("#joinClassLink").attr("href", meetingLink);
              			$('#'+LinkFieldId).attr("target", "_blank");

            		  }
            	   swal("Done", data, "success");
            	  }else{
            		  swal("Error",data,"error");
            	  }
            	  $('#classLink').val("");
            	  $("#uploadClassLink").prop("disabled", false);
            	  fetchStudentDoubt();
                },
              error:function(jqXHR,textStatus,errorThrown){
            	  $(".loader1").hide();
                  $('#myModal').hide();
                  swal("Error",data,"error");
            	  $("#uploadClassLink").prop("disabled", false);
              }
    	  }); 

	});
  
     $('#uploadClassLink').click(function (event){
		 
		 examLink(buttonId,filedId,LinkFieldId,"1");
	 });
    $('#uploadExamLinkUT1').click(function (event){
		 
		 examLink("uploadExamLinkUT1","examLinkUT1","unit1TestUrl","1");
	 });
  $('#uploadExamLinkUT2').click(function (event){
		 
		 examLink("uploadExamLinkUT2","examLinkUT2","unit2TestUrl","2");
	 });
  
  
 
  //upload Exam Link
  
  function examLink(buttonId,filedId,LinkFieldId,examType){
	  
	
	  	event.preventDefault();
	  	$(".loader1").show();
	      $('#myModal').show();
	  	var meetingLink=$('#'+filedId).val();
	    $("#"+buttonId).prop("disabled", true);
		  $.ajax({
    		  type: "POST",
              url: "/College_Final_Year_Project/teacherLink", 
              data:{action:'examLink',teacherId:fkTeacherPkId,examType:examType,departmentId:fkDepartment,semseter:fkSemester,section:fkSectionId,subjectId:fksubjectId,meetingLink:meetingLink},
              success: function(data,textStatus,jqXHR){
            	  $(".loader1").hide();
                  $('#myModal').hide();
            	  if(data.includes('Successfully')){
            		  
            		  var linkActiveStatus=$('#'+LinkFieldId).attr('class');
            		  
            		  if(linkActiveStatus.trim() =="btn btn-primary btn-md disabled"){
            			 $('#'+LinkFieldId).removeClass("btn btn-primary btn-md disabled");
            			$('#'+LinkFieldId).addClass("btn btn-primary btn-md");
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
  

 //Uploading Notes,Suggestions and Question bank
 
   $('#uploadNotesButton').click(function (event){
			event.preventDefault();
			uploadStudentNotes("uploadNotes","uploadNotesButton","Notes");
		});	  
   $('#uploadSuggestionsButton').click(function (event){
		event.preventDefault();
		uploadStudentNotes("uploadSuggestions","uploadSuggestionsButton","Suggestion");
	});	  
   $('#uploadQuestionBankButton').click(function (event){
		event.preventDefault();
		uploadStudentNotes("uploadQuestionBank","uploadQuestionBankButton","QuestionBank");
	});	  
 
 function uploadStudentNotes(fileId,buttonId,action) {
	 $(".loader1").show();
     $('#myModal').show();
   $('#'+buttonId).prop("disabled", true);
    var file_data=   $('#'+fileId).prop("files")[0];
	             
	          if(file_data==null){
	        	  $(".loader1").hide();
	              $('#myModal').hide();
	        	  alert("Please choose a file");
	        	  $("#"+buttonId).prop("disabled", false);
	          }
	          else{
	        	  var form_data = new FormData(); // Creating object of FormData class
	        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form_data
	        	  form_data.append("action", action);
	        	  form_data.append("teacherId",fkTeacherPkId);
	        	  form_data.append("departmentId",fkDepartment);
	        	  form_data.append("semesterId",fkSemester);
	        	  form_data.append("sectionId",fkSectionId);
	        	  form_data.append("subjectId",fksubjectId);
	        	  
	        	  $.ajax({
	        		  type: "POST",
	                  enctype: 'multipart/form-data',
	                  url: "/College_Final_Year_Project/uploadNotesAndView",
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
	                      $("#"+fileId).val(null);
	    	        	  $("#"+buttonId).prop("disabled", false);
	                  }
	        	  }); 
	          }
            }
  
  
  
  
	  $('#viewNotes').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Shared Notes");
			 $('#viewNotes').prop("disabled", true);  
			 fetchStudentMaterial('view','notes');
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
			$('#modalTital').html("View Shared Suggestion");
			 $('#viewSuggestion').prop("disabled", true);  
			 fetchStudentMaterial('view','suggestion');
			 $('#myModalNotes').show();
		});	 
	  
	  $('#viewQuestionBank').click(function (event){
			event.preventDefault();
			$('#modalTital').html("View Shared Question Bank");
			 $('#viewQuestionBank').prop("disabled", true);  
			 fetchStudentMaterial('view','questionBank');
			 $('#myModalNotes').show();
		});	  
	 
	  function fetchStudentMaterial(action,query){
		  $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/uploadNotesAndView?action="+action+"&query="+query+"&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&teacherId="+fkTeacherPkId,
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
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/uploadNotesAndView?action=download&query='+query+'Download&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+
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
  
	  $('#viewAssignment').click(function (event){
			event.preventDefault();
			 $('#viewAssignment').prop("disabled", true);  
			 fetchAssignment("viewAssignment");
			 $('#myModalAssignment').show();
		});
	  
	  $('#closeAssignment').click(function (event){
			event.preventDefault();
			 $('#viewAssignment').prop("disabled", false);  
			 $('#myModalAssignment').hide();
			 $('#myModalQuestionPaper').hide();
		});
	  	  
	  $('#postAssignment').click(function (event){
			event.preventDefault();
			 $('#postAssignment').prop("disabled", true);  
			 $(".loader1").show();
		     $('#myModal').show();
		    var file_data=   $('#assignmentFile').prop("files")[0];
			var dueDate=$('#assignmentDuedate').val();             
			           if(file_data==null){
			        	  $(".loader1").hide();
			              $('#myModal').hide();
			        	  alert("Please choose a file");
			        	  $("#postAssignment").prop("disabled", false);
			          }
			           else if(dueDate==""){
			        	  $(".loader1").hide();
			              $('#myModal').hide();
			        	  alert("Please Set Due Date");
			        	  $("#postAssignment").prop("disabled", false);
			          }
			          else{
			        	  var form_data = new FormData(); // Creating object of FormData class
			        	  form_data.append("file", file_data); // Appending parameter named file with properties of file_field to form_data
			        	  form_data.append("dueDate", dueDate);
			        	  form_data.append("action", "uploadAssignment");
			        	  form_data.append("teacherId",fkTeacherPkId);
			        	  form_data.append("departmentId",fkDepartment);
			        	  form_data.append("semesterId",fkSemester);
			        	  form_data.append("sectionId",fkSectionId);
			        	  form_data.append("subjectId",fksubjectId);
			        	  
			        	  $.ajax({
			        		  type: "POST",
			                  enctype: 'multipart/form-data',
			                  url: "/College_Final_Year_Project/uploadAssignmentAndView",
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
			                	   $("#assignmentFile").val(null);
			                	   $('#assignmentDuedate').val(null);
				    	        	  $("#postAssignment").prop("disabled", false);
			    	        	  
			                    },
			                  error:function(jqXHR,textStatus,errorThrown){
		 	                	  $(".loader1").hide();
			                      $('#myModal').hide();
			                      swal("Error",data,"error");
			                      $("#assignmentFile").val(null);
			                	   $('#assignmentDuedate').val(null);
			    	        	  $("#postAssignment").prop("disabled", false);
			                  }
			        	  }); 
			          } 
		});
	  
	  function fetchAssignment(action){
		  $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/uploadAssignmentAndView?action="+action+"&departmentId="+fkDepartment+"&semesterId="+fkSemester+"&sectionId="+fkSectionId+"&subjectId="+fksubjectId+"&teacherId="+fkTeacherPkId,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	  $('#assignmentBody').empty();
		    	 if(JsonData.length==0){
			     $("#assignmentBody").html('<tr class="no-records"><td colspan="4" style="text-align:center;text-color:black">Sorry,No record found.</td></tr>');
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  $('#assignmentBody').append(
		        			  '<tr>'+
		        			  '<td style="text-align: center;">'+item.createDate+'</td>'+
		        			  '<td style="text-align: center;">'+item.dueDate+'</td>'+
		        			  '<td style="text-align: center;">'+item.name+'</td>'+
		        			  '<td style="text-align: center;"><a href="/College_Final_Year_Project/uploadAssignmentAndView?action=downloadAssignment&id='+item.pkId+'" target="_self" class="btn btn-primary btn-sm">View</a></td>'+
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
	    
	  $('#unitTest1PaperFileButton').click(function (event){
			event.preventDefault();
			postQuestionPaper("unitTest1PaperFileButton","unitTest1PaperFile","1");

		});  
	  
	  $('#unitTest2PaperFileButton').click(function (event){
			event.preventDefault();
			postQuestionPaper("unitTest2PaperFileButton","unitTest2PaperFile","2");
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
	  $('#viewUnitTest1Paper').click(function (event){
			event.preventDefault();
			fetchQuestionPaperDetails(1,"viewUnitTest1Paper");
		});
	  
	  $('#viewUnitTest2Paper').click(function (event){
			event.preventDefault();
			fetchQuestionPaperDetails(2,"viewUnitTest2Paper");
		});
	

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
	  
	  
	  
  </script>
  
  
</body>
</html>

