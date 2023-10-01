// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/service/Auth.service.dart';
import 'package:zamjy/service/initialize.dart';

import 'package:zamjy/utils/colors.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<ChangePassScreen> {
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final retypeController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isOldPasswordVisible = false;
  bool isTap = true;

  @override
  void initState() {
    super.initState();

    oldController.addListener(() => setState(() {}));
    newController.addListener(() => setState(() {}));
    retypeController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    const storage = FlutterSecureStorage();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 1,
          centerTitle: true,
          title: const Text(
            'Change Password',
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
            String getOldPassword = user['password'];
            int userId = user['id'];

            return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    _buildOldPasswordText(),
                    _buildOldPassword(),
                    _buildNewPasswordText(),
                    _buildNewPassword(),
                    _buildRetypePasswordText(),
                    _buildRetypePassword(),
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
                                String oldPassword = oldController.value.text;
                                String newPassword = newController.value.text;
                                String reTypePassword = retypeController.value.text;

                                if (getOldPassword == oldPassword) {
                                  print(oldPassword);
                                  print(newPassword);
                                  print(reTypePassword);

                                  if (newPassword == reTypePassword) {
                                    final response = await updatePassword(password, userId);

                                    if (response.statusCode == 201) {
                                      await storage.deleteAll();
                                      await storage.write(key: "auth", value: response.body);
                                      provider.updateUserNotifier();
                                      await _showMyDialog("New Password set!", "Password");
                                    } else {
                                      await _showMyDialog("Something went wrong", "Server Error");
                                    }
                                  } else {
                                    await _showMyDialog("New Password doesn't match to re type password", "Invalid Password");
                                  }
                                } else {
                                  await _showMyDialog("Invalid Old Password", "Invalid Password");
                                }
                              },
                              child: const Text(
                                "SAVE",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                        ))
                  ],
                )
            );
          },
        )
    );
  }

  Padding _buildRetypePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) => setState(() => password = value),
        controller: retypeController,
        validator: (value) {
          if (value != _buildNewPassword()) return 'Not Match';
          return null;
        },
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            //errorText: 'Password is not match',
            suffixIcon: IconButton(
              icon: isPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () =>
                  setState(() => isPasswordVisible = !isPasswordVisible),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
        obscureText: isPasswordVisible,
      ),
    );
  }

  Padding _buildRetypePasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Re-type Password",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildNewPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: newController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: isNewPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () =>
                  setState(() => isNewPasswordVisible = !isNewPasswordVisible),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
        obscureText: isNewPasswordVisible,
      ),
    );
  }

  Padding _buildNewPasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "New  Password",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildOldPasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Old Password",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildOldPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: oldController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: isOldPasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () =>
                  setState(() => isOldPasswordVisible = !isOldPasswordVisible),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: isTap != true ? Colors.grey : Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.grey))),
        obscureText: isOldPasswordVisible,
      ),
    );
  }

  Future<void> _showMyDialog(String message, String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok Got it'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  }
