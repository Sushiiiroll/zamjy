// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

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
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Container(
            height: 110,
            width: double.infinity,
            color: Colors.grey,
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Schedule",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "No.Guests: 5",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "Date: 07-29-2023",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1),
                  child: Text(
                    "Time: 8:00 PM",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
