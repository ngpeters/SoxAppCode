package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.lang.String;

public class User {
	public int id;
	public String userName;
	public String firstName;
	public String lastName;
	public String password;
	public String email;
	public String timeStamp;
	
	public User(){
		id = 0;
		userName = null;
		firstName = null;
		lastName =null;
		email = null;
		password = null;
		timeStamp =null;
	
	}
	
	//simple GET and POST methods
	
	public static User createUser(String username, String password, String email) {
	    Connection dbconnection = null;
	    Statement stmt = null;
	    
	    try{
    		dbconnection = play.db.DB.getConnection("default");
    	    stmt = dbconnection.createStatement();
    	    
    		String setUserSql = "INSERT INTO user (username, password, emailAddress)"  +
    				"VALUES (" + "\"" + username + "\"" + ", " + "\"" + password + "\"" + ", " + "\"" + email + "\"" + ")";
    		stmt.executeUpdate(setUserSql);
		
    	} catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally{ //close resources
            try{
                if(stmt!=null)
                dbconnection.close();
            }catch(SQLException e){
                e.printStackTrace();
                throw new RuntimeException(e);
            }try{
                if(dbconnection!=null)
                dbconnection.close();
            }catch(SQLException se){
                se.printStackTrace();
                throw new RuntimeException(se);
            }
        }
        return null;
	}

	public static int verifyLogin(String username, String password){
	    Connection dbconnection = null;
	    Statement stmt = null;
	    
	    try{
    	    dbconnection = play.db.DB.getConnection("default");
    	    stmt = dbconnection.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
    	    
    		String verifyLoginSql = "SELECT userID FROM user WHERE username = " + "\"" + username + "\"" + " AND " +
    		"password = " + "\"" + password + "\"" + "";
    		ResultSet resultSet = stmt.executeQuery(verifyLoginSql);
    		
    		int userID = 0;
            while (resultSet.next()){
                userID = resultSet.getInt(1);
                System.out.println(userID);
            }
            
            return userID;
            
	    } catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally{ //close resources
            try{
                if(stmt!=null)
                dbconnection.close();
            }catch(SQLException e){
                e.printStackTrace();
                throw new RuntimeException(e);
            }try{
                if(dbconnection!=null)
                dbconnection.close();
            }catch(SQLException se){
                se.printStackTrace();
                throw new RuntimeException(se);
            }
        }
	}

	public static String getUsernameFromUserID(int userID){
	    Connection dbconnection = null;
	    Statement stmt = null;
	    
	    try{
    	    dbconnection = play.db.DB.getConnection("default");
    	    stmt = dbconnection.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
    	    
    		String getUsernameSql = "SELECT username FROM user WHERE userID = " + "\"" + userID + "\"" + " ";
    		ResultSet resultSet = stmt.executeQuery(getUsernameSql);
    		
    		String username = null;
            while (resultSet.next()){
                username = resultSet.getString("username");
            }
            
            return username;
        
	    } catch(SQLException e){
            e.printStackTrace();
            throw new RuntimeException(e);
        } finally{ //close resources
            try{
                if(stmt!=null)
                dbconnection.close();
            }catch(SQLException e){
                e.printStackTrace();
                throw new RuntimeException(e);
            }try{
                if(dbconnection!=null)
                dbconnection.close();
            }catch(SQLException se){
                se.printStackTrace();
                throw new RuntimeException(se);
            }
        }
	}
}
