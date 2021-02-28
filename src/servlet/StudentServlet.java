package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Student;
import model.User;
import dao.StudentDAO;
import dao.UserDAO;

@SuppressWarnings("serial")
public class StudentServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String action = request.getParameter("type");
		if (action.equals("list")){
			StudentDAO studentDao = new StudentDAO();
			ArrayList<Student> studentList = studentDao.getAllStudents();
			request.setAttribute("studentList", studentList);
			 
			request.getRequestDispatcher("studentList.jsp").forward(request, response);
		}else if (action.equals("add")){
			String No = request.getParameter("No");
			String Name = request.getParameter("Name");
			String Address = request.getParameter("Address");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String ClassNo = request.getParameter("ClassNo");
						
			Student student = new Student();
			student.setNo(No);
			student.setName(Name);
			student.setAddress(Address);
		    student.setAge(age);
		    student.setGender(gender);
		    student.setClassNo(ClassNo);
		    
		    StudentDAO studentDao = new StudentDAO();
		    Boolean isSuccess = studentDao.add(student);
		    if (isSuccess == true)
				response.sendRedirect("doStudentServlet.do?type=list");
			else
				out.println("error");			
		}
		else if(action.equals("editPost")){
			String No = request.getParameter("No");
			String Name = request.getParameter("Name");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
			String ClassNo = request.getParameter("ClassNo");
			String Address = request.getParameter("Address");
						
			Student student = new Student();
			student.setNo(No);		   
			student.setName(Name);
			student.setAge(age);
			student.setGender(gender);
			student.setClassNo(ClassNo);
			student.setAddress(Address);
		    
			StudentDAO studentDAO = new StudentDAO();
		    Boolean isSuccess = studentDAO.edit(student);
		    if (isSuccess == true)
				response.sendRedirect("doStudentServlet.do?type=list");
			else
				out.println("error");			
		}else if(action.equals("edit")){
			String No = request.getParameter("no");
			StudentDAO studentDAO = new StudentDAO();
			Student student = studentDAO.getStudentByNo(No);
		    		
			request.setAttribute("student", student);
			 
			request.getRequestDispatcher("studentEdit.jsp").forward(request, response);
		}else if (action.equals("delete")){
			String userName = request.getParameter("userName");
			StudentDAO studentDao = new StudentDAO();
			boolean isSuccess =  studentDao.delete(userName);
			
			if (isSuccess == true)
				response.sendRedirect("doStudentServlet.do?type=list");
			else
				out.println("error");
		}
		
		
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request,response);
		
	}
	public void getAllStudent1(){
	    Connection conn = null;
	    Statement stmt = null;
	    ResultSet rs = null;
	    try {
	        String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	        Class.forName(driver);  // Load JDBC drive
	        String url="jdbc:sqlserver://DESKTOP-77UPH39:1433;databaseName=LibraryDB;"; 
	        String username="sa";
	        String password="anower33";
	 
	        conn = DriverManager.getConnection(url, username, password);
	        stmt = conn.createStatement();
	        String sql = "select no,name,age,gender from student";
	        rs = stmt.executeQuery(sql); //execute sql to get result
	        String no,name,gender;
	        int age;

	          while(rs.next()){
	                   no = rs.getString(1);
	                   name = rs.getString(2);
	                   age = rs.getInt(3);
	                   gender = rs.getString(4);
	                   System.out.println(no + ", " +name + ", " + age+", " +gender);
	          }
	 }
	    catch(ClassNotFoundException e){
	        System.out.println("error:" + e);
	 }
	 catch(SQLException e){
	          System.out.println("error:" + e);
	 }
	 finally{
	          try{
	                   rs.close();
	                   stmt.close();
	                   conn.close();
	            }
	            catch(SQLException e){}
	    }
	 }

}






