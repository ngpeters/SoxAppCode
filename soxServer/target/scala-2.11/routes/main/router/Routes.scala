
// @GENERATOR:play-routes-compiler
// @SOURCE:/Users/kyleottmann/Documents/Westminster College/Spring 2017/CMPT 322 - Software Engineering/GIT/soxServer/conf/routes
// @DATE:Tue Apr 25 18:32:58 MDT 2017

package router

import play.core.routing._
import play.core.routing.HandlerInvokerFactory._
import play.core.j._

import play.api.mvc._

import _root_.controllers.Assets.Asset
import _root_.play.libs.F

class Routes(
  override val errorHandler: play.api.http.HttpErrorHandler, 
  // @LINE:6
  HomeController_1: controllers.HomeController,
  // @LINE:9
  Assets_3: controllers.Assets,
  // @LINE:12
  UserController_2: controllers.UserController,
  // @LINE:18
  CommentController_0: controllers.CommentController,
  val prefix: String
) extends GeneratedRouter {

   @javax.inject.Inject()
   def this(errorHandler: play.api.http.HttpErrorHandler,
    // @LINE:6
    HomeController_1: controllers.HomeController,
    // @LINE:9
    Assets_3: controllers.Assets,
    // @LINE:12
    UserController_2: controllers.UserController,
    // @LINE:18
    CommentController_0: controllers.CommentController
  ) = this(errorHandler, HomeController_1, Assets_3, UserController_2, CommentController_0, "/")

  import ReverseRouteContext.empty

  def withPrefix(prefix: String): Routes = {
    router.RoutesPrefix.setPrefix(prefix)
    new Routes(errorHandler, HomeController_1, Assets_3, UserController_2, CommentController_0, prefix)
  }

  private[this] val defaultPrefix: String = {
    if (this.prefix.endsWith("/")) "" else "/"
  }

  def documentation = List(
    ("""GET""", this.prefix, """controllers.HomeController.index"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """assets/""" + "$" + """file<.+>""", """controllers.Assets.versioned(path:String = "/public", file:Asset)"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """newuser""", """controllers.UserController.create(username:String, password:String, email:String)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """lookupusername""", """controllers.UserController.retrieveUsername(userID:Int)"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """login""", """controllers.UserController.verifyLogin(username:String, password:String)"""),
    ("""POST""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """newcomment""", """controllers.CommentController.create()"""),
    ("""GET""", this.prefix + (if(this.prefix.endsWith("/")) "" else "/") + """comment""", """controllers.CommentController.retrieve(resortID:Int)"""),
    Nil
  ).foldLeft(List.empty[(String,String,String)]) { (s,e) => e.asInstanceOf[Any] match {
    case r @ (_,_,_) => s :+ r.asInstanceOf[(String,String,String)]
    case l => s ++ l.asInstanceOf[List[(String,String,String)]]
  }}


  // @LINE:6
  private[this] lazy val controllers_HomeController_index0_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix)))
  )
  private[this] lazy val controllers_HomeController_index0_invoker = createInvoker(
    HomeController_1.index,
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.HomeController",
      "index",
      Nil,
      "GET",
      """ An example controller showing a sample home page""",
      this.prefix + """"""
    )
  )

  // @LINE:9
  private[this] lazy val controllers_Assets_versioned1_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("assets/"), DynamicPart("file", """.+""",false)))
  )
  private[this] lazy val controllers_Assets_versioned1_invoker = createInvoker(
    Assets_3.versioned(fakeValue[String], fakeValue[Asset]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.Assets",
      "versioned",
      Seq(classOf[String], classOf[Asset]),
      "GET",
      """ Map static resources from the /public folder to the /assets URL path""",
      this.prefix + """assets/""" + "$" + """file<.+>"""
    )
  )

  // @LINE:12
  private[this] lazy val controllers_UserController_create2_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("newuser")))
  )
  private[this] lazy val controllers_UserController_create2_invoker = createInvoker(
    UserController_2.create(fakeValue[String], fakeValue[String], fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "create",
      Seq(classOf[String], classOf[String], classOf[String]),
      "POST",
      """""",
      this.prefix + """newuser"""
    )
  )

  // @LINE:14
  private[this] lazy val controllers_UserController_retrieveUsername3_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("lookupusername")))
  )
  private[this] lazy val controllers_UserController_retrieveUsername3_invoker = createInvoker(
    UserController_2.retrieveUsername(fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "retrieveUsername",
      Seq(classOf[Int]),
      "GET",
      """""",
      this.prefix + """lookupusername"""
    )
  )

  // @LINE:16
  private[this] lazy val controllers_UserController_verifyLogin4_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("login")))
  )
  private[this] lazy val controllers_UserController_verifyLogin4_invoker = createInvoker(
    UserController_2.verifyLogin(fakeValue[String], fakeValue[String]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.UserController",
      "verifyLogin",
      Seq(classOf[String], classOf[String]),
      "GET",
      """""",
      this.prefix + """login"""
    )
  )

  // @LINE:18
  private[this] lazy val controllers_CommentController_create5_route = Route("POST",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("newcomment")))
  )
  private[this] lazy val controllers_CommentController_create5_invoker = createInvoker(
    CommentController_0.create(),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CommentController",
      "create",
      Nil,
      "POST",
      """""",
      this.prefix + """newcomment"""
    )
  )

  // @LINE:20
  private[this] lazy val controllers_CommentController_retrieve6_route = Route("GET",
    PathPattern(List(StaticPart(this.prefix), StaticPart(this.defaultPrefix), StaticPart("comment")))
  )
  private[this] lazy val controllers_CommentController_retrieve6_invoker = createInvoker(
    CommentController_0.retrieve(fakeValue[Int]),
    HandlerDef(this.getClass.getClassLoader,
      "router",
      "controllers.CommentController",
      "retrieve",
      Seq(classOf[Int]),
      "GET",
      """""",
      this.prefix + """comment"""
    )
  )


  def routes: PartialFunction[RequestHeader, Handler] = {
  
    // @LINE:6
    case controllers_HomeController_index0_route(params) =>
      call { 
        controllers_HomeController_index0_invoker.call(HomeController_1.index)
      }
  
    // @LINE:9
    case controllers_Assets_versioned1_route(params) =>
      call(Param[String]("path", Right("/public")), params.fromPath[Asset]("file", None)) { (path, file) =>
        controllers_Assets_versioned1_invoker.call(Assets_3.versioned(path, file))
      }
  
    // @LINE:12
    case controllers_UserController_create2_route(params) =>
      call(params.fromQuery[String]("username", None), params.fromQuery[String]("password", None), params.fromQuery[String]("email", None)) { (username, password, email) =>
        controllers_UserController_create2_invoker.call(UserController_2.create(username, password, email))
      }
  
    // @LINE:14
    case controllers_UserController_retrieveUsername3_route(params) =>
      call(params.fromQuery[Int]("userID", None)) { (userID) =>
        controllers_UserController_retrieveUsername3_invoker.call(UserController_2.retrieveUsername(userID))
      }
  
    // @LINE:16
    case controllers_UserController_verifyLogin4_route(params) =>
      call(params.fromQuery[String]("username", None), params.fromQuery[String]("password", None)) { (username, password) =>
        controllers_UserController_verifyLogin4_invoker.call(UserController_2.verifyLogin(username, password))
      }
  
    // @LINE:18
    case controllers_CommentController_create5_route(params) =>
      call { 
        controllers_CommentController_create5_invoker.call(CommentController_0.create())
      }
  
    // @LINE:20
    case controllers_CommentController_retrieve6_route(params) =>
      call(params.fromQuery[Int]("resortID", None)) { (resortID) =>
        controllers_CommentController_retrieve6_invoker.call(CommentController_0.retrieve(resortID))
      }
  }
}
