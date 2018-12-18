

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
              "email": "monte@mante.biz",
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
                  "email": "monte@mante.biz"
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

# Group User verification


## Index action [/users/verification]


### User verification [GET /api/users/verification]


+ Request verificatioin fails
**GET**&nbsp;&nbsp;`/api/users/verification`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "email_token": "Invalid or expired token. Please retry account confirmation"
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request verificatioin fails
**GET**&nbsp;&nbsp;`/api/users/verification?email_token=eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDUyMjg0NTd9.UWWi63a3eAmLw1IXC926jPdGXus4JTvy-MQRdxko7zs`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "user_account": "This user account has already been verified"
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
