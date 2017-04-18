package tool;
import java.sql.*;
import java.util.ArrayList;

import bean.User;
public class JdbcConn {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost/EMP?characterEncoding=utf-8";
	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "";
	   Connection conn=null;
	   Statement stmt=null;
	   public JdbcConn(){
		   try{
		   Class.forName(JDBC_DRIVER);
		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);
		      //STEP 4: Execute a query
		      System.out.println("Creating statement...");
		      stmt = conn.createStatement();
		   }catch(Exception e){
			   e.printStackTrace();
		   }
	   }
	   
	   public boolean add(String name,String password,String niname){
		   String sql="insert into users(name,password,niname) values('"+name+"','"+password+"','"+niname+"')";
		   try {
			int i=stmt.executeUpdate(sql);
			System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   return true;
	   }
	   public boolean delete(){
		   return true;
	   }
	   public String find(){
		   return "";
	   }
	   
	   public ArrayList<User> list(){
		    ArrayList<User> users =new ArrayList<User>();  
		   String sql = "SELECT * FROM users";
		   try{
		      ResultSet rs = stmt.executeQuery(sql);
		      //STEP 5: Extract data from result set
		      while(rs.next()){
		    	  User u= new User(rs.getInt("id"),rs.getString("name"),rs.getString("password"),rs.getString("niname"));
		    	  users.add(u);
		      }
		   }catch(Exception e){
			   e.printStackTrace();
		   }
		   return users;
	   }
//	    public static void free()  
//	    {  
//	        
//	            try  
//	            {  
//	                if(stmt!=null)  
//	                    stmt.close();  
//	            } catch (SQLException e) {  
//	                // TODO Auto-generated catch block  
//	                e.printStackTrace();  
//	            }  
//	            finally  
//	            {  
//	                if(conn!=null)  
//	                    try {  
//	                        conn.close();  
//	                    } catch (SQLException e) {  
//	                        // TODO Auto-generated catch block  
//	                        e.printStackTrace();  
//	                    }  
//	            }  
//	        }  
	     
}
