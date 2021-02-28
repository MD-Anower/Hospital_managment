package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Appointment;
import dao.AppointmentDAO;
import dao.ContactDAO;
import dao.UserDAO;

public class AppointmentServlet extends HttpServlet {

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
		if (type.equals("Bookappointment")){
			
			String FirstName = request.getParameter("firstname");
			String LastName= request.getParameter("lastname");
			String FullAddress = request.getParameter("fulladdress");
			String CityName = request.getParameter("cityname");
			String PhnNumber = request.getParameter("phnnumber");
			String Email= request.getParameter("email");
			String DateOfBirth = request.getParameter("dateofbirth");
			String AppointmentTime = request.getParameter("appointmenttime");
			String ContactPerson= request.getParameter("contactperson");
			String BloodGroup = request.getParameter("bloodgroup");
			String Age = request.getParameter("age");
			String Gender = request.getParameter("gender");
			String SpecialMessage = request.getParameter("specialmessage");
			
			AppointmentDAO appointmentDao = new AppointmentDAO();
			Boolean isSuccess = appointmentDao.Appointment(FirstName,LastName,FullAddress,CityName,PhnNumber, Email, DateOfBirth , AppointmentTime, ContactPerson, BloodGroup, Age, Gender,SpecialMessage);
				if(isSuccess == true){
					response.sendRedirect("login.jsp");
				}
				else
					out.println("Error");
		}else if (type.equals("Bookappointmentlist")){
			
			AppointmentDAO appointmentDAO = new AppointmentDAO();
			ArrayList<Appointment> appointmentlist =  appointmentDAO.getAllInformationForAppointment();
			
			request.setAttribute("appointmentlist", appointmentlist);
			request.getRequestDispatcher("Appointmentlistforadmin.jsp").forward(request, response);
		}
		else if (type.equals("delete")){
			String firstName = request.getParameter("firstName");
			AppointmentDAO appointmentDAO = new AppointmentDAO();
			boolean isSuccess =  appointmentDAO.delete(firstName);
			
			if (isSuccess == true)
				response.sendRedirect("doBookappointmentServlet.do?type=Bookappointmentlist");
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
