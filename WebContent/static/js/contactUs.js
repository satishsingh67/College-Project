$(document).ready(function(){
	$('#contact_submit').click(function(e){
		e.preventDefault();
      var fullName=$('#Contact_FullName').val();
	  var emailID=$('#Contact_Email').val();
	  var mobileNumber=$('#Contact_Mobile_Number').val();
	  var message=$('#Contact_Message').val();
	  $.ajax({
		url: "http://localhost:8080/College_Final_Year_Project/contactUS",
		method:"POST", 
		data: {FullName:fullName,EmailId:emailID,MobileNumber:mobileNumber,Message:message.trim()},

		 success: function(data,textStatus,jqXHR){
		console.log(data);
		if(data.trim()=='Contact Request Submiited Successfully'){
			swal("Done", data, "success");
		}
		else{
			swal("Error",data,"error");
		}
	  },
	  error:function(jqXHR,textStatus,errorThrown){
		  swal("Error",data,"error");
	  }
	});
	//Clearing form
	$("input[type=text], textarea").val("");
    $('#Contact_Email').val("");
	});
});