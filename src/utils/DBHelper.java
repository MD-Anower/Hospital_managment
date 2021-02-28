package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.User;

public class DBHelper {
	//database driver
	private static final String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; 
	//URL address of the connection database
	private static final String url="jdbc:sqlserver://localhost:1433;databaseName=HospitalDCH;"; 
	private static final String username="sa";//username
	private static final String password="anower33";//password
	//windows authentication
	//private static final String url="jdbc:sqlserver://http://localhost:8080;databaseName=LibraryDB;integratedSecurity=true;"; 
		
	private static Connection conn=null;
	
	//Static code blocks are responsible for loading driver
	static 
	{
		try
		{
			
			Class.forName(driver);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	//Return database connection object
	public static Connection getConnection() throws Exception
	{
		if(conn==null)
		{
			conn = DriverManager.getConnection(url, username, password);
			//conn = DriverManager.getConnection(url);
			return conn;
		}
		return conn;
	}
	
	/**
	 * Return ArrayList by sql
	 * @param sql
	 * @return
	 */
	public static ArrayList<HashMap> executeQuery(String sql)
	{
		ArrayList<HashMap> rsList = new ArrayList();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		try{
			conn = getConnection();			
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			HashMap rsTree = null;
			ResultSetMetaData rsmd = rs.getMetaData();//get the ResultSet object's columns
			int numberOfColumns = rsmd.getColumnCount();
			while(rs.next())
			{
				rsTree = new HashMap(numberOfColumns);//注意要new
				for(int r=1;r<=numberOfColumns;r++)
				{
					rsTree.put(rsmd.getColumnName(r), rs.getObject(r)); 
				}
				rsList.add(rsTree);
			}
		   
		   return rsList;
		}catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// release ResultSet
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// release PreparedStatement
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	/**
	 * executeUpdate(insert, update, delete) by sql
	 * @param sql
	 * @return
	 */
	public static int executeUpdate(String sql)
	{		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int rowCount;
		
		try{
			conn = getConnection();			
			stmt = conn.prepareStatement(sql);
			rowCount = stmt.executeUpdate();
								   
		   return rowCount;
		}catch (Exception ex) {
			ex.printStackTrace();
			return -1;
		} finally {
			// release ResultSet
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// release PreparedStatement
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * executeBatch(insert, update, delete) by Multiple SQLs
	 * @param sqlList
	 * @return
	 */
	public static int[] executeBatch(ArrayList<String> sqlList)
	{		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int[] rowCount;
		
		try{
			conn = getConnection();	
			stmt = conn.createStatement();
			
			for(int i=0; i< sqlList.size(); i++){
				stmt.addBatch(sqlList.get(i));
			}			
			rowCount = stmt.executeBatch();
								   
		    return rowCount;
		}catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// release ResultSet
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// release PreparedStatement
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	
	/**
	 * Return pager ArrayList by sql
	 * @param sql
	 * @param pageCount
	 * @param page
	 * @return
	 */
    public static ArrayList<HashMap> executeQueryPager(String sql, int pageCount, int page)
	{
		ArrayList<HashMap> rsList = new ArrayList();		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
				
		try{
			conn = getConnection();
			//sql = "select top pageCount * from [StudentDB].[dbo].[Student] where Id "+
			//	  "not in (select top ((page-1)*pageCount) Id from [StudentDB].[dbo].[Student] order by Id) "+
			//	  "order by Id";
			//sql = "select * from (select ROW_NUMBER() OVER(Order by [No]) AS RowNumber,* from [StudentDB].[dbo].[Student]) as b "+
            //      "where b.RowNumber BETWEEN (page-1)*pageCount+1 and page*pageCount order by [No]";
			sql = "select * from (select ROW_NUMBER() OVER(Order by [No]) AS RowNumber,* from [StudentDB].[dbo].[Student]) as b "+
	                  "where b.RowNumber BETWEEN (%d-1)*%d+1 and %d*%d order by [No]";
			sql = String.format(sql, page, pageCount, page, pageCount);
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			HashMap rsTree = null;
			ResultSetMetaData rsmd = rs.getMetaData();//get the ResultSet object's columns
			int numberOfColumns = rsmd.getColumnCount();
			while(rs.next())
			{
				rsTree = new HashMap(numberOfColumns);//注意要new
				for(int r=1;r<=numberOfColumns;r++)
				{
					rsTree.put(rsmd.getColumnName(r), rs.getObject(r)); 
				}
				rsList.add(rsTree);
			}
		   
		   return rsList;
		}catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// release ResultSet
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// release PreparedStatement
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}
	
	
	/**
	 * test
	 * @param args
	 */
	public static void main(String[] args) {
		
		try
		{
		   Connection conn = DBHelper.getConnection();
		   if(conn!=null)
		   {
			   System.out.println("Database connnect success.");
		   }
		   else
		   {
			   System.out.println("Database connnect fail.");
		   }
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
}
