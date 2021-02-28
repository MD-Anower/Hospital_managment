<%@page import="model.Contact"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Contactlistforadmin.jsp' starting page</title>
    
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
       <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="#">Contact Manage	</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Contact List</li>
	  </ol>
	</nav>
	<%
		ArrayList<Contact> contactlist = (ArrayList<Contact>)request.getAttribute("contactList");
	 %>
	 <div class="container">
     	KeyWord:<input type="text" id="keyword" name="keyword" />    
     	<button class="btn btn-info" onclick="search();">search</button> 
   		
   	 </div>  
	<div class="container">
		<table id="infoTable" class="table table-striped table-bordered table-condensed table-hover datatable">
		  <thead>
		    <tr>
		      <th scope="col">Full Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Phone Number</th>
		      <th scope="col">Mesage</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	for(int i=0; i<contactlist.size(); i++){
		  		model.Contact contact = contactlist.get(i);		  	
		   %>
			    <tr>		      
			      <td><%=contact.getFullName() %></td>
			      <td><%=contact.getEmail() %></td>
			      <td><%=contact.getPhone() %></td>
			      <td><%=contact.getMessage() %></td>
			     
			    </tr>	
		    <%
		     }
		    %>    
		  </tbody>
		</table>
	</div>
	<script type="text/javascript">
		function search(){
		    var keyWord = $('#keyword').val();
			window.location.href = "doContactServlet.do?type=search&keyWord=" + keyWord;
		}
		
		
	</script>
  </body>
</html>
