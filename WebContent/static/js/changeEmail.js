$(document).ready(function () {
  console.log("Page loaded");
  $('#emailCorrectionSubmitButton').click(function (event) {
    event.preventDefault();
    var form = $('#changeEmail')[0];
    // Create an FormData object 
    var data = new FormData(form);
    data.append("action", "changeEmail");
    // disabled the submit button
    $("#emailCorrectionSubmitButton").prop("disabled", true);
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "http://localhost:8080/College_Final_Year_Project/changeLoginDetails",
      data: data,
      processData: false,
      contentType: false,
      success: function (data, textStatus, jqXHR) {
        if (data.trim() == 'Email Updated Successfully') {
          swal("Done", data, "success");
          $('#changeEmail')[0].reset();
        }
        else {
          swal("Error", data, "error");
        }
        $("#emailCorrectionSubmitButton").prop("disabled", false);
      },
      error: function (jqXHR, textStatus, errorThrown) {
        swal("Error", data, "error");
        $("#emailCorrectionSubmitButton").prop("disabled", false);
      }
    });
  });
});