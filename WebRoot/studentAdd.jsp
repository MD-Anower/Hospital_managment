<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'studentAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.container {width:500px;}
		body{
			
			background-color: gray;
		}
	</style>
  </head>
  
  <body>  
       
  <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Doctor Manage	</a></li>
	    <li class="breadcrumb-item" aria-current="page">Doctor List</li>
	    <li class="breadcrumb-item active" aria-current="page">Add Doctor</li>
	  </ol>
	</nav>
    <div class="container">
    <h2>This is add Doctor page.</h2> <br>
    <form  method="post" action="doStudentServlet.do?type=add">  
    	<div class="form-group">
		    <label for="No">Phone Number</label>
		    <input type="text" class="form-control" id="No" name="No" >		   
	    </div>
	    <div class="form-group">
		    <label for="Name">Dr. Name</label>
		    <input type="text" class="form-control" id="Name"  name="Name">		   
	    </div>
	    <div class="form-group">
		    <label for="Address">Address</label>
		    <input type="text" class="form-control" id="Address"  name="Address">		   
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
	    <div class="form-group">
		    <label for="ClassNo">Degree</label>
		    <input type="text" class="form-control" id="ClassNo"  name="ClassNo">		   
	    </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
  
  </body>
</html>
