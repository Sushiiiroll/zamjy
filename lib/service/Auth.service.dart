import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createUser(
    String lastname,
    String firstname,
    String username,
    String password
    ) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/signup'), body: {
    'lastname': lastname,
    'firstname': firstname,
    'username': username,
    'password': password,
    'usertype': "customer"
  });
}

Future<http.Response> loginUser(String email, String password) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/login'), body: {
    'username': email,
    'password': password
  });
}

Future<http.Response> getUser(int userId) {
  return http.get(Uri.http("10.0.2.2:3000", 'auth/find/$userId'));
}

Future<http.Response> updateUser(
    String firstname,
    String lastname,
    String email,
    int userId
    ) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/update/$userId'),
      headers: {
        "content-type": "application/json"
      },
      body: jsonEncode({
        'firstname': firstname,
        'lastname': lastname,
        'username': email
      })
  );
}

Future<http.Response> updatePassword(String password, int userId) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/update/$userId'),
      headers: {
        "content-type": "application/json"
      },
      body: jsonEncode({
        'password': password,
      })
  );
}