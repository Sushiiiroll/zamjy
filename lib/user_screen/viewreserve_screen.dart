// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zamjy/service/Reservation.service.dart';

class ViewReservationScreen extends StatefulWidget {
  const ViewReservationScreen({Key? key}) : super(key: key);

  @override
  State<ViewReservationScreen> createState() => _ViewReservationScreenState();
}

class _ViewReservationScreenState extends State<ViewReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'My Reservations',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: getMyReservations("customer1", "customerlastname"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> decodeData = jsonDecode(snapshot.data!.body);

            if (decodeData.isNotEmpty) {
              return ListView.builder(
                  itemCount: decodeData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 110,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Schedule",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              "No.Guests: ${decodeData[index]["pax"]}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              "Date: ${DateFormat('yMd').format(DateTime.parse(decodeData[index]["date"]))}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              "Time: ${DateFormat.jm().format(DateTime.parse(decodeData[index]["time"]))}",
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
