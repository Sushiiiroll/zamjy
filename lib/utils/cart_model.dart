import 'package:flutter/material.dart';
import 'package:zamjy/utils/images.dart';

class Cart {
  final Image products;
  final String nameProducts;
  final double priceProducts;

  Cart({
    required this.products,
    required this.nameProducts,
    required this.priceProducts,
  });

  static List<Cart> cart = [
    Cart(
        products: Image.asset(
          Assets.bibimbap,
          height: 70,
          width: 100,
          fit: BoxFit.fill,
        ),
        nameProducts: "Bibimbap",
        priceProducts: 100.0),
    Cart(
        products: Image.asset(
          Assets.bulgogi,
          height: 70,
          width: 100,
          fit: BoxFit.fill,
        ),
        nameProducts: "Beef Bulgogi",
        priceProducts: 150.0),
    Cart(
        products: Image.asset(
          Assets.sisig,
          height: 70,
          width: 100,
          fit: BoxFit.fill,
        ),
        nameProducts: "Sizzling Sisig",
        priceProducts: 150.0),
    Cart(
        products: Image.asset(
          Assets.ramen,
          height: 70,
          width: 100,
          fit: BoxFit.fill,
        ),
        nameProducts: "Ramen",
        priceProducts: 95.0),
  ];
}
