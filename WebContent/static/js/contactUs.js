window.onload = function(){
	//alert(document.getElementById("Contact_FullName").value);

	var saveBtn=document.getElementById("contact_submit");
saveBtn.onclick=function(){
	
	var fullName=document.getElementById("Contact_FullName").value;
	var emailID=document.getElementById("Contact_Email").value;
	var mobileNumber=document.getElementById("Contact_Mobile_Number").value;
	var message=document.getElementById("Contact_Message").value;
	alert(fullName+" "+emailID+" "+mobileNumber+" "+message);
	 fetch(`http://localhost:8080/College_Final_Year_Project/contactUS?FullName=${fullName}&EmailId=${emailID}&MobileNumber=${mobileNumber}&Message=${message}`
			  ,{
			   mode:"no-cors"
			 ,  credentials:'same-origin'})
			 .then(response => response.json())
			 .then(data => alert(data));
}
}