<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightgallery-js/1.4.0/css/lightgallery.min.css">
   
   
    <script src="./lib/jquery.min.js"></script>
    <script src="./lib/sweetalert.min.js"></script>
    
    <style>
        #customers {
      font-family: Arial, Helvetica, sans-serif;
      border-collapse: collapse;
      width: 100%;
    }
    
    #customers td, #customers th {
      border: 1px solid #ddd;
      padding: 8px;
    }
    
    #customers tr:nth-child(even){background-color: #f2f2f2;}
    
    #customers tr:hover {background-color: #ddd;}
    
    #customers th {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: left;
      background-color: #04AA6D;
      color: white;
    }
    .view-btn{
          width: 90px;
          background-color: lightblue;
        }
    /* The Modal (background) */
    .modal {
          display: none;
          /* Hidden by default */
          position:fixed;
          /* Stay in place */
          z-index: 1;
          /* Sit on top */
          padding-top: 100px;
          /* Location of the box */
          left: 0;
          top: 0;
          width: 100%;
          /* Full width */
          height: 100%;
          /* Full height */
          overflow: auto;
          /* Enable scroll if needed */
       /*   background-color: rgb(0, 0, 0);*/
          /* Fallback color */
        /*  background-color: rgba(0, 0, 0, 0.4);
          /* Black w/ opacity */
        }
    
        /* Modal Content */
        .modal-content {
        
          
          margin: auto;
       
          padding: 20px;
          border: 1px solid #888;
          width: 50%;
          height: 50%;
          background-color: cadetblue;
          box-shadow: 5 px 5px 5px solid red;
        }
    
        /* The Close Button */
        .close {
           
          color: #ffffff;
          float: right;
          margin-left: 97%;
          margin-top: -3%;
          font-size: 28px;
          font-weight: bold;
          background-color: black;
          border-radius:5px ;
          
        }
    
        .close:hover,
        .close:focus {
          color: rgb(215, 230, 17);
          text-decoration: none;
          cursor: pointer;
        }
        .heading {
  text-align: center;
  margin-bottom: 3rem;
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.heading span {
  color: #2597f4;
}

.btn {
  display: inline-block;
  margin-top: 1rem;
  padding: 1rem 3rem;
  cursor: pointer;
  background: #fff;
  font-size: 1.7rem;
  text-transform: capitalize;
  color: #334;
  border: 0.2rem solid #334;
}

.btn:hover {
  background: #2597f4;
  border-color: #2597f4;
  color: #fff;
}

.header .contact-info {
  padding: 2rem 10%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background: #39b32e;
}

.header .contact-info p {
  font-size: 1.5rem;
  color: #fff;
}

.header .contact-info p i {
  padding-right: 0.5rem;
  color: yellow;
}

.header .navbar {
  padding: 2rem 10%;
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -webkit-box-pack: justify;
  -ms-flex-pack: justify;
  justify-content: space-between;
  background: rgb(25, 122, 167);
  border-bottom: 0.2rem solid #334;
  position: relative;
  z-index: 1000;
}

.header .navbar.active {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  border-bottom: none;
  -webkit-box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
  box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
}

.header .navbar .logo {
  width: 130px;
  height: 60px;
}

.header .navbar .logo i {
  color: #2597f4;
}

.header .navbar .links a {
  margin-left: 2rem;
  font-size: 2rem;
  text-transform: capitalize;
  color: rgb(254, 254, 255);
}

.header .navbar .links a:hover {
  text-decoration: underline;
  color: #eefa41;
}

.header #menu-btn {
  font-size: 3rem;
  cursor: pointer;
  color: #334;
  display: none;
}

.home {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
  -ms-flex-align: center;
  align-items: center;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  gap: 3rem;
}

.home .image {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .image img {
  width: 50%;
}

.home .content {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 42rem;
  flex: 1 1 42rem;
}

.home .content h3 {
  font-size: 4rem;
  text-transform: capitalize;
  color: #334;
}

.home .content p {
  font-size: 1.5rem;
  line-height: 2;
  color: #777;
  padding: 1rem 0;
}
section {
  padding: 5rem 10%;
}

    </style>
    
    <title>All Queries </title>
</head>
<body>
  <header class="header">
    <nav class="navbar">
 
       <img src="./images/GNIT_Kolkata_logo.png" class="logo">  
 
       <div class="links">
          <a href="#home">home</a>
          <a href="#about">Information</a>
          <a href="./contactus.html">Contact Us</a>
          
          
         
          <a href="/College_Final_Year_Project/logout?action=canvas">Log Out</a>
       </div>
       <img src="./images/teachers/1200px-JIS_University.svg.png" class="logo">  
       <div id="menu-btn" class="fa fa-bars"></div>
 
    </nav>
 
 </header>

<!-- header section ends -->

<!-- home section starts  -->

<section class="home" id="home">
 <div class="content">
    <h4>Name Of The Teacher</h4>
    <p>Assistant Prof. of ECE Depertment</p>
   <p>Id:</p>
 </div>

</section>
  <section>
    <table id="customers">
      <thead>
        <th>Name</th>
        <th>Relation</th>
        <th>Department</th>
        
       
        <th>Post Type</th>
        <th>View</th>
        <th>Accept</th>
        <th>Reject</th>
        
      </thead>
     
      <tr>
  <td>Sornali Hazra</td>
  <td>Student</td>
  <td>ECE</td>
  <td>Cutural Fest</td>
  <td><button class="view-btn" id="bt">View</button></td>
 
  
  <td><button class="view-btn" >Accept</button></td>
  <td><button class="view-btn" >Reject</button></td>
  
      </tr>
  
      
     
    </table>
  
    <div id="myModal" class="modal">

      <!-- Modal content -->
      <div class="modal-content">
        <span class="close" id="s" >&times;</span>
       
        <div id="tableDiv">
          
          <embed src="./fpdf/4.2.1-with-front-page.pdf" height="400px" width="900px" type="application/pdf">
           

        </div>


      </div>
  
    </div>
  </section>
<script>
$("#bt").click(function (event) {
  $('#myModal').show();
        //Calling Loader
        $(".loader1").show();


});
$("#s").click(function (event) {
  $('#myModal').hide();
        //Calling Loader
        $(".loader1").hide();


});




</script>

</body>
</html>





