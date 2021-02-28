package dao;
import java.util.ArrayList;
import java.util.HashMap;

import utils.DBHelper;
import model.Student;
import model.User;
public class PublicDrListDAO {

	public ArrayList<Student> getAllStudents(){
		String sql = "select * from Doctor";
		
		
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		for(int i = 0; i< map.size(); i++){
			Student student = new Student();
			student.setNo(map.get(i).get("No").toString());
			student.setName(map.get(i).get("Name").toString());
			student.setAddress(map.get(i).get("Address").toString());
			student.setAge(Integer.parseInt(map.get(i).get("Age").toString()));
			student.setGender(map.get(i).get("Gender").toString());
			student.setClassNo(map.get(i).get("ClassNo").toString());
			studentList.add(student);
		}
		
		return studentList;
	}
	public Student getStudentByNo(String no){
		String sql = "select * from Doctor where No = '%s'";
		sql = String.format(sql, no);
		
		ArrayList<HashMap> map = DBHelper.executeQuery(sql);
		ArrayList<Student> studentList = new ArrayList<Student>();
		
		for(int i = 0; i< map.size(); i++){
			Student student = new Student();
			student.setNo(map.get(i).get("No").toString());
			student.setName(map.get(i).get("Name").toString());
			student.setAddress(map.get(i).get("Address").toString());
			student.setAge(Integer.parseInt(map.get(i).get("Age").toString()));
			student.setGender(map.get(i).get("Gender").toString());
			student.setClassNo(map.get(i).get("ClassNo").toString());
			studentList.add(student);
		}
		
		return studentList.get(0);
	}
	
	public ArrayList<User> getAllUsersByKeyWord(String keyWord){
		String sql = "select * from Doctor where UserName like '%s' or RealName like '%s'";
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
	public Boolean delete(String no){
		boolean isSuccess = false;
		String sql = "delete from Doctor where No='%s'";
		sql = String.format(sql, no);
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public Boolean add(Student student){
		boolean isSuccess = false;
		String sql = "insert into Doctor(No, Name, Address, Age, Gender, ClassNo) " +
		             "values('%s', '%s', '%s', %d, '%s', '%s')";
		sql = String.format(sql,student.getNo(), student.getName(), student.getAddress(), 
				student.getAge(), student.getGender(), student.getClassNo());
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
	public Boolean edit(Student student){
		boolean isSuccess = false;
		String sql = "update Doctor set Name='%s',Address='%s', Age=%d, Gender='%s',ClassNo='%s' where No='%s'";
		sql = String.format(sql, student.getName(),student.getAddress(), student.getAge(), student.getGender(), student.getClassNo(),student.getNo());
				
		int n = DBHelper.executeUpdate(sql);
		
		if (n > 0)
			isSuccess = true;
		else
			isSuccess = false;
		
		return isSuccess;
	}
	
}
