import 'package:http/http.dart' as http;

Future<http.Response> getAllProducts() {
  return http.get(Uri.http("10.0.2.2:3000", "menu/all-products"));
}
