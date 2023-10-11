import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createReservations(
    int pax,
    String name,
    String contact_num,
    String date,
    String time,
    double fee
    ) {
  final encodeToJson = jsonEncode({
    "pax": pax,
    "name": name,
    "contact_num": contact_num,
    "date": date,
    "time": time,
    "fee": fee
  });

  print(encodeToJson);

  return http.post(Uri.http("10.0.2.2:3000", 'reservation/create'),
      headers: {
        "content-type": "application/json"
      },
      body: encodeToJson);
}