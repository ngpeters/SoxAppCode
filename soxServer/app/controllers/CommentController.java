package controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.Comment;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
import util.Util;
import java.util.*;



import java.util.Set;
/*creates json requests
 */
public class CommentController extends Controller{
    
    public Result create() {
        JsonNode json = request().body().asJson();
    
        String comment = null;
        int rating = 0;
        int userID = 0;
        int resortID = 0;
        int runID = 0;

        if(json == null) {
                return badRequest("Expecting Json data");
            } else {
                comment = json.findPath("comment").textValue();
                if(comment == null) {
                    return badRequest("Missing parameter [comment]");
                }
                
                rating = json.findPath("rating").asInt();
                if(rating == 0) {
                    return badRequest("Missing parameter [rating]");
                }
                
                userID = json.findPath("userID").asInt();
                if(userID == 0) {
                    return badRequest("Missing parameter [userID]");
                }
                
                resortID = json.findPath("resortID").asInt();
                if(resortID == 0) {
                    return badRequest("Missing parameter [resortID]");
                }
                
                runID = json.findPath("runID").asInt();
                if(runID == 0) {
                    return badRequest("Missing parameter [runID]");
                }
            }
            
        Comment newComment = new Comment().createComment(comment, rating, userID, resortID, runID);
        
        return ok(Util.createResponse(json, true));
        } 

	//get a comment
	public Result retrieve(int resortID) {

        Comment c = new Comment();
        List<Comment> l = new ArrayList<Comment>();
		JsonNode jsonObjects = Json.toJson(c.getCommentFromResortID(resortID));

		if (jsonObjects == null) {
			return notFound(Util.createResponse(
					"Comment from resort ID:" + resortID + " not found", false));
		}
		return ok(Util.createResponse(jsonObjects, true));
	}
}