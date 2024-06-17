package routes

import (
	controllers "goapp/controllers"
	"goapp/middleware"

	"github.com/gin-gonic/gin"
)

func MovieRoutes(router gin.Engine) {
	router.Use(middleware.AuthenticateUser())
	router.POST("/api/movies/createmovie", controllers.CreateMovie())
	router.GET("/api/movies/:movie_id", controllers.GetMovie())
	router.GET("/api/movies", controllers.GetMovies())
	router.PUT("/api/movies/:movie_id", controllers.UpdateMovie())
	router.DELETE("/api/movies/:movie_id", controllers.DeleteMovie())
}
