package routes

import (
	"goapp/controllers"
	"goapp/middleware"

	"github.com/gin-gonic/gin"
)

func UserRoutes(router gin.Engine) {
	router.Use(middleware.AuthenticateUser())
	router.GET("/api/users/:user_id", controllers.GetUser())
	router.GET("/api/users", controllers.GetUsers())
}
