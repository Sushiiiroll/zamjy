import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/Screen/SignupScreen.dart';
import 'package:zamjy/service/Auth.service.dart';
import 'package:zamjy/service/initialize.dart';
import 'package:zamjy/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final storage = const FlutterSecureStorage();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  bool isTap = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Initialize>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Align(
                    alignment: Alignment.center,
                  ),
                  Image.asset(
                    "assets/images/Applogo.png",
                    height: 95,
                    width: 95,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "Please Login to continue",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildEmailText(),
              _buildEmail(),
              _buildPasswordText(),
              _buildPassword(),
              const SizedBox(height: 50),
              Center(
                child: SizedBox(
                  height: 60,//Get.height / 15,
                  width: 200, //Get.width / 2.5,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: ColorPalette.elevatedButtonColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () async {
                      final email = this.emailController.value.text;
                      final password = this.passController.value.text;

                      await value.initializeLoginUser(email, password);
                      // final response = await loginUser(email, password);
                      //
                      // if (response.bodyBytes.isNotEmpty) {
                      //   print(response.body);
                      //
                      //   await storage.write(key: "auth", value: response.body);
                      // }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       // builder: (context) => const BottomBarScreen()),
                      // );
                    },
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignupScreen())
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignupScreen()),
                      // );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }

  Padding _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: passController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
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


  Padding _buildPasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Password",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
  Padding _buildEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
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
