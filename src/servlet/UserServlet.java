package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import dao.UserDAO;

public class UserServlet extends HttpServlet {

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
		
		if (action.equals("register")){
			//register
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String realName = request.getParameter("realName");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
										
			UserDAO userDao = new UserDAO();
			//Verson1			
		    //Boolean isSuccess = userDao.Register(userName, password, realName, age, gender);
			
		    //Verson2
		    User user = new User();
		    user.setUserName(userName);
		    user.setPassword(password);
		    user.setRealName(realName);
		    user.setAge(age);
		    user.setGender(gender);
		    Boolean isSuccess = userDao.Register(user);
					    
		    if (isSuccess == true)
				response.sendRedirect("login.jsp");
			else
				out.println("error");
		}else if (action.equals("login")){
			//login
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			
			UserDAO userDao = new UserDAO();
			Boolean isSuccess = userDao.Login(userName, password);
			
			if (isSuccess == true){
				HttpSession session = request.getSession();
				session.setAttribute("userName", userName);
				
				response.sendRedirect("index.jsp");
			}
			else
				out.println("error");
		}else if (action.equals("changePsw")){
			HttpSession session = request.getSession();
			//String userName = (String)session.getAttribute("userName");
			
			request.getRequestDispatcher("changePsw.jsp").forward(request, response);
			
		}else if (action.equals("changePswPost")){
			String userName = request.getParameter("userName");
			String oldPassword = request.getParameter("oldPassword");
			String newPassword = request.getParameter("newPassword");
			String newPasswordRepeate = request.getParameter("newPasswordRepeate");
			
			UserDAO userDao = new UserDAO();
			Boolean isSuccess = userDao.isPasswordRight(userName, oldPassword);
			if(isSuccess == true){
				if(newPassword.equals(newPasswordRepeate)){
					isSuccess = userDao.changePsw(userName, newPassword);
					if (isSuccess == true){
						response.sendRedirect("doUserServlet.do?type=list");
					}else{
						out.println("error.");
					}					
				}
				else{
					out.println("newPassword and newPasswordRepeate is not same.");
				}
			}
			else{
				out.println("the old password is wrong.");
			}			
		}else if(action.equals("signOut")){
			HttpSession session = request.getSession();
			session.removeAttribute("userName");
			response.sendRedirect("login.jsp");
		}else if (action.equals("list")){
			
			UserDAO userDao = new UserDAO();
			ArrayList<User> userList =  userDao.getAllUsers();
			
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("userList.jsp").forward(request, response);
		}else if (action.equals("search")){
			String keyWord = request.getParameter("keyWord");
			UserDAO userDao = new UserDAO();
			ArrayList<User> userList =  userDao.getAllUsersByKeyWord(keyWord);
			
			request.setAttribute("userList", userList);
			request.getRequestDispatcher("userList.jsp").forward(request, response);
			
		}else if (action.equals("delete")){
			String userName = request.getParameter("userName");
			UserDAO userDao = new UserDAO();
			boolean isSuccess =  userDao.delete(userName);
			
			if (isSuccess == true)
				response.sendRedirect("doUserServlet.do?type=list");
			else
				out.println("error");
		}else if(action.equals("add")){
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String realName = request.getParameter("realName");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
						
			User user = new User();
		    user.setUserName(userName);
		    user.setPassword(password);
		    user.setRealName(realName);
		    user.setAge(age);
		    user.setGender(gender);
		    
			UserDAO userDao = new UserDAO();
		    Boolean isSuccess = userDao.add(user);
		    if (isSuccess == true)
				response.sendRedirect("doUserServlet.do?type=list");
			else
				out.println("error");			
		}else if(action.equals("edit")){
			String userName = request.getParameter("userName");
			String realName = request.getParameter("realName");
			int age = Integer.parseInt(request.getParameter("age"));
			String gender = request.getParameter("gender");
						
			User user = new User();
		    user.setUserName(userName);		   
		    user.setRealName(realName);
		    user.setAge(age);
		    user.setGender(gender);
		    
			UserDAO userDao = new UserDAO();
		    Boolean isSuccess = userDao.edit(user);
		    if (isSuccess == true)
				response.sendRedirect("doUserServlet.do?type=list");
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

		doGet(request, response);
	}

}
