package controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import models.User;
import play.libs.Json;
import play.mvc.Controller;
import play.mvc.Result;
import util.Util;

import java.util.Set;

/*creates json requests
 */
public class UserController extends Controller{

	//creates a user
	public Result create(String username, String password, String email) {

		User newUser = new User().createUser(username, password, email);
		JsonNode jsonObject = Json.toJson(newUser);

// 		if (jsonObject == null){
// 			return badRequest(Util.createResponse(
// 				"Unable to create a user", false));
// 		}
		return ok(Util.createResponse(jsonObject, true));
	}
	
	//get username from id
	public Result retrieveUsername(int id) {
		
		JsonNode jsonObjects = Json.toJson(User.getUsernameFromUserID(id));

		if (jsonObjects == null) {
			return notFound(Util.createResponse(
				"User with id:" + id + " not found", false));
		}
		return ok(Util.createResponse(jsonObjects, true));
	}
	
		//verify user login. Provide user id if username and password match, else provide user id as 0.
	public Result verifyLogin(String username, String password) {
		
		JsonNode jsonObjects = Json.toJson(User.verifyLogin(username, password));

		if (jsonObjects == null) {
			return notFound(Util.createResponse(
					"Username and password do not match for:" + username + ", try again", false));
		}
		return ok(Util.createResponse(jsonObjects, true));
	}
}