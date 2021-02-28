<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userList.jsp' starting page</title>
    
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
	    <li class="breadcrumb-item"><a href="#">Admin Manage	</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Admin List</li>
	  </ol>
	</nav>
	<%
		ArrayList<model.User> userList = (ArrayList<model.User>)request.getAttribute("userList");
	 %>
	 <div class="container">
     	KeyWord:<input type="text" id="keyword" name="keyword" />    
     	<button class="btn btn-info" onclick="search();">search</button> 
   		<button class="btn btn-success" id="add_hw" onclick="add();">add Admin</button>
   	 </div>  
	<div class="container">
		<table id="infoTable" class="table table-striped table-bordered table-condensed table-hover datatable">
		  <thead>
		    <tr>
		      <th scope="col">UserName</th>
		      <th scope="col">Password</th>
		      <th scope="col">RealName</th>
		      <th scope="col">Age</th>
		      <th scope="col">Gender</th>
		      <th scope="col">Operate</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  	for(int i=0; i<userList.size(); i++){
		  		model.User user = userList.get(i);		  	
		   %>
			    <tr>		      
			      <td><%=user.getUserName() %></td>
			      <td><%=user.getPassword() %></td>
			      <td><%=user.getRealName() %></td>
			      <td><%=user.getAge() %></td>
			      <td><%=user.getGender() %></td>
			      <td> 
			      	<button class="btn btn-xs btn-info" onclick="edit('<%=user.getUserName() %>')">edit</button>
			      	<button class="btn btn-xs btn-danger" onclick="del('<%=user.getUserName() %>');">delete</button>
			      </td>
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
			window.location.href = "doUserServlet.do?type=search&keyWord=" + keyWord;
		}
		
		function del(userName){
			if(confirm("Are you sure to delete the user?")){
				window.location.href = "doUserServlet.do?type=delete&userName=" + userName;
			}
		}
		
		function add(){
			window.location.href = "userAdd.jsp";
		}
		
		function edit(userName){
			window.location.href = "userEdit.jsp?userName=" + userName;
		}
	</script>
  </body>
</html>
