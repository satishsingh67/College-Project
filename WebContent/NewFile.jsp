<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% out.print("welcome to jsssp"); %>  

<div class="loader">
<div class="preloader-wrapper big active">
    <div class="spinner-layer spinner-blue-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>

  <div class="preloader-wrapper active">
    <div class="spinner-layer spinner-red-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>

  <div class="preloader-wrapper small active">
    <div class="spinner-layer spinner-green-only">
      <div class="circle-clipper left">
        <div class="circle"></div>
      </div><div class="gap-patch">
        <div class="circle"></div>
      </div><div class="circle-clipper right">
        <div class="circle"></div>
      </div>
    </div>
  </div>


</div>

<div class="container">
 
  <!-- Button to Open the Modal -->
<button type="button" class="btn btn-primary btn-block btn-lg" id="openTable">
  Open modal
</button>

  
  <!-- The Modal -->
<div class="modal" id="myModal">
<!--   <div class="modal-dialog"> -->
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title" style="text-align: center;">Doubt History</h4>
        <button type="button" id="cl" style="float:right;margin-top:-50px;">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div style="height:270px;overflow-y: auto;">
          <table class="table table-striped">
    <thead >
        <th style="display:none">DoubtId</th>
        <th style="text-align: center;">Create Date</th>
        <th style="text-align: center;">Update Date</th>
        <th style="text-align: center;">Question</th>
        <th style="text-align: center;">Ansered</th>
    </thead>
    <tbody>
      <tr>
        <td style="display:none">John</td>
        <td>Doe</td>
         <td>Doe</td>
        <td><textarea id="w3review" name="w3review" rows="5" cols="15">john@example.com</textarea></td>
        <td><textarea id="w3review" name="w3review" rows="5" cols="15">john@example.com</textarea></td>
     
      </tr>
    
    </tbody>
  </table>
  </div>
  </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
 <!--  </div> -->
</div>
</div>
<script>
$(document).ready(function () {
	  console.log("Jquery loded");
	  $('#openTable').click(function (event) {
		
		  $('#myModal').show();
		  $('#openTable').prop("disabled", true);
		  
	  });
	  $('#cl').click(function (event) {
		  $('#myModal').hide();
		  $('#openTable').prop("disabled", false);
	  });
});

</script>
</body>
</html>