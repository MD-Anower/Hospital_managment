<%@page import="model.Appointment"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Appointmentlistforadmin.jsp' starting page</title>
    
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
		ArrayList <Appointment> appointmentlist = (ArrayList<Appointment>)request.getAttribute("appointmentlist");
	 %>
	 <div class="container">
     	KeyWord:<input type="text" id="keyword" name="keyword" />    
     	<button class="btn btn-info" onclick="search();">search</button> 
   		
   	 </div>  
	<div class="container">
		<table id="infoTable" class="table table-striped table-bordered table-condensed table-hover datatable">
		  <thead>
		    <tr>
		      <th scope="col">First Name</th>
		      <th scope="col">Last Name</th>
		      <th scope="col">Full Address</th>
		      <th scope="col">City Name</th>
		      <th scope="col">Phone Number</th>
		      <th scope="col">Email</th>
		      <th scope="col">Date Of Birth</th>
		      <th scope="col">Appointment Time</th>
		      <th scope="col">Contact Person</th>
		      <th scope="col">Blood</th>
		      <th scope="col">Age</th>
		      <th scope="col">Gender</th>
		      <th scope="col">Message</th>
		      <th scope="col">Operate</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	for(int i=0; i<appointmentlist.size(); i++){
		  		model.Appointment appointment = appointmentlist.get(i);		  	
		   %>
			    <tr>		      
			      <td><%=appointment.getFirstName() %></td>
			      <td><%=appointment.getLastName() %></td>
			      <td><%=appointment.getFullAddress() %></td>
			      <td><%=appointment.getCityName() %></td>
			      <td><%=appointment.getPhnNumber() %></td>
			      <td><%=appointment.getEmail() %></td>
			      <td><%=appointment.getDateOfBirth() %></td>
			      <td><%=appointment.getAppointmentTime() %></td>
			      <td><%=appointment.getContactPerson() %></td>
			      <td><%=appointment.getBloodGroup() %></td>
			      <td><%=appointment.getAge() %></td>
			      <td><%=appointment.getGender() %></td>
			      <td><%=appointment.getSpecialMessage().length() < 20 ? appointment.getSpecialMessage():appointment.getSpecialMessage().substring(0, 20) + "..." %></td>
			     <td> 
					<button class="btn btn-xs btn-info" onclick="showMessage('<%=appointment.getFirstName() %>')">detail</button>
			      	<button class="btn btn-xs btn-danger" onclick="del('<%=appointment.getFirstName() %>');">delete</button>
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
			window.location.href = "doBookappointmentServlet.do?type=search&keyWord=" + keyWord;
		}
		function showMessage(firstName){
		    var keyWord = $('#keyword').val();
			window.location.href = "doBookappointmentServlet.do?type=showMessage" + firstName;
		}
		function del(firstName){
			if(confirm("Are you sure to delete the appointment?")){
				window.location.href = "doBookappointmentServlet.do?type=delete&firstName=" + firstName;
			}
		}
		
		
	</script>

  </body>
</html>
