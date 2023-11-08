// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/service/initialize.dart';

class ProductBottomBar extends StatelessWidget {
  const ProductBottomBar(
      {super.key, required this.data, required this.totalPieces});

  final int totalPieces;
  final Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Initialize>(context);

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "₱${data!['price']}",
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              if (!provider.isExists(data)) {
                provider.carts(data);
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color(0xFF009688),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
            ),
            icon: const Icon(CupertinoIcons.cart_badge_plus),
            label: Text(
              provider.isExists(data) ? 'Done' : 'Add to Cart',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
