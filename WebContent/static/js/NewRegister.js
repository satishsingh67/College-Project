$(document).ready(function () {
  console.log("added");
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
