# bible-fitbit

##User Authentication:

POST /api/users/sign_in
JSON request:
```
{"api_user":{"email":"example@example.com", "password": "password"}}
```
Successful authentication response:
```
{"success":true,"email":"example@example.com"}
```

DELETE /api/users/sign_out
Successful logout response:
```
{"success":true,"message":"signed out"}
```
Unsuccessful logout response:
```
{:success=>false, :message=>"logout not successful"}
```

##Registration:

POST /api/users
```
JSON request: {"api_user":{"email":"example@example.com", "password": "password"}}
```
Successful registration response:
```
{"id":11,"email":"example@example.com","created_at":"2015-06-16T05:02:15.116Z","updated_at":"2015-06-16T05:02:15.116Z"}
```

##Users:

GET /api/users/
```
{"example@example.com":{"id":8},"example2@example.com":{"id":9}}
```

GET /api/users/show/:id
Successful get user response:
```
{"id":8,"email":"example@example.com"}
```
Unsuccessful get user response:
```
{"status":"false","error":"No user found with id: 8"}
```
