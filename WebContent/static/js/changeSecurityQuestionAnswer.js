$(document).ready(function () {
    console.log("Page loaded");
    $('#securityAnswerSubmitButton').click(function (event) {
        event.preventDefault();


        $('#myModal').show();
        //Calling Loader
        $(".loader1").show();
        //Scrolling window to  top 
        $(window).scrollTop(0);


        var form = $('#changeSecurityQuestionAnswer')[0];
        // Create an FormData object 
        var data = new FormData(form);
        data.append("action", "changeSecurityQuestionAnswer");
        // disabled the submit button
        $("#securityAnswerSubmitButton").prop("disabled", true);
        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "http://localhost:8080/College_Final_Year_Project/changeLoginDetails",
            data: data,
            processData: false,
            contentType: false,
            success: function (data, textStatus, jqXHR) {
                $(".loader1").hide();
                $('#myModal').hide();

                if (data.trim() == "Security Question's Answer Updated Successfully") {
                    swal("Done", data, "success");
                    $('#changeSecurityQuestionAnswer')[0].reset();
                }
                else {
                    swal("Error", data, "error");
                }
                $("#securityAnswerSubmitButton").prop("disabled", false);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $(".loader1").hide();
                $('#myModal').hide();

                swal("Error", data, "error");
                $("#securityAnswerSubmitButton").prop("disabled", false);
            }
        });
    });
});