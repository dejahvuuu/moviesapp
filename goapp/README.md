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

Users register
```Shell
http://localhost:9000/api/users/register

Body
{
    "name": "Pedro",
	"username": "dpeter",
    "email": "peter@gmail.com",
    "password": "mypassword",
    "user_type": "ADMIN"
}

```


```Shell
http://localhost:9000/api/users/login
```






