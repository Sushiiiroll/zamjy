import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/Screen/LoginScreen.dart';
import 'package:zamjy/Screen/SignupScreen.dart';
import 'package:zamjy/btm_bar.dart';
import 'package:zamjy/product_details.dart';
import 'package:zamjy/service/initialize.dart';
// import 'package:dotenv/dotenv.dart';

// var env = DotEnv(includePlatformEnvironment: true)..load();


main() async {
  runApp(const GetMaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Initialize(),
      child: Consumer<Initialize>(
        builder: (context, value, child) => const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    // print();
    return Consumer<Initialize>(builder: (context, value, child) {
      print(value.user);

      if (value.user.toString().isNotEmpty && value.user != null) {
          return Scaffold(
            body: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
              ),
              routes: {
                "/": (context) => const BottomBarScreen(),
                "productDetails": (context) => const ProductDetailScreen(),
              },
            ),
          );
      } else {
          return const LoginScreen();
      }
    });
   // if (context.watch<Initialize>().user.toString().isNotEmpty) {
   //   return MaterialApp(
   //     title: 'Flutter Demo',
   //     debugShowCheckedModeBanner: false,
   //     theme: ThemeData(
   //       scaffoldBackgroundColor: Colors.white,
   //     ),
   //     routes: {
   //       "/": (context) => const BottomBarScreen(),
   //       "productDetails": (context) => const ProductDetailScreen(),
   //     },
   //   );
   // } else {
   //   return MaterialApp(
   //     title: 'Flutter Demo',
   //     debugShowCheckedModeBanner: false,
   //     theme: ThemeData(
   //       scaffoldBackgroundColor: Colors.white,
   //     ),
   //     routes: {
   //       "/": (context) => const LoginScreen(),
   //       "/signup": (context) => const SignupScreen(),
   //     },
   //   );
   // }
  }
}
