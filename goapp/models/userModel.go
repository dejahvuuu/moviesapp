package models

import (
	/*
	The time package to help with setting the data type for our Created_at and Updated_at values
	*/
	"time"

	"go.mongodb.org/mongo-driver/bson/primitive"
)

// The struct acts like a middleman between our MongoDB and Go program
type User struct {
	ID            primitive.ObjectID `bson:"_id"`
	Name          *string            `json:"name" validate:"required,min=4,max=100"`
	Username      *string            `json:"username" validate:"required,min=4,max=100"`
	Password      *string            `json:"password" validate:"required,min=8"`
	Email         *string            `json:"email" validate:"email,required"`
	Token         *string            `json:"token"`
	User_type     *string            `json:"user_type" validate:"required,eq=ADMIN|eq=USER"`
	Refresh_token *string            `json:"refresh_token"`
	Created_at    time.Time          `json:"created_at"`
	Updated_at    time.Time          `json:"updated_at"`
	User_id       string             `json:"user_id"`
}