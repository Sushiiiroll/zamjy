import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zamjy/Widgets/bestdeals.dart';
import 'package:zamjy/utils/cart_controller.dart';
import 'package:zamjy/utils/cart_model.dart';
import 'package:zamjy/utils/data_builder.dart';
import 'package:zamjy/utils/images.dart';
import '../Widgets/best_deals_widget.dart';

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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _buildSearchFoodText(),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [_buildBestDealsText(), _buildBestDealsList()],
          ),
          const SizedBox(
            height: 20,
          ),
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
          GestureDetector(
            onTap: () {
              cartController.addProduct(Cart.cart[index]);
            },
            child: Image.asset(Assets.cart),
          ),
        ],
      ),
    );
  }

  SizedBox _buildBestDealsList() {
    return SizedBox(
      height: 210,
      child: ListView.builder(
          itemCount: bestdeals.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return BestDealsWidget(bestdeals: bestdeals[index]);
          }),
    );
  }

  Padding _buildBestDealsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Text(
            'BEST DEALS',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 177),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BestDeals()),
                );
              },
              child: const Text(
                "See All",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
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
