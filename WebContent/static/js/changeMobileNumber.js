$(document).ready(function () {
  console.log("Jquery loded");
  $("#changeMobileNumberSubmitButton").click(function (event) {
    event.preventDefault();
    var form = $('#changeMobileNumber')[0];
    // Create an FormData object 
    var data = new FormData(form);
    data.append("action", "changeMobileNumber");
    // disabled the submit button
    $("#changeMobileNumberSubmitButton").prop("disabled", true);
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "http://localhost:8080/College_Final_Year_Project/changeLoginDetails",
      data: data,
      processData: false,
      contentType: false,
      success: function (data, textStatus, jqXHR) {
        if (data.trim() == 'Mobile Number Updated Successfully') {
          swal("Done", data, "success");
          $('#changeMobileNumber')[0].reset();
        }
        else {
          swal("Error", data, "error");
        }
        $("#changeMobileNumberSubmitButton").prop("disabled", false);
      },
      error: function (jqXHR, textStatus, errorThrown) {
        swal("Error", data, "error");
        $("#changeMobileNumberSubmitButton").prop("disabled", false);
      }
    });
  });
});