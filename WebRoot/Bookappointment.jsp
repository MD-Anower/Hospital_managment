<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'makeappointment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/main_css.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
	
		.containertop {
			width:84%;
			height: 1in;
			
			margin-left: 100px;
			margin-top:0px;
			background-color:  #f8d7da;
			
			border-top-right-radius: 2.5em;
					
		}
		.containertop h1{
			color: red;
			margin-left: 50px;
			padding-top: 10px;
		}
		.containertop h1 img{
			margin-right: 200px;
		}
		
		label{
			color: white;
		}
		body {
 			background-color:gray;
 			background-size: 100%;
		}
		#tips{
		   height: 70px;
		    width: 7.7in;
		    margin-left:5.3in;
		    margin-top: 20px;
		    background-color: ;
		}

		#tips-border{
		    border-top-right-radius: 1em;
		}
		.pointer-in{
			margin-left: 200px;
			margin-top: -40px;
		}
		.pointer-in p{
			background-color: #000099;
			color: white;
			padding-left: 10px;
			margin-left: -25px;
			margin-top: -5px;
		}
		#below{
			width: 84%;
			margin-left: 100px;
			margin-top: 0px;
		}
		
		.container {
			width:800px;
			margin-top:0px;
			margin-left: 100px;
			background-color: white;
			border-bottom-left-radius: 2.5em;
			
		}
		.container h2{
			padding-left:45px;
			background-color: thistle;
			margin: -1px,-1px,-1px -1px;
			color: brown;
			border-radius: 2em;
		}
		
		label{
			color: white;
		}
		.form-controlFN{
			width: 350px;
			height: 40px;
			padding-left: 10px;
		}
		.form-controlLN{
			padding-left: 10px;
			margin-left: 40px;
			width: 350px;
			height: 40px;
		}
		.form-controlFA{
			width: 500px;
			height: 40px;
			padding-left: 10px;
		}
		.form-controlCN{
			width: 200px;
			height: 40px;
			margin-left: 40px;
			padding-left: 10px;
		}
		.form-controlPHN{
			width: 350px;
			height: 40px;
			padding-left: 10px;
		}
		.form-controEMAIL{
			padding-left: 10px;
			margin-left: 40px;
			width: 350px;
			height: 40px;
		}
		.gender{
			padding-left: 10px;
			margin-left:-45px;
			width: 250px;
			height: 40px;
		}
		.blood{
			width: 160px;
			height: 40px;
			padding-left: 10px;
		}
		.age{
			width: 140px;
			height: 40px;
			padding-left: 10px;
			
		}
		.input100{
			width: 100%;
			height: 150px;
			padding-left: 10px;
		}
		
					
	</style>

  </head>
  
  <body>
     <div class="containertop">
    <h1> <img src="images/logo-hospitalmake.png" width="250px" height=70px" margin-right:"50px"  >  DAILY CARE HOSPITAL </h1> <br>
    </form>
    </div>
    <nav id="tips">
           <div id="header">
        	<div id="header-ul-li">
            <ul id="headerul">
                <li ><a href="#">Home</a></li>
                <li ><a href="makeappointment.jsp">Make Appoinment</a></li>
                <li ><a href="studentlist.jsp">Doctor List</a></li>
                <li ><a href="Contact.jsp">Contact Us</a></li>
                <li ><a href="test/test.html">About</a>
                </li>
               <a href="www.linkeding.com/in/anower33"> <img class="linkdin-icon" src="img_social_icon/linkdin.png" height="30px" width="30px"> </a>
                <a href="www.twitter.com/MDAnower9"><img class="twitter-icon" src="img_social_icon/Twitter-512.png" height="30px" width="30px"></a>
                <a href="www.facebook.com/anower33"> <img class="facebook-icon" src="img_social_icon/facebook.png" height="20px" width="30px"></a>
            </ul>
        </div>
       
        </nav>
        
        <img id="below" src =" images/insteadofslide.png">
    <div class="container">
    <h2>Book an Appointment </h2> <br>
    <form  method="post" action="doBookappointmentServlet.do?type=Bookappointment">  
    	<div class="form-group">
		    <input type="text" placeholder="First Name" class="form-controlFN" id="firstname" name="firstname" >
		    <input type="text" placeholder="Last Name" class="form-controlLN" id="lastname"  name="lastname">		   
	    </div>
	    <div class="form-group">
		    <input type="text"  placeholder="Full Address"  class="form-controlFA" id="fulladdress"  name="fulladdress">
		    <input type="text"  placeholder="City Name" class="form-controlCN" id="cityname"  name="cityname">			   
	    </div>
	   
	    <div class="form-group">
		  
		    <input type="text" placeholder="Your Phone Number" class="form-controlPHN" id="phnnumber"  name="phnnumber">
		     <input type="email" placeholder="Your Email Address" class="form-controEMAIL" id="email"  name="email">		   
	    </div>
	     <div class="form-group">
		  
		    <input type="Date" value="Birth year-month-day" class="form-controlPHN" id="dateofbirth"  name="dateofbirth">
		     <input type="slot" placeholder="Appointment Time" class="form-controEMAIL" id="appointmenttime"  name="appointmenttime">		   
	    </div>
	    <div class="form-group">
	    <p>EMERGENCY DETAILS</p>
	    	 <input type="text" placeholder="Contact Person" class="form-controlFN" id="firstname" name="contactperson" >
			  
			  <label for="blood">Blood</label>
			  <select  class="blood"  placeholder="blood" id="blood" name="bloodgroup">
			    <option >Blood Group</option>
			    <option >A+</option>
			    <option  >B+</option>
			     <option  >AB+</option>
			    <option >AB-</option>
			     <option >A-</option>
			    <option >B-</option>
			    
			  </select>
			  
			  <label for="age">Age</label>
			  <select  class="age"  placeholder="age" id="age" name="age">
			    <option >Age</option>
			    <option >-18</option>
			    <option  >18-40</option>
			     <option  >41-60</option>
			    <option >61+</option>
			    
			  </select>
			  
			   
	    </div>
	    
	    <div class="form-group">
	    <label for="gender">Gender</label>
			  <select  class="gender"  placeholder="Gender" id="gender" name="gender">
			    <option >gender</option>
			    <option >male</option>
			    <option  >female</option>
			    <option  >common</option>
			  </select>
	    </div>
	    
	    <div class="form-group">
				<textarea class="input100" name="specialmessage" placeholder="Special Message..."></textarea>
				<span class="focus-input100"></span>		   
	    </div>
	    
	    
	  <button type="submit" class="btn btn-primary">Bookappointment</button>
    </form>
    </div>
        
        <div id="footer">
		<div style="text-align: center;">
			Copyright @ 2019 MD ANOWER
		</div>
	</div>
         
  </body>
</html>
