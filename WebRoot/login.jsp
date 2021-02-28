<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/main_css.css">
	<link rel="stylesheet" type="text/css" href="css/footer_news.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
			width:400px;
			
			margin-top:130px;
			margin-left: 100px;
			background-color: #888888;
			/* border-bottom-left-radius: 2.5em; */
			border-top-right-radius: 2.5em;
					
		}
		.container h4{
			padding-left:45px;
			background-color: thistle;
			margin: -1px,-1px,-1px -1px;
			padding-bottom: 20px;
			color: brown;
			border-radius: 2em;
			
		}
		.containertop {
			width:84%;
			height: 1in;
			
			margin-left: 100px;
			margin-top: -432px;
			background-color: #f8d7da;
			
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
 			background-image: url("images/back.png");
 			background-size: 100%;
		}
		#tips{
		   height: 3.1in;
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
		#slide-image{
		   height: 2in;
		 	width: 70%;
		    margin-left: 20px;
		    margin-top: 10px;
		    padding-right: 20px;
		}

		#slide-img-border{
		    border-top-right-radius: 1em;
		}
		#below{
			width: 84%;
			margin-left: 100px;
			margin-top: 130px;
		}
				
	</style>

  </head>
  
  <body>
    <div class="container">
    <h4> <img src="images/logo-hospital.png" width="50px" height="40px" margin-right:"50px"  >  Admin Log-in System for DCH </h4> <br>
    
    <form method="post" action="doUserServlet.do?type=login">  
    	<div class="form-group">
		    <label for="userName">Admin User Name</label>
		    <input type="text" class="form-control" id="userName" name="userName" >		   
	    </div>
	    <div class="form-group">
		    <label for="password">Admin Password</label>
		    <input type="password" class="form-control" id="password"  name="password">		   
	    </div>
	    
	    <button type="submit" class="btn btn-primary">Login</button>
	    &nbsp;&nbsp;&nbsp;&nbsp;
	    
	    
	    <!-- <a href="register.jsp">Register</a> -->
	    
    </form>
    
    </div>
    
     <div class="containertop">
    <h1> <img src="images/logo-hospitalmake.png" width="250px" height=70px" margin-right:"50px"  >  DAILY CARE HOSPITAL </h1> <br>
    </form>
    </div>
    <nav id="tips">
           <div id="header">
        	<div id="header-ul-li">
            <ul id="headerul">
                <li ><a href="#">Home</a></li>
                <li ><a href="Bookappointment.jsp">Make Appoinment</a></li>
                <li ><a href="doPublicDrListServlet.do?type=list">Doctor List</a></li>
                <li ><a href="Contact.jsp">Contact Us</a></li>
                <li ><a href="#">About</a>
                </li>
               <a href="www.linkeding.com/in/anower33"> <img class="linkdin-icon" src="img_social_icon/linkdin.png" height="30px" width="30px"> </a>
                <a href="www.twitter.com/MDAnower9"><img class="twitter-icon" src="img_social_icon/Twitter-512.png" height="30px" width="30px"></a>
                <a href="www.facebook.com/anower33"> <img class="facebook-icon" src="img_social_icon/facebook.png" height="20px" width="30px"></a>
            </ul>
        </div>
        <nav id="slide-image">
            <script>
                var i = 0; // Start point
                var images = [];
                var time = 2000;

                // Image List
                images[0] = 'images/slide-2.jpg';
                images[1] = 'images/slide-3.jpg';
                images[2] = 'images/slide-4.jpg';
                images[3] = 'images/slide-5.jpg';

                // Change Image
                function changeImg(){
                    document.slide.src = images[i];

                    if (i < images.length - 1) {
                        i++;
                    } else {
                        i = 0;
                    }

                    setTimeout("changeImg()", time);
                }

                window.onload = changeImg;

            </script>
            <img id="slide-img-border" name="slide" width="700" height="358">

        </nav>
        
        </nav>
        <img id="below" src =" images/insteadofslide.png">
        <div id="footer">
	        <p>
	            <a href="https://www.cqut.edu.cn/">CHONGQING UNIVERSITY OF TECHNOLOGY</a><br>
	            Developer: <a href="www.facebook.com/anower33">MD Anower Hossain( 安昊铭 )</a><br>
	            Student ID : 62017010084<br>
	            Email : anowercse33@gmail.com<br>
	            All credit to Mr: 辉哥 
	         </p><pre>
                                                                                                                            Copyright-2019</pre>
    	</div>
         
  </body>
</html>
