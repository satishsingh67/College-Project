<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="Description" content="Enter your description here" />
  <title>Beyond Curriculum</title>
  <!-- bootstrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
  <script src="./lib/jquery.min.js"></script>
  <script src="./lib/sweetalert.min.js"></script>
  <!-- OWN CSS -->
  <link rel="stylesheet" href="css/subject.css">
  <link rel="stylesheet" href="css/responsive-style.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600&display=swap');

:root{
   --blue:#00b8b8;
   --black:#333;
   --white:#fff;
   --light-color:#666;
   --light-bg:#eee;
   --border:.2rem solid rgba(0,0,0,.1);
   --box-shadow:0 .5rem 1rem rgba(0,0,0,.1);
}
.link-btn{
   display: inline-block;
   padding:1rem 3rem;
   border-radius: .5rem;
   background-color: var(--blue);
   cursor: pointer;
   font-size: 1.7rem;
   color:var(--white);
}

.link-btn:hover{
   background-color: var(--black);
   color:var(--white);
}
.heading{
   text-align: center;
   font-size: 2rem;
   color:var(--black);
   text-transform: uppercase;
   font-weight: bolder;
   margin-bottom: 3rem;
}
    .about .row{
   min-height: 50vh;
}

.about .content span{
   font-size: 2rem;
   color:var(--blue);
}

.about .content h3{
   font-size: 3rem;
   color:var(--black);
   margin-top: 1rem;
}

.about .content p{
   padding:1rem 0;
   font-size: 1.4rem;
   color:var(--light-color);
   line-height: 2;
   
}
.process .box-container{
   display: grid;
   grid-template-columns: repeat(auto-fit, minmax(30rem, 1fr));
   gap:1rem;
}

.process .box-container .box{
   background-color: var(--blue);
   padding:2rem;
   border-radius: .5rem;
   text-align: center;
   box-shadow: var(--box-shadow);
}

.process .box-container .box img{
   height: 10rem;
   margin:1rem 0;
}

.process .box-container .box h3{
   font-size: 2rem;
   color:var(--white);
   margin:1.5rem 0;
}

.process .box-container .box p{
   font-size: 1.5rem;
   color:var(--white);
   line-height: 2;
}
 .loader2 {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid blue;
  border-bottom: 16px solid blue;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 1s linear infinite;
  animation: spin 1s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

  </style>
</head>

<body>
  <!-- header design -->
  <header>
    <nav class="navbar navbar-expand-lg navigation-wrap">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="images/GNIT_Kolkata_logo.png"></a>
       
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText"
          aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <i class="fas fa-stream navbar-toggler-icon"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#place1">Arts&Crafts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#place2">Painting</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#place3">Poster</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./canvasHomePage.jsp">Gallery </a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="./canvasWriteUp.jsp">Write Ups</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./canvasSocialService.jsp">Social Service</a>
              </li>
           
           
            
            <li><img class="images" src="./jis.jpeg"></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>
   
  <!-- section-1 top-banner -->
  <section id="home" style="background-color: wheat;">
   
    <div class="container-fluid px-0 top-banner">
        <h1 style="text-align: center;">BEYOND CURRICULUM</h1>
      <div class="container">
        <div class="row">
          <div class="col-lg-7 col-md-8">
           
          </div>

          <div class="col-lg-3 col-md-4">
              </div>
        </div>
      </div>
    </div>
  </section>
  <hr>
 
 <hr>
    
  
      
  <!-- section-4 explore food-->
   <section id="write">
     <div  id="place1"  class="explore-food wrapper " style=" background-color: lightcyan;">
       <div class="container" style="margin-top:-100px;">
           <div class="col-sm-12">
             <div class="text-content text-center">
                <h2 style="font-family: 'Times New Roman', Times, serif; border-bottom: 2px solid red;">Arts & Crafts</h2>
            
            
           </div>
         </div>
           <br>
         <br>
         <div class="row" id="ArtsAndCraftsFiles" style="border:1px solid lightcyan;">
        
         
         </div>
         </div>
       </div>

   </section><br>
   <hr>

  <!-- section-4 explore food-->
  <section id="write">
    <div id="place2"  class="explore-food wrapper " style=" background-color: lightcyan;">
      <div class="container" style="margin-top:-100px;">
          <div class="col-sm-12">
            <div class="text-content text-center">
               <h2 style="font-family: 'Times New Roman', Times, serif; border-bottom: 2px solid red;">Painting</h2>
           
           
          </div>
        </div>
         <br>
         <br>
         <div class="row" id="paintingFiles" style="border:1px solid lightcyan;">
        
         
         </div>
      </div>
    </div>
  </section>
  <br>
   <hr>
<!-- section-4 explore food-->
<section id="write">
    <div id="place3" class="explore-food wrapper " style=" background-color: lightcyan;">
      <div class="container" style="margin-top:-100px;">
       <div class="col-sm-12">
            <div class="text-content text-center">
               <h2 style="font-family: 'Times New Roman', Times, serif; border-bottom: 2px solid red;">Poster Presentation</h2>

          </div>
        </div>
           <br>
         <br>
         <div class="row" id="posterFiles" style="border:1px solid lightcyan;">
        
         
         </div>
      </div>
    </div>
  </section>

  
  <!-- section-9 footer-->
  <footer id="footer">
    <div class="footer py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <a class="footer-link" href="./canvas.html">Blog</a>
            <a class="footer-link" href="./contactus.html">Contact Us</a>
            <a class="footer-link" href="./newhome.html">home</a>
            <a class="footer-link" href="./campuslife.html">Campus</a>
            <div class="footer-social pt-4 text-center">
              <a href="#"><i class="fab fa-facebook-f"></i></a>
              <a href="#"><i class="fab fa-twitter"></i></a>
              <a href="#"><i class="fab fa-youtube"></i></a>
              <a href="#"><i class="fab fa-dribbble"></i></a>
              <a href="#"><i class="fab fa-linkedin"></i></a>
              <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
          </div>
          <div class="col-sm-12">
            <div class="footer-copy">
              <div class="copy-right text-center pt-5">
                <p class="text-light">©Developer- Sornali Hazra & @Satish Singh</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>
   
     
<div class="loader2" style="margin-top:-68%;margin-left:48%;display:none" id="myLoader"></div>
     <div class="loader2" style="margin-top:18%;margin-left:48%;display:none" id="myLoader1"></div>
     <div class="loader2" style="margin-top:18%;margin-left:48%;display:none" id="myLoader2"></div>
   
   
   

  <!-- JS Libraries -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
  <!-- own js -->
  <script src="js/subject1.js"></script>
  
  <script>
  $(document).ready(function(){
  $('#myLoader').show();
 $('#myLoader1').show();
 $('#myLoader2').show();
	fetchCanvasFiles();
  
  
  
  });
  function fetchCanvasFiles(){
	  	
 	 $.ajax({
		      type: "GET",
		      url:"/College_Final_Year_Project/canvas?action=canvasBeyondCurricullam",
		      success: function (data, textStatus, jqXHR) {
		     var JsonData= jQuery.parseJSON(data);
		    
		    	 if(JsonData==null){
		    		 var test= '<h4 style="text-align:center">Sorry, no data found</h4>';
		    		 
		    		  $('#ArtsAndCraftsFiles').append(test);  
		    		   $('#paintingFiles').append(test);  
		    		   $('#posterFiles').append(test);   
		   		    $('#myLoader').hide();
		    	 $('#myLoader1').hide();
				    $('#myLoader2').hide();

		    	 }
		    	 else{
		    		 
		    		 if(JsonData.artsList.length>0){
		    	        $(JsonData.artsList).each(function (index, item) {  		        
		    		        
				    		var card='<div class="col-lg-4 col-md-6 mb-lg-0 mb-5">'
						           +'<div class="card"  style="margin-bottom:15px;height:500px;">'
						           +' <img src="'+item.filePath+' " style="height:450px;">'
						           +' <div class="pt-3">'
						           +'  <h4 style="text-align:center;">By : '+item.name+'</h4>'
						           +' </div>'
					              
						           +' </div>'
						           +'</div>  ';

					           $('#ArtsAndCraftsFiles').append(card);       
				     
				     });
		    	        $('#myLoader').hide();
		    		 }else{
		    			 var test= '<h4 style="text-align:center">Sorry, no data found</h4>';
			    		 
			    		  $('#ArtsAndCraftsFiles').append(test);  
			    	        $('#myLoader').hide();

		    		 }
		    		 
		    		 if(JsonData.paintingList.length>0){
		    		 
		          $(JsonData.paintingList).each(function (index, item) {  

		        	var card='<div class="col-lg-4 col-md-6 mb-lg-0 mb-5">'
		           +'<div class="card"  style="margin-bottom:15px;height:500px;">'
		           +' <img src="'+item.filePath+' " style="height:450px;">'
		           +' <div class="pt-3">'
		           +'  <h4 style="text-align:center;">By : '+item.name+'</h4>'
		           +' </div>'
	              
		           +' </div>'
		           +'</div>  ';

		             $('#paintingFiles').append(card);  
		              
		        	  
		          });
				    $('#myLoader1').hide();

		    		 }else{
		    			 var test= '<h4 style="text-align:center">Sorry, no data found</h4>';
			    		 
			    		  $('#paintingFiles').append(test);  
			  		    $('#myLoader1').hide();

		    		 }
		       
		    		 if(JsonData.posterList.length>0){
		        		
		        $(JsonData.posterList).each(function (index, item) {  		        
		        
		    		var card='<div class="col-lg-4 col-md-6 mb-lg-0 mb-5">'
				           +'<div class="card"  style="margin-bottom:15px;height:500px;">'
				           +' <img src="'+item.filePath+' " style="height:450px;">'
				           +' <div class="pt-3">'
				           +'  <h4 style="text-align:center;">By : '+item.name+'</h4>'
				           +' </div>'
			              
				           +' </div>'
				           +'</div>  ';

			           $('#posterFiles').append(card);       
		     
		     });
		 
		        $('#myLoader2').hide();
		        
		    		 }else{
		    			 var test= '<h4 style="text-align:center">Sorry, no data found</h4>';
			    		 
			    		  $('#posterFiles').append(test);  
			  		    $('#myLoader2').hide();

		    		 }

		    	 }
		      },
		      error: function (jqXHR, textStatus, errorThrown) {
		    	  var test= '<h4 style="text-align:center">Sorry, Something went wrong,Please refresh the page</h4>';
		    		 
	    		  $('#ArtsAndCraftsFiles').append(test);  
	    		   $('#paintingFiles').append(test);  
	    		   $('#posterFiles').append(test);   
	   		    $('#myLoader').hide();
	    	 $('#myLoader1').hide();
			    $('#myLoader2').hide();
		      }
		    });  
  	
  	
  }

  
  </script>
  
  
  
</body>
</html>

