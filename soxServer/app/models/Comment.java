package models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.lang.String;
import java.util.ArrayList;
import java.util.List;

public class Comment {
	public int commentID;
	public String comment;
	public int rating;
	public int userID;
	public String username;
	public int resortID;
	public int runID;
	public Timestamp commentTime;


	//constructors
	public Comment(){
		commentID = 0;
		comment = null;
		rating = 0;
		userID = 0;
		username = null;
		resortID = 0;
		runID = 0;
		commentTime = null;
	}
	
	//simple get/post methods

    public static Comment createComment(String comment, int rating, int userID, int resortID, int runID) {
	    Connection dbconnection = null;
	    Statement stmt = null;
	    
	    try{
    		dbconnection = play.db.DB.getConnection("default");
    	    stmt = dbconnection.createStatement();
    	    
    		String createCommentSql = "INSERT INTO comments (comment, rating, userID, resortID, runID)"  +
    				"VALUES (" + "\"" + comment + "\"" + ", " + "\"" + rating + "\"" + ", " + "\"" + userID + "\"" + "," +
    				"" + "\"" + resortID + "\"" + ", " + "\"" + runID + "\"" + ")";
    		stmt.executeUpdate(createCommentSql);
		
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
	
	public List<Comment> getCommentFromResortID(int resortID){
	    Connection dbconnection = null;
	    Statement stmt = null;
	    
	    try{
    	    dbconnection = play.db.DB.getConnection("default");
    	    stmt = dbconnection.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_READ_ONLY);
    	   
    		String getCommentSql = "SELECT commentID, comment, rating, Comments.userID, username, resortID, runID, commentTime FROM Comments JOIN User WHERE Comments.userID = User.userID AND resortID = " + "\"" + resortID + "\"" + " ORDER BY commentTime DESC LIMIT 10 ";

    		ResultSet resultSet = stmt.executeQuery(getCommentSql);
    		
    		List<Comment> list = new ArrayList<>();

            while (resultSet.next()){
                Comment c = new Comment();
                c.commentID = resultSet.getInt(1);
                c.comment = resultSet.getString("comment");
                c.rating = resultSet.getInt(3);
                c.userID = resultSet.getInt(4);
                c.username = resultSet.getString("username");
                c.resortID = resultSet.getInt(6);
                c.runID = resultSet.getInt(7);
                c.commentTime = resultSet.getTimestamp("commentTime");
                list.add(c);
            }
            return list;
        
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
