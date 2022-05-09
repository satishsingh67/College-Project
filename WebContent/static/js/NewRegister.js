$(document).ready(function () {
	
	fetchDropDown("department","departmentSelect");
	fetchDropDown("courseType","courseTypeSelect");
	fetchDropDown("semester","semesterSelect");
	fetchDropDown("section","sectionSelect");
	
	
	
  $("#regSubmit").click(function (event) {
      //stop submit the form, we will post it manually.
      event.preventDefault();
    
$('#myModal').show();
//Calling Loader
$(".loader1").show();
//Scrolling window to  top 
$(window).scrollTop(0);
      // Get form
      var form = $('#registForm')[0];
     // Create an FormData object 
      var data = new FormData(form);
     // disabled the submit button
      $("#regSubmit").prop("disabled", true);
      $.ajax({
          type: "POST",
          enctype: 'multipart/form-data',
          url: "http://localhost:8080/College_Final_Year_Project/register",
          data: data,
          processData: false,
          contentType: false,
          success: function(data,textStatus,jqXHR){
            $(".loader1").hide();
		      	$('#myModal').hide();
            console.log(data);
            if(data.trim()=='Registration Form Submitted Successfully'){
              swal("Done", data, "success");
              $('#registForm')[0].reset();
            }
            else{
              swal("Error",data,"error");
            }
            $("#regSubmit").prop("disabled", false);
            },
          error:function(jqXHR,textStatus,errorThrown){
            $(".loader1").hide();
		      	$('#myModal').hide();
            swal("Error",data,"error");
            $("#regSubmit").prop("disabled", false);
          }
      });
      
     
  });

  
  
});


function fetchDropDown(action,id){
	
	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/dropdown?action="+action,
		      success: function (data, textStatus, jqXHR) {
		    	  var JsonData= jQuery.parseJSON(data);
		    	 if(JsonData==null){
		    		 $('#'+id).append(new Option("No Option is Present",""));
		    	 }
		    	 else{
		          $(JsonData).each(function (index, item) {  
		        	  $('#'+id).append(new Option(item.name.trim(), item.pkId));
		          }); 
		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
		    	  $('#'+id).append(new Option("No Option is Present",""));
		      }
		    });  
}

