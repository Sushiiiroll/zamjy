// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/service/Reservation.service.dart';
import 'package:zamjy/service/initialize.dart';


class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final storage = const FlutterSecureStorage();
  final numberController = TextEditingController();
  final contactNumberController = TextEditingController();
  final receiptController = TextEditingController();
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController timeinput = TextEditingController();

  String dateValue = "";
  String timeValue = "";

  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'TABLE RESERVATION',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer(
        builder: (context, value, child) {

          final provider = context.read<Initialize>();

          final user = jsonDecode(provider.user);
          String firstName = user['firstname'];
          String lastName = user['lastname'];

          return Center(
            child: SizedBox(
              width: 300,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: numberController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                              color: Colors.teal,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "No.of Guests",
                          prefixIcon: IconButton(
                            icon: const Icon(
                              CupertinoIcons.group,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: contactNumberController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                              color: Colors.teal,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "Contact Number",
                          prefixIcon: IconButton(
                            icon: const Icon(
                              CupertinoIcons.phone,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),
                    TextField(
                      readOnly: true,
                      controller: dateinput,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Select Date",
                        prefixIcon: IconButton(
                          icon: const Icon(
                            CupertinoIcons.calendar,
                            color: Colors.grey,
                          ),
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2023),
                              lastDate: DateTime(2101),
                            );

                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                dateinput.text = formattedDate;
                                dateValue = pickedDate.toIso8601String();
                              });
                            } else {
                              print("Date is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),
                    TextField(
                      //readOnly: true,
                      controller: timeinput,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Select Time",
                        prefixIcon: IconButton(
                          icon: const Icon(
                            CupertinoIcons.clock,
                            color: Colors.grey,
                          ),
                          onPressed: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              initialTime: TimeOfDay.now(),
                              context: context,
                            );

                            if (pickedTime != null) {
                              DateTime parsedTime = DateFormat.jm()
                              // ignore: use_build_context_synchronously
                                  .parse(pickedTime.format(context).toString());
                              //converting to DateTime so that we can further format on different pattern.
                              String formattedTime =
                              DateFormat('HH:mm').format(parsedTime);
                              //DateFormat() is from intl package, you can format the time on any pattern you need.
                              setState(() {
                                timeinput.text =
                                    formattedTime; //set the value of text field.
                                timeValue = parsedTime.toIso8601String();
                              });
                            } else {
                              print("Time is not selected");
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 11,
                    ),
                    const Column(
                      children: [
                        Text(
                          "GCASH No: 09123478993",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,
                          ),
                        ),
                        Text(
                          "Name: ZAMJY SAMGYUPSALAN",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 11,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: receiptController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.teal,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "GCACH Receipt No.",
                        prefixIcon: IconButton(
                          icon: const Icon(
                            CupertinoIcons.group,
                            color: Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text(
                        'BOOK NOW',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () async {
                        final user = await storage.read(key: "auth");

                        if (user!.isNotEmpty) {
                          // final totalGuest = numberController.value.text;
                          // final receipt = receiptController.value.text;
                          // final timeInput = timeinput.value.text;
                          // final dateInput = dateinput.value.text;
                          // final receivedBy = jsonDecode(user);

                          final pax = numberController.value.text;
                          final name = "${firstName}, ${lastName}";
                          final contact_num = contactNumberController.value.text;
                          double fee = 10.0;

                          final response = await createReservations(int.parse(pax), name.toString(), contact_num.toString(), "${dateValue}Z", "${timeValue}Z", fee);
                        //
                        if (response.bodyBytes.length > 0) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Reservations'),
                                content: const Text('Reservations Done'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                          );
                        }

                        // print(response.body);
                      }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
