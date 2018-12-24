

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
              "email": "lanette@hegmann.io",
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
                  "email": "lanette@hegmann.io"
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
                  "detail": "can't be blank",
                  "source": {
                    "pointer": "/data/attributes/email"
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "can't be blank",
                  "source": {
                    "pointer": "/data/attributes/password"
                  }
                },
                {
                  "title": "Invalid password",
                  "detail": "is too short (minimum is 6 characters)",
                  "source": {
                    "pointer": "/data/attributes/password"
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


+ Request verificatioin complete
**GET**&nbsp;&nbsp;`/api/users/verification?email_token=eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE1NDU3NTAyMjl9.O0cicrQi25-bgo8uJJqI37JIUUEl6kWxghs4j--F1DU`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: text/plain; charset=utf-8

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
                  "title": "Invalid email_token",
                  "detail": "Invalid or expired token. Please retry account confirmation",
                  "source": {
                    "pointer": "/data/attributes/email-token"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }

+ Request verificatioin fails
**GET**&nbsp;&nbsp;`/api/users/verification?email_token=eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE1NDU3NTAyMjl9.07PrMqkpU247KfHbP01CYwz53za0fv04KexQFHHL1L8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "Invalid user_account",
                  "detail": "This user account has already been verified",
                  "source": {
                    "pointer": "/data/attributes/user-account"
                  }
                }
              ],
              "jsonapi": {
                "version": "1.0"
              }
            }
