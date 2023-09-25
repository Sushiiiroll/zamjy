import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:zamjy/service/Auth.service.dart';
import 'package:zamjy/utils/colors.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final retypepassController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  bool isRetypePasswordVisible = false;
  bool isTap = true;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
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
                          "Create Account",
                          style: TextStyle(
                            fontSize: 30,
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
                _buildNameText(),
                _buildName(),
                _buildEmailText(),
                _buildEmail(),
                _buildPasswordText(),
                _buildPassword(),
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

                        final fullName = nameController.value.text;
                        final email = emailController.value.text;
                        final password = passController.text;

                        final registeredUser = await createUser(fullName, email, password);

                        if (registeredUser.statusCode == 201) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        "SIGN UP",
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
                      height: 95,
                    ),
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Log In",
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
            )
        )
    );
  }

  Padding _buildRetypePassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: retypepassController,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: isRetypePasswordVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
              onPressed: () => setState(
                      () => isRetypePasswordVisible = !isRetypePasswordVisible),
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
        obscureText: isRetypePasswordVisible,
      ),
    );
  }

  Padding _buildRetypePasswordText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Confirm Password",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
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

  Padding _buildNameText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        "Full Name",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: nameController,
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
