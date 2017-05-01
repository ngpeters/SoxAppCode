
// @GENERATOR:play-routes-compiler
// @SOURCE:/Users/kyleottmann/Documents/Westminster College/Spring 2017/CMPT 322 - Software Engineering/GIT/soxServer/conf/routes
// @DATE:Tue Apr 25 18:32:58 MDT 2017

import play.api.routing.JavaScriptReverseRoute
import play.api.mvc.{ QueryStringBindable, PathBindable, Call, JavascriptLiteral }
import play.core.routing.{ HandlerDef, ReverseRouteContext, queryString, dynamicString }


import _root_.controllers.Assets.Asset
import _root_.play.libs.F

// @LINE:6
package controllers.javascript {
  import ReverseRouteContext.empty

  // @LINE:6
  class ReverseHomeController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:6
    def index: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.HomeController.index",
      """
        function() {
          return _wA({method:"GET", url:"""" + _prefix + """"})
        }
      """
    )
  
  }

  // @LINE:9
  class ReverseAssets(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:9
    def versioned: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.Assets.versioned",
      """
        function(file1) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "assets/" + (""" + implicitly[PathBindable[Asset]].javascriptUnbind + """)("file", file1)})
        }
      """
    )
  
  }

  // @LINE:18
  class ReverseCommentController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:18
    def create: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CommentController.create",
      """
        function() {
          return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "newcomment"})
        }
      """
    )
  
    // @LINE:20
    def retrieve: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.CommentController.retrieve",
      """
        function(resortID0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "comment" + _qS([(""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("resortID", resortID0)])})
        }
      """
    )
  
  }

  // @LINE:12
  class ReverseUserController(_prefix: => String) {

    def _defaultPrefix: String = {
      if (_prefix.endsWith("/")) "" else "/"
    }

  
    // @LINE:14
    def retrieveUsername: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.retrieveUsername",
      """
        function(userID0) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "lookupusername" + _qS([(""" + implicitly[QueryStringBindable[Int]].javascriptUnbind + """)("userID", userID0)])})
        }
      """
    )
  
    // @LINE:16
    def verifyLogin: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.verifyLogin",
      """
        function(username0,password1) {
          return _wA({method:"GET", url:"""" + _prefix + { _defaultPrefix } + """" + "login" + _qS([(""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("username", username0), (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("password", password1)])})
        }
      """
    )
  
    // @LINE:12
    def create: JavaScriptReverseRoute = JavaScriptReverseRoute(
      "controllers.UserController.create",
      """
        function(username0,password1,email2) {
          return _wA({method:"POST", url:"""" + _prefix + { _defaultPrefix } + """" + "newuser" + _qS([(""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("username", username0), (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("password", password1), (""" + implicitly[QueryStringBindable[String]].javascriptUnbind + """)("email", email2)])})
        }
      """
    )
  
  }


}
