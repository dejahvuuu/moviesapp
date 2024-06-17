package main

import (
	"fmt"
	"goapp/database"
	"goapp/routes"
	"os"

	"github.com/gin-gonic/gin"
	"go.mongodb.org/mongo-driver/mongo"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}
	router := gin.Default()

	//run database
	database.StartDB()

	var userCollection *mongo.Collection = database.OpenCollection(database.Client, "user")
	fmt.Println("Collection Name:", userCollection.Name())

	//Log events
	router.Use(gin.Logger())

	//Register app routes here
	routes.AuthRoutes(router)
	routes.UserRoutes(*router)
	routes.MovieRoutes(*router)

	router.GET("/home", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"success": "Welcome to go api!"})
	})

	router.Run(":" + port)

}
