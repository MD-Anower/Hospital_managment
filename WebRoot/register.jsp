<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {
			width:400px;
			margin-top:50px;
			background-color: maroon;
			border-bottom-left-radius: 2.5em;
			border-top-right-radius: 2.5em;
		}
		.container h2{
			padding-left:45px;
			background-color: thistle;
			margin: -1px,-1px,-1px -1px;
			color: brown;
			border-radius: 2em;
		}
		body {
 			background-image: url("images/back.png");
 			background-size: 100%;
		}
		label{
			color: white;
		}
		
	</style>
  </head>
  
  <body>
  
  <div class="container">
    <h2>welcome to register </h2> <br>
    <form  method="post" action="doUserServlet.do?type=register">  
    	<div class="form-group">
		    <label for="userName">userName</label>
		    <input type="text" class="form-control" id="userName" name="userName" >		   
	    </div>
	    <div class="form-group">
		    <label for="password">password</label>
		    <input type="password" class="form-control" id="password"  name="password">		   
	    </div>
	    <div class="form-group">
		    <label for="realName">realName</label>
		    <input type="text" class="form-control" id="realName"  name="realName">		   
	    </div>
	    <div class="form-group">
		    <label for="age">age</label>
		    <input type="text" class="form-control" id="age"  name="age">		   
	    </div>
	    <div class="form-group">
	    	<label for="gender">gender</label>
			  <select class="form-control" id="gender" name="gender">
			    <option selected value="male">male</option>
			    <option value="female">female</option>
			  </select>
	    </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
  </body>
</html>
