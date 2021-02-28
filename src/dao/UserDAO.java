package dao;
import java.util.ArrayList;
import java.util.HashMap;

import model.User;
import utils.DBHelper;

public class UserDAO {
	/**
	 * register	 
	 * @return
	 */
	public Boolean Register(String userName, String password, String realName, int age, String gender){
		boolean isSuccess = false;
		String sql = "insert into Users(UserName, Password, RealName, Age, Gender) " +
		             "values('%s', '%s', '%s', %d, '%s')";
		sql = String.format(sql, userName, password, realName, age, gender);
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	public Boolean Register(User user){
		boolean isSuccess = false;
		String sql = "insert into Users(UserName, Password, RealName, Age, Gender) " +
		             "values('%s', '%s', '%s', %d, '%s')";
		sql = String.format(sql,user.getUserName(), user.getPassword(), user.getRealName(), 
				                user.getAge(), user.getGender());
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	/**
	 * Login	 
	 * @return
	 */
	public Boolean Login(String userName, String password){
		boolean isSuccess = false;
		String sql = "select * from Users where UserName='%s' and Password='%s'";
		sql = String.format(sql, userName, password);
				
		ArrayList<HashMap> list = DBHelper.executeQuery(sql);
		
		
		if (list.size() > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public ArrayList<User> getAllUsers(){
		String sql = "select * from Users";
		
		ArrayList<User> userList = new ArrayList<User>();
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		
		for(int i = 0; i< map.size(); i++){
			User user = new User();
			user.setUserName(map.get(i).get("UserName").toString());
			user.setPassword(map.get(i).get("Password").toString());
			user.setRealName(map.get(i).get("RealName").toString());
			user.setAge(Integer.parseInt(map.get(i).get("Age").toString()));
			user.setGender(map.get(i).get("Gender").toString());
			userList.add(user);
		}
		
		return userList;
	}
	
	public ArrayList<User> getAllUsersByKeyWord(String keyWord){
		String sql = "select * from Users where UserName like '%s' or RealName like '%s'";
		sql = String.format(sql, "%" + keyWord + "%", "%" + keyWord + "%");
		
		ArrayList<User> userList = new ArrayList<User>();
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		
		for(int i = 0; i< map.size(); i++){
			User user = new User();
			user.setUserName(map.get(i).get("UserName").toString());
			user.setPassword(map.get(i).get("Password").toString());
			user.setRealName(map.get(i).get("RealName").toString());
			user.setAge(Integer.parseInt(map.get(i).get("Age").toString()));
			user.setGender(map.get(i).get("Gender").toString());
			userList.add(user);
		}
		
		return userList;
	}
	/**
	 * delete user by userName
	 * @param userName
	 * @return
	 */
	public Boolean delete(String userName){
		boolean isSuccess = false;
		String sql = "delete from Users where UserName='%s'";
		sql = String.format(sql, userName);
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public Boolean add(User user){
		return Register(user);
	}
	
	public Boolean edit(User user){
		boolean isSuccess = false;
		String sql = "update Users set RealName='%s', Age=%d, Gender='%s' where UserName='%s'";
		sql = String.format(sql, user.getRealName(), user.getAge(), user.getGender(), user.getUserName());
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public Boolean isPasswordRight(String userName, String oldPassword){
		boolean isSuccess = false;
		String sql = "select * from Users where UserName='%s' and Password='%s'";
		sql = String.format(sql, userName, oldPassword);
				
        ArrayList<HashMap> list = DBHelper.executeQuery(sql);
				
		if (list.size() > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public Boolean changePsw(String userName, String newPassword){
		boolean isSuccess = false;
		String sql = "update Users set Password='%s' where UserName='%s'";
		sql = String.format(sql, newPassword, userName);
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
}
