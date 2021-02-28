package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.Appointment;
import model.Contact;
import utils.DBHelper;

public class AppointmentDAO {
	public Boolean Appointment(String FirstName, String LastName, String FullAddress, String CityName, String PhnNumber, String Email, String DateOfBirth, String AppointmentTime, String ContactPerson, String BloodGroup, String Age, String Gender,String SpecialMessage){
		boolean isSuccess =false;
		
		String sql = "INSERT INTO Appointment(FirstName,LastName,FullAddress,CityName,PhnNumber, Email, DateOfBirth , AppointmentTime, ContactPerson, BloodGroup, Age, Gender,SpecialMessage)" +
		
				/*"VALUES ('"+FullName+"''"+Email+" ',' "+Phone+" ',' "+Message+"',)";*/
				"VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')";
		sql =  String.format(sql,FirstName,LastName,FullAddress,CityName,PhnNumber, Email, DateOfBirth , AppointmentTime, ContactPerson, BloodGroup, Age, Gender,SpecialMessage);
		
		/*ArrayList<HashMap> list =  DBHelper.executeQuery(sql);*/
		int n =  DBHelper.executeUpdate(sql);
		
		if(n>0){
			isSuccess =true;
		}
		else isSuccess = false;
		
		return isSuccess;
	}
	
	public ArrayList<Appointment> getAllInformationForAppointment(){
		String sql = "select * from Appointment";
		
		ArrayList<Appointment> appointmentlist = new ArrayList<Appointment>();
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		
		for(int i = 0; i< map.size(); i++){
			Appointment user = new Appointment();
			user.setFirstName(map.get(i).get("FirstName").toString());	
			user.setLastName(map.get(i).get("LastName").toString());
			user.setFullAddress(map.get(i).get("FullAddress").toString());
			user.setCityName(map.get(i).get("CityName").toString());
			user.setPhnNumber(map.get(i).get("PhnNumber").toString());
			
			user.setEmail(map.get(i).get("Email").toString());	
			user.setDateOfBirth(map.get(i).get("DateOfBirth").toString());
			user.setAppointmentTime(map.get(i).get("AppointmentTime").toString());
			user.setContactPerson(map.get(i).get("ContactPerson").toString());
			user.setBloodGroup(map.get(i).get("BloodGroup").toString());
			
			user.setAge(map.get(i).get("Age").toString());	
			user.setGender(map.get(i).get("Gender").toString());
			user.setSpecialMessage(map.get(i).get("SpecialMessage").toString());
			
			appointmentlist.add(user);
		}
		
		return appointmentlist;
	}
	public Boolean delete(String firstName){
		boolean isSuccess = false;
		String sql = "delete from Appointment where firstName='%s'";
		sql = String.format(sql, firstName);
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
}
