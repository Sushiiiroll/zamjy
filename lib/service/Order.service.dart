import "package:http/http.dart" as http;

Future<http.Response> createOrder(int orderBy, String orderTitle, String orderPrice, String? orderImage) {
  return http.post(Uri.http("10.0.2.2:3000", 'order/create'),
      headers: {
        "content-type": "application/json"
      },
      body: {
      "orderBy": orderBy,
      "orderTitle": orderTitle,
      "orderPrice": orderPrice,
      "orderImage": orderImage
  });
}