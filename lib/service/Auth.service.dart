import 'package:http/http.dart' as http;

Future<http.Response> createUser(String fullName, String email, String password) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/signup'), body: {
    'fullName': fullName,
    'email': email,
    'password': password
  });
}

Future<http.Response> loginUser(String email, String password) {
  return http.post(Uri.http("10.0.2.2:3000", 'auth/login'), body: {
    'email': email,
    'password': password
  });
}

Future<http.Response> getUser(int userId) {
  return http.get(Uri.http("10.0.2.2:3000", 'auth/find/$userId}'));
}