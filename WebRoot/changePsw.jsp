<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changePsw.jsp' starting page</title>
    
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
		.container {
			width:400px;
			margin-top:50px;
			background-color: maroon;
			border-bottom-left-radius: 2.5em;
			border-top-right-radius: 2.5em;
		}
		.container h4{
			padding-left:45px;
			background-color: thistle;
			margin: -1px,-1px,-1px -1px;
			color: brown;
			border-radius: 2em;
		}
		body {
 			background-color: gray;
 			background-size: 100%;
		}
		label{
			color: white;
		}
		
	</style>
  </head>
  
  <body>
    <%
  		String userName = (String)session.getAttribute("userName");
  	 %>
    <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Admin Manage	</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Change Password</li>
	  </ol>
	</nav>
    <div class="container">
    <h4>This is change password page.</h4> <br>
    <form  method="post" action="doUserServlet.do?type=changePswPost">  
    	<div class="form-group">
		    <label for="userName">UserName</label>
		    <input type="text" class="form-control" id="userName" name="userName" value="<%=userName %>" readonly="readonly" >		   
	    </div>
	    <div class="form-group">
		    <label for="oldPassword">Old Password</label>
		    <input type="password" class="form-control" id="oldPassword"  name="oldPassword">		   
	    </div>
	    <div class="form-group">
		    <label for="newPassword">New Password</label>
		    <input type="password" class="form-control" id="newPassword"  name="newPassword">		   
	    </div>
	    <div class="form-group">
		    <label for="newPasswordRepeate">Confirm Password</label>
		    <input type="password" class="form-control" id="newPasswordRepeate"  name="newPasswordRepeate">		   
	    </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
  </body>
</html>
