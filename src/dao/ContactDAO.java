package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.Contact;
import utils.DBHelper;

public class ContactDAO {
	public Boolean Contact(String FullName, String Email, String Phone, String Message){
		boolean isSuccess =false;
		
		String sql = "INSERT INTO Contact(FullName,Email,Phone,Message)" +
		
				/*"VALUES ('"+FullName+"''"+Email+" ',' "+Phone+" ',' "+Message+"',)";*/
				"VALUES ('%s','%s','%s','%s')";
		sql =  String.format(sql, FullName,FullName, Phone, Message);
		
		/*ArrayList<HashMap> list =  DBHelper.executeQuery(sql);*/
		int n =  DBHelper.executeUpdate(sql);
		
		if(n>0){
			isSuccess =true;
		}
		else isSuccess = false;
		
		return isSuccess;
	}
	public ArrayList<Contact> getAllContact(){
		String sql = "select * from Contact";
		
		ArrayList<Contact> contactlist = new ArrayList<Contact>();
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		
		for(int i = 0; i< map.size(); i++){
			Contact user = new Contact();
			user.setFullName(map.get(i).get("FullName").toString());
			user.setEmail(map.get(i).get("Email").toString());
			user.setPhone(map.get(i).get("Phone").toString());
			user.setMessage(map.get(i).get("Message").toString());
			contactlist.add(user);
		}
		
		return contactlist;
	}
}
