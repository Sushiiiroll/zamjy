import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zamjy/btm_bar.dart';
import 'product_details.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => const BottomBarScreen(),
        "productDetails": (context) => const ProductDetailScreen(),
      },
    );
  }
}
