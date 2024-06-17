package routes

import (
	controllers "goapp/controllers"

	"github.com/gin-gonic/gin"
)

func AuthRoutes(router *gin.Engine) {
	router.POST("/api/users/signup", controllers.Signup())
	router.POST("/api/users/login", controllers.Login())
}
