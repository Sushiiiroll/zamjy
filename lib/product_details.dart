import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zamjy/Widgets/ProductBottomBar.dart';

import 'Widgets/ProductAppBar.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    if (_counter < 1) {
      return;
    }
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const ProductAppBar(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              "assets/images/bibimbap.png",
              height: 300,
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Product Title",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (index) {},
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _decrementCount,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                child: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "$_counter",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _incrementCount,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                child: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Description of the Product. Description of the Product. Description of the Product. Description of the Product.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ProductBottomBar(),
    );
  }
}
