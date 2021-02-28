<%@page import="model.PublicDrList"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Publicdoctorlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">
	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/dataTables.bootstrap.js"></script>
	<script src="js/jquery.dataTables.min.js"></script>
	<style>
		.container {
			width:100%;
			margin:10px 0px;            
		}
	</style>
	<script>
		$(function(){
    		$("#infoTable").dataTable({
                        
                        "searching":true,
                        "autoWidth":true,
                        "scrollY": 330, 
                        "paging":true,  
                        //"pagingType":"full_numbers",
                        "processing" : true, 
                        "ordering":true,
                        "stateSave" : true, 
                        "deferRender":true,
			})
    	})
	</script>
	
  </head>
  
  <body>
    <h2> All of the Doctor list </h2><br>
   
      <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item active" aria-current="page">Doctor List</li>
	  </ol>
	</nav>
	<%-- <%
		ArrayList<model.Student> doctorlist = (ArrayList<model.Student>)request.getAttribute("studentList");
	 %> --%>
	 <% 
	 	ArrayList<PublicDrList> doctorlist = (ArrayList<PublicDrList>)request.getAttribute("studentList");
	 %>
	 
	 <div class="container">
     	KeyWord:<input type="text" id="keyword" name="keyword" />    
     	<button class="btn btn-info" onclick="search();">Search Doctor</button> 
   		
   	 </div>  
	<div class="container">
		<table id="infoTable" class="table table-striped table-bordered table-condensed table-hover datatable">
		  <thead>
		    <tr>
		      <th scope="col">Phone No</th>
		      <th scope="col">Name</th>
		      <th scope="col">Address</th>
		      <th scope="col">Age</th>
		      <th scope="col">Gender</th>
		      <th scope="col">Department</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	for(int i=0; i<doctorlist.size(); i++){
		  		PublicDrList student = doctorlist.get(i);		  	
		   %>
			    <tr>		      
			      <td><%=student.getNo() %></td>
			      <td><%=student.getName() %></td>
			      <td><%=student.getAddress() %></td>
			      <td><%=student.getAge() %></td>
			      <td><%=student.getGender() %></td>			    
			      <td><%=student.getClassNo() %></td>
			    </tr>	
		    <%
		     }
		    %>    
		  </tbody>
		</table>
	</div>
  </body>
   <script type="text/javascript">
		function search(){
		    var keyWord = $('#keyword').val();
			window.location.href = "doPublicDrListServlet.do?type=search&keyWord=" + keyWord;
		}
		
	</script>
</html>
