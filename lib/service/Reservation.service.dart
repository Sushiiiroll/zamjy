import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response> createReservations(String totalGuests, String date, String time, String receipt, String userId) {
  final encodeToJson = jsonEncode({
    'totalGuest': totalGuests.toString(),
    'reservedBy': int.parse(userId.toString()),
    'time': time.toString(),
    'date': date.toString(),
    'gcashReceipt': receipt.toString()
  });

  print(encodeToJson);

  return http.post(Uri.http("10.0.2.2:3000", 'reservation/create'),
      headers: {
        "content-type": "application/json"
      },
      body: encodeToJson);
}