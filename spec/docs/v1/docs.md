

# Group User registration


## Create action [/users/registration]


### Sign Up [POST /api/users/registration]


+ Request sign up success
**POST**&nbsp;&nbsp;`/api/users/registration`

    + Headers

            Accept: application/vnd.api.v1
            Content-Type: application/json

    + Body

            {
              "email": "norberto@ortiz.name",
              "password": "123456",
              "password_confirmation": "123456"
            }

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "user",
                "attributes": {
                  "email": "norberto@ortiz.name"
                }
              },
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request sign up fails
**POST**&nbsp;&nbsp;`/api/users/registration`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "Invalid email",
                  "detail": "Email can't be blank",
                  "source": {
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "Password can't be blank",
                  "source": {
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "Password is too short (minimum is 6 characters)",
                  "source": {
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
