import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zamjy/utils/data_builder.dart';
import 'package:zamjy/utils/images.dart';

class DrinksScreen extends StatefulWidget {
  const DrinksScreen({Key? key}) : super(key: key);

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          'DRINKS',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: _buildGridView(),
          )
        ],
      ),
    );
  }

  SizedBox _buildGridView() {
    return SizedBox(
      height: Get.height / 2.2,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 50,
            mainAxisSpacing: 40),
        itemCount: allproducts.length,
        itemBuilder: (context, index) {
          return _buildProductLength(index);
        },
      ),
    );
  }

  InkWell _buildProductLength(int index) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:
                    // ignore: use_full_hex_values_for_flutter_colors
                    const BorderSide(color: Color(0xffb9b1b18f)))),
        child: Column(
          children: [
            allproducts[index].products,
            _buildProducts(index),
            _buildStarRating(index),
            _buildPriceProduct(index),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "productDetails");
      },
    );
  }

  RatingBarIndicator _buildStarRating(int index) {
    return RatingBarIndicator(
      rating: allproducts[index].ratings,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, index) {
        return const Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
    );
  }

  Text _buildProducts(int index) {
    return Text(
      allproducts[index].nameProducts,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
    );
  }

  Padding _buildPriceProduct(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("₱${allproducts[index].priceProducts.toStringAsFixed(2)}"),
          GestureDetector(onTap: () {}, child: Image.asset(Assets.cart))
        ],
      ),
    );
  }
}
