import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zamjy/utils/data_builder.dart';
import 'package:zamjy/utils/images.dart';

class DealsWidget extends StatefulWidget {
  const DealsWidget({super.key});

  @override
  State<DealsWidget> createState() => _DealsWidgetState();
}

class _DealsWidgetState extends State<DealsWidget> {
  @override
  Widget build(BuildContext context) {
    (int index) {
      return Container(
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
      );
    };

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
}
