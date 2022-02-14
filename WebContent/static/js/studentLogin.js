$(document).ready(function () {
    console.log("Page loaded");
    $('#loginSubmit').click(function (event) {
      event.preventDefault();

      $('#myModal').show();
      //Calling Loader
      $(".loader1").show();
      //Scrolling window to  top 
      $(window).scrollTop(0);
      

      var form = $('#studentLogin')[0];
      // Create an FormData object 
      var data = new FormData(form);

      // disabled the submit button
      $("#loginSubmit").prop("disabled", true);
      $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "http://localhost:8080/College_Final_Year_Project/studentLogin",
        data: data,
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
        	  $(".loader1").hide();
              $('#myModal').hide();
          if (data.trim().includes("Please Enter/Choose a valid")) {
        	  swal("Error", data, "error");
        	  $("#loginSubmit").prop("disabled", false);
          }else if(data.trim().includes("Invalid")){
        	  swal("Error", data, "error");
        	  $('#studentLogin')[0].reset();
        	  $("#loginSubmit").prop("disabled", false);
          }
          
          else{
          window.location.href = data;
          }
        },
        error: function (jqXHR, textStatus, errorThrown) {
          $(".loader1").hide();
          $('#myModal').hide();
    
          swal("Error", data, "error");
          $("#loginSubmit").prop("disabled", false);
        }
      });
    });
  });