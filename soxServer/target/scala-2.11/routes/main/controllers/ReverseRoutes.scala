
// @GENERATOR:play-routes-compiler
// @SOURCE:/Users/kyleottmann/Documents/Westminster College/Spring 2017/CMPT 322 - Software Engineering/GIT/soxServer/conf/routes
// @DATE:Tue Apr 25 18:32:58 MDT 2017

import play.api.mvc.{ QueryStringBindable, PathBindable, Call, JavascriptLiteral }
import play.core.routing.{ HandlerDef, ReverseRouteContext, queryString, dynamicString }


import _root_.controllers.Assets.Asset
import _root_.play.libs.F

// @LINE:6
package controllers {

  // @LINE:6
  class ReverseHomeController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:6
    def index(): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix)
    }
  
  }

  // @LINE:9
  class ReverseAssets(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:9
    def versioned(file:Asset): Call = {
      implicit val _rrc = new ReverseRouteContext(Map(("path", "/public")))
      Call("GET", _prefix + { _defaultPrefix } + "assets/" + implicitly[PathBindable[Asset]].unbind("file", file))
    }
  
  }

  // @LINE:18
  class ReverseCommentController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:18
    def create(): Call = {
      import ReverseRouteContext.empty
      Call("POST", _prefix + { _defaultPrefix } + "newcomment")
    }
  
    // @LINE:20
    def retrieve(resortID:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "comment" + queryString(List(Some(implicitly[QueryStringBindable[Int]].unbind("resortID", resortID)))))
    }
  
  }

  // @LINE:12
  class ReverseUserController(_prefix: => String) {
    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:14
    def retrieveUsername(userID:Int): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "lookupusername" + queryString(List(Some(implicitly[QueryStringBindable[Int]].unbind("userID", userID)))))
    }
  
    // @LINE:16
    def verifyLogin(username:String, password:String): Call = {
      import ReverseRouteContext.empty
      Call("GET", _prefix + { _defaultPrefix } + "login" + queryString(List(Some(implicitly[QueryStringBindable[String]].unbind("username", username)), Some(implicitly[QueryStringBindable[String]].unbind("password", password)))))
    }
  
    // @LINE:12
    def create(username:String, password:String, email:String): Call = {
      import ReverseRouteContext.empty
      Call("POST", _prefix + { _defaultPrefix } + "newuser" + queryString(List(Some(implicitly[QueryStringBindable[String]].unbind("username", username)), Some(implicitly[QueryStringBindable[String]].unbind("password", password)), Some(implicitly[QueryStringBindable[String]].unbind("email", email)))))
    }
  
  }


}
