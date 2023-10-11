// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/service/Auth.service.dart';
import 'package:zamjy/service/initialize.dart';

import 'package:zamjy/utils/colors.dart';

enum Gender { male, female }

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isTap = true;
  String? gender;
  @override
  void initState() {
    super.initState();
    fnameController.addListener(() => setState(() {}));
    lnameController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Initialize>(context);
    const storage = FlutterSecureStorage();
    final decodeUser = jsonDecode(provider.user);

    int userId = decodeUser['account_id'];
    String firstName = decodeUser['firstname'];
    String lastName = decodeUser['lastname'];
    String email = decodeUser['username'];


    fnameController = TextEditingController(text: firstName);
    lnameController = TextEditingController(text: lastName);
    emailController = TextEditingController(text: email);


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'My Account',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer(
          builder: (context, value, child) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  _buildFirstNameText(),
                  _buildFirstName(),
                  _buildLastNameText(),
                  _buildLastName(),
                  _buildEmailText(),
                  _buildEmail(),
                  _buildGenderText(),
                  _buildGenderOption(),
                  const SizedBox(height: 50),
                  Center(
                      child: SizedBox(
                        height: Get.height / 15,
                        width: Get.width / 2.5,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                backgroundColor: ColorPalette.elevatedButtonColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            onPressed: () async {
                              String fname = fnameController.value.text;
                              String lname = lnameController.value.text;
                              String email = emailController.value.text;
                              // String fname = fnameController.value.text;
                              // String email = emailController.value.text;
                              //
                              final response = await updateUser(
                                fname, lname, email, userId
                              );

                              if (response.statusCode == 201) {
                                await storage.deleteAll();
                                await storage.write(key: "auth", value: response.body);
                                provider.updateUserNotifier();
                              }
                            },
                            child: const Text(
                              "SAVE",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      )
                  )
                ],
              )
          ),
        )
    );
  }

  Row _buildGenderOption() {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            title: const Text("Male"),
            value: "male",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
          ),
        ),
        Expanded(
          child: RadioListTile(
            title: const Text("Female"),
            value: "female",
            groupValue: gender,
            onChanged: (value) {
              setState(() {
                gender = value.toString();
              });
            },
          ),
        ),
      ],
    );
  }

  Padding _buildGenderText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Gender",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }

  Padding _buildEmailText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Email",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildLastName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: lnameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }

  Padding _buildLastNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Last Name",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildFirstNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "First Name",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildFirstName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: fnameController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }
}
