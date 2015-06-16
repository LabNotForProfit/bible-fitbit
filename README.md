# bible-fitbit

User Authentication:

POST /users/sign_in
JSON request:
{"api_user":{"email":"example@example.com", "password": "password"}}
Successful authentication response:
{"success":true,"email":"example@example.com"}

DELETE /users/sign_out
Successful logout response:
{"success":true,"message":"signed out"}
Unsuccessful logout response:
{:success=>false, :message=>"logout not successful"}
