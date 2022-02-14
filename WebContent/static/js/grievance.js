$(document).ready(function(){
	console.log("Page loaded..");
$('#grievance_submit').click(function(e){
	e.preventDefault();
//Calling model
$('#myModal').show();
//Calling Loader
$(".loader1").show();
//Scrolling window to  top 
$(window).scrollTop(0);


	 $("#grievance_submit").prop("disabled", true);
	var grievanceUserType=$('#grievance_userType').text();
	var complainantName=$('#grievance_userName').val(); 
	var gender=$('input[name="griv_gender"]:checked').val();
	var emailId=$('#grievance_emailId').val();
	var complaintCategory=$('#grievance_category_complaint').val();
	var department=$('#grievance_department').val();
	var complaintDetails=$('#grievance_complaint').val();
	var mobileNumber=$('#grievance_mobileNumber').val();

	
	$.ajax({
		url: "http://localhost:8080/College_Final_Year_Project/griv",
		method:"POST", 
		data: {userType:grievanceUserType,complaintName:complainantName,gender:gender,emailId:emailId,complaintCategory:complaintCategory,
			department:department,complaintDetails:complaintDetails,mobileNumber:mobileNumber},
		 success: function(data,textStatus,jqXHR){
			 //hiding loader and model
			$(".loader1").hide();
			$('#myModal').hide();
		console.log(data);
		if(data.trim()=='Complaint Submitted Successfully'){
			
			swal("Done", data, "success");
			$("input[type=text], textarea").val("");
			$('#grievance_userType').text("--Select--");
			$("#grievance_emailId").val("");
		    $('input[name="griv_gender"]').prop( "checked", false );
			$('#grievance_category_complaint').val("--Select--");
			$('#grievance_category_complaint').val("--Select--");
			$('#grievance_department').val("--Select--");
		}
		else{
			
			swal("Error",data,"error");
		}
		
		 $("#grievance_submit").prop("disabled", false);
		
	  },
	  error:function(jqXHR,textStatus,errorThrown){
		$(".loader1").hide();
		$('#myModal').hide();
		  swal("Error",data,"error");
		    $("input[type=text], textarea").val("");
			$('#grievance_userType').text("--Select--");
			$("#grievance_emailId").val("");
		    $('input[name="griv_gender"]').prop( "checked", false );
			$('#grievance_category_complaint').val("--Select--");
			$('#grievance_category_complaint').val("--Select--");
			$('#grievance_department').val("--Select--");  
			 $("#grievance_submit").prop("disabled", false);
	  }
	 
	  
	});
console.log("Data Sent");
    
});	
});