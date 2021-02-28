<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
model.Student student = (model.Student)request.getAttribute("student");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Doctor Edit .jsp' starting page</title>
    
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
	</style>
  </head>
  
  <body>
  	<%
  		
  	 %>
    <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Doctor Manage	</a></li>
	    <li class="breadcrumb-item" aria-current="page">Doctor List</li>
	    <li class="breadcrumb-item active" aria-current="page">Edit Doctor</li>
	  </ol>
	</nav>
    <div class="container">
    <h2>This is edit Doctor page.</h2> <br>
    <form  method="post" action="doStudentServlet.do?type=editPost">  
    	<div class="form-group">
		    <label for="No">No</label>
		    <input type="text" class="form-control" id="No" name="No" value="<%=student.getNo() %>" readonly="readonly" >		   
	    </div>
	    <div class="form-group">
		    <label for="Name">Name</label>
		    <input type="text" class="form-control" id="Name"  name="Name" value="<%=student.getName() %>" >		   
	    </div>
	    <div class="form-group">
		    <label for="age">age</label>
		    <input type="text" class="form-control" id="age"  name="age" value="<%=student.getAge() %>" >		   
	    </div>
	    <div class="form-group">
	    	<label for="gender">gender</label>
			  <select class="form-control" id="gender" name="gender" %>" >
			  <%
			  	if (student.getGender().equals("male"))
			  	{
			   %>
				    <option selected value="male">male</option>
				    <option value="female">female</option>
			    <%
			    }else
			    {
			     %>
			      <option  value="male">male</option>
				  <option selected value="female">female</option>
			     <%
			     }
			      %>
			  </select>
	    </div>
	     <div class="form-group">
		    <label for="Address">Address</label>
		    <input type="text" class="form-control" id="Address"  name="Address" value="<%=student.getAddress() %>" >		   
	    </div>
	    <div class="form-group">
		    <label for="ClassNo">ClassNo</label>
		    <input type="text" class="form-control" id="ClassNo"  name="ClassNo"  value="<%=student.getClassNo() %>" >		   
	    </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    </div>
  <script>
  	<%-- $(function(){
  		var gender = <%=student.getGender()%>;
  		console.log(gender);
  		
  		if (gender == "male"){
  			$('#gender').val("male");
		}else{
			$('#gender').val("female");
  		}
  	}); --%>
  </script>
  </body>
</html>
