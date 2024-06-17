# Golang Backend

## Install go(lang)

with [homebrew](http://mxcl.github.io/homebrew/):

```Shell
sudo brew install go
```

with [apt](http://packages.qa.debian.org/a/apt.html)-get:

```Shell
sudo apt-get install golang
```

### Run

To execute a **Golang** program, write ```go run``` at the cli followed by the name of the file.  
You also can convert the file to a binary executable program by the command ```go build```.  

```Shell
go run main.go
```


### DB / Install MongoDB

Please follow the instrucctions: [MongoDb Site](https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-os-x/) 

```Shell
brew services start mongodb/brew/mongodb-community
```

```Shell
brew services stop mongodb/brew/mongodb-community
```

MongoDB GUI (Compass): [Compass](https://www.mongodb.com/try/download/compass)
See .env file: MONGOURI=mongodb://localhost:27017

### Test API

Install POSTMAN [Postman](https://www.postman.com/downloads/)

#### Endpoints API

Users register `POST`
```Shell
http://localhost:9000/api/users/register

Body
{
    "name": "Alberto Galvis",
	"username": "dejahvuuu",
    "email": "dejahvuuu@gmail.com",
    "password": "mypassword",
    "user_type": "ADMIN"
}

```

Users login `POST`
```Shell
http://localhost:9000/api/users/login

Body
{
    "email": "dejahvuuu@gmail.com",
	"password": "mypassword"
}


Response
{
    "ID": "666cfc9894f2602c966277ba",
    "name": "Alberto Galvis",
    "username": "dejahvuuu",
    "password": "$2a$14$kJblR1SnhO6XKJOqeLuP/ecH8D9KdFiquweORFa4luowC7ZX30sJu",
    "email": "dejahvuuu@gmail.com",
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6ImRlamFodnV1dUBnbWFpbC5jb20iLCJOYW1lIjoiQWxiZXJ0byBHYWx2aXMiLCJVc2VybmFtZSI6ImRlamFodnV1dSIsIlVpZCI6IjY2NmNmYzk4OTRmMjYwMmM5NjYyNzdiYSIsIlVzZXJfdHlwZSI6IkFETUlOIiwiZXhwIjoxNzE4NjgwMTI3fQ.hNhs1l9ZjyPEcEomgScWx8j28ecg_CMSJbWh2ruE0eM",
    "user_type": "ADMIN",
    "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJFbWFpbCI6IiIsIk5hbWUiOiIiLCJVc2VybmFtZSI6IiIsIlVpZCI6IiIsIlVzZXJfdHlwZSI6IiIsImV4cCI6MTcxODk5NjkyN30.H8_0jC-HtcP0viPwArbrtHsGHq47OD-0rJo_LHkugUk",
    "created_at": "2024-06-15T02:29:44Z",
    "updated_at": "2024-06-17T15:08:47Z",
    "user_id": "666cfc9894f2602c966277ba"
}

```

Create Movie `POST`
```Shell
http://localhost:9000/api/movies/createmovie

Body
{
    "name": "Cars",
	"topic": "Anime",
    "movie_url": "https://www.youtube.com/watch?v=5PyfOmajUu0",
    "movie_id": "3"
}

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'

```

Get Movies `GET`
```Shell
http://localhost:9000/api/movies

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'

```

Get Movie by ID `GET`
```Shell
http://localhost:9000/api/movies/{{movieid}}

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'

```

Update Movie `PUT`
```Shell
http://localhost:9000/api/movies/{{_id}}

Body
{
	"name": "Cars version 3.0",
    "topic": "Ciencia Ficcion",
    "movie_url": "https://www.youtube.com/watch?v=TTgk_iT8Uts"
}

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'
```
Delete Movie `DELETE`
```Shell
http://localhost:9000/api/movies/{{movieid}}

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'
```


Get Users `GET`
```Shell
http://localhost:9000/api/users

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'
```

Get User by ID `GET`
```Shell
http://localhost:9000/api/users/{{user_id}}

header:
"token" : 'The token that the user returns after logging in, the user must be of type ADMIN.'
```









