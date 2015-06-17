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
[{"id":1,"email":"example@example.com","created_at":"2015-06-16T17:52:40.769Z","updated_at":"2015-06-16T17:52:40.769Z"},{"id":2,"email":"example@example.com","created_at":"2015-06-16T18:45:33.688Z","updated_at":"2015-06-16T18:45:33.702Z"}]
```

GET /api/users/show/:id
Successful get user response:
```
{"id":8,"email":"example@example.com","created_at":"2015-06-16T18:46:25.268Z","updated_at":"2015-06-16T18:46:25.275Z"}
```
Unsuccessful get user response:
```
{"status":"false","error":"No user found with id: 8"}
```
