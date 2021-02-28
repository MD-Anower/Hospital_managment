package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import dao.ContactDAO;
import dao.UserDAO;

public class Contact extends HttpServlet {

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

		String type = request.getParameter("type");
		if (type.equals("Submit")){
			String FullName = request.getParameter("name");
			String  Email= request.getParameter("email");
			String Phone = request.getParameter("phone");
			String Message = request.getParameter("message");
			
			ContactDAO contactdao = new ContactDAO();
			Boolean isSuccess = contactdao.Contact(FullName, Email, Phone, Message);
				if(isSuccess == true){
					response.sendRedirect("login.jsp");
				}
				else
					out.println("Error");
		}else if (type.equals("list")){
			
			ContactDAO contactDAO = new ContactDAO();
			ArrayList<model.Contact> contactList =  contactDAO.getAllContact();
			
			request.setAttribute("contactList", contactList);
			request.getRequestDispatcher("Contactlistforadmin.jsp").forward(request, response);
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
