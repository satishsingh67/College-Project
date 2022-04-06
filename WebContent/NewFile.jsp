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
  <script src="./lib/jquery.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table class="table table-striped">
    <thead style="background-color: #F0F1F2">
       <tr>
         <th>Incident Id</th>
         <th>Party Name</th>
         <th>Max Rank</th>
         <th>Incident Description</th>
       </tr>
   </thead>
   <tbody>

      <tr class="t">                                
         <td>1</td>
         <td>qx</td>
         <td>2</td>
         <td>3</td>
      </tr>
             <tr class="t">                                
         <td>1</td>
         <td>xsa</td>
         <td>2</td>
         <td>3</td>
      </tr>
      
      <tr class="t">                                
         <td>1</td>
         <td>aa</td>
         <td>2</td>
         <td>3</td>
      </tr>
                
 </tbody>
</table>
<input id="incidentId" value=""/>
<script>
$('.t').on('click',function(){
	
	var row = $(this).closest('tr');
    
    var id = $(row).find('td').eq(1).html();
    console.log(id);
});

</script>



</body>
</html>