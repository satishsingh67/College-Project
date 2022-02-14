$(document).ready(function () {
  console.log("Page loaded");
  $('#feedbackSubmitButton').click(function (event) {
    event.preventDefault();

    $('#myModal').show();
    //Calling Loader
    $(".loader1").show();
    //Scrolling window to  top 
    $(window).scrollTop(0);
    var form = $('#libraryFeddbackForm')[0];
    // Create an FormData object 
    var data = new FormData(form);

    // disabled the submit button
    $("#feedbackSubmitButton").prop("disabled", true);
    $.ajax({
      type: "POST",
      enctype: 'multipart/form-data',
      url: "http://localhost:8080/College_Final_Year_Project/libraryFeddback",
      data: data,
      processData: false,
      contentType: false,
      success: function (data, textStatus, jqXHR) {

        $(".loader1").hide();
        $('#myModal').hide();

        if (data.trim() == 'Feedback Submitted Successfully.Thank you') {
          swal("Done", data, "success");
          $('#libraryFeddbackForm')[0].reset();
        }
        else {
          swal("Error", data, "error");
        }
        $("#feedbackSubmitButton").prop("disabled", false);
      },
      error: function (jqXHR, textStatus, errorThrown) {

        $(".loader1").hide();
        $('#myModal').hide();

        swal("Error", data, "error");
        $("#feedbackSubmitButton").prop("disabled", false);
      }
    });
  });
});