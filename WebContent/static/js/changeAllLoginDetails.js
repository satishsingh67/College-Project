$(document).ready(function(){
    console.log("Page Loaded");
    $('#changeAllDetailsSubmitButton').click(function (event) {
        event.preventDefault();
        var form = $('#changeAllLoginDetails')[0];
        // Create an FormData object 
        var data = new FormData(form);
        data.append("action", "changeAllLoginDetails");
        // disabled the submit button
        $("#changeAllDetailsSubmitButton").prop("disabled", true);
        $.ajax({
          type: "POST",
          enctype: 'multipart/form-data',
          url: "http://localhost:8080/College_Final_Year_Project/changeLoginDetails",
          data: data,
          processData: false,
          contentType: false,
          success: function (data, textStatus, jqXHR) {
            if (data.trim() == 'Login Details Updated Successfully') {
              swal("Done", data, "success");
              $('#changeAllLoginDetails')[0].reset();
            }
            else {
              swal("Error", data, "error");
            }
            $("#changeAllDetailsSubmitButton").prop("disabled", false);
          },
          error: function (jqXHR, textStatus, errorThrown) {
            swal("Error", data, "error");
            $("#changeAllDetailsSubmitButton").prop("disabled", false);
          }
        });
      });

});