$(document).ready(function(){
    console.log("lib is  added in external");
   
    $('#subButton').click(function (e) {

        e.preventDefault();
        $('#secAnsw').val("");
console.log("Data added");
$.ajax({
    url: "http://localhost:8080/College_Final_Year_Project/contactUS", 
    data: {id : "menuId"},
     success: function(result){
    console.log("api called");
  }});
    }
    );
    
}  );
   