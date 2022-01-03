window.onload = function(){

var submitButton=document.getElementById("grievance_submit");
submitButton.onclick=function(){
var grievanceUserType=(document.getElementById("grievance_userType")).innerText;
var complainantName=document.getElementById("grievance_userName").value;
var getRadios = document.getElementsByName("griv_gender");
var selctedRadio= Array.from(getRadios).find(radio => radio.checked);
var gender=selctedRadio.value;
var emailId=document.getElementById("grievance_emailId").value;
var complaintCategory = document.getElementById('grievance_category_complaint').value;
var department = document.getElementById('grievance_department').value;
var complaintDetails=document.getElementById("grievance_complaint").value;
var mobileNumber=document.getElementById("grievance_mobileNumber").value;
alert(grievanceUserType+complainantName+gender+emailId+complaintCategory+department+complaintDetails+mobileNumber);
fetch(`http://localhost:8080/College_Final_Year_Project/griv?userType=${grievanceUserType}&complaintName=${complainantName}&gender=${gender}&emailId=${emailId}
&complaintCategory=${complaintCategory}&department=${department}&complaintDetails=${complaintDetails}&mobileNumber=${mobileNumber}`
		  ,{
		   mode:"no-cors"
		 ,  credentials:'same-origin'})

} 
}