import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zamjy/service/Menu.service.dart';
import 'package:zamjy/utils/cart_controller.dart';
import 'package:zamjy/utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: FutureBuilder(
        future: getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> decodeData = jsonDecode(snapshot.data!.body);

            // return Text("I GOT THE DATA BITCH!");
            if (decodeData.isNotEmpty) {
              return ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  _buildSearchFoodText(),
                  const SizedBox(
                    height: 20,
                  ),
                  // Column(
                  //   children: [_buildBestDealsText(), _buildBestDealsList()],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'ALL PRODUCTS',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: SizedBox(
                      height: Get.height,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 3,
                                crossAxisSpacing: 50,
                                mainAxisSpacing: 40),
                        itemCount: decodeData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Container(
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side:
                                            // ignore: use_full_hex_values_for_flutter_colors
                                            const BorderSide(
                                                color: Color(0xffb9b1b18f)))),
                                child: Column(
                                  children: [
                                    Image.network(
                                      'http://10.0.2.2:3000/${decodeData[index]['image']}',
                                      height: 90,
                                      // width: 100,
                                      fit: BoxFit.fill,
                                    ),
                                    Text(
                                      '${decodeData[index]['menu']}',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    RatingBarIndicator(
                                      rating: 3,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemBuilder: (context, index) {
                                        return const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "₱${decodeData[index]['price'].toStringAsFixed(2)}"),
                                          GestureDetector(
                                            onTap: () {
                                              // cartController.addProduct(Cart.cart[index]);
                                            },
                                            child: Image.asset(Assets.cart),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              // print(decodeData[index].toString());
                              Navigator.pushNamed(context, "productDetails",
                                  arguments: decodeData[index]);
                            },
                          );
                        },
                      ),
                    ),
                  )
                ],
              );
            }
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  Padding _buildSearchFoodText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0.8),
          ),
          hintText: 'Search Food',
          prefixIcon: const Icon(
            Icons.search,
            size: 30.0,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
