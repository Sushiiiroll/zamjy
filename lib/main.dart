import 'package:flutter/material.dart';
import 'package:zamjy/btm_bar.dart';
import 'package:zamjy/login_page/log_in_page.dart';

import 'product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => BottomBarScreen(),
        "productDetails": (context) => ProductDetailScreen(),
      },
    );
  }
}
