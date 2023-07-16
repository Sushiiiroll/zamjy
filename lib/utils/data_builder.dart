import 'package:flutter/material.dart';
import 'package:zamjy/utils/images.dart';

class AllProducts {
  final Image products;
  final String nameProducts;
  double ratings;
  final double priceProducts;

  AllProducts(
      {required this.products,
      required this.nameProducts,
      required this.ratings,
      required this.priceProducts});
}

List<AllProducts> allproducts = [
  AllProducts(
      products: Image.asset(
        Assets.bibimbap,
        height: 70,
        width: 100,
        fit: BoxFit.fill,
      ),
      nameProducts: "Bibimbap",
      ratings: 5.0,
      priceProducts: 100.0),
  AllProducts(
      products: Image.asset(
        Assets.bulgogi,
        height: 70,
        width: 100,
        fit: BoxFit.fill,
      ),
      nameProducts: "Beef Bulgogi",
      ratings: 5.0,
      priceProducts: 150.0),
  AllProducts(
      products: Image.asset(
        Assets.sisig,
        height: 70,
        width: 100,
        fit: BoxFit.fill,
      ),
      nameProducts: "Sizzling Sisig",
      ratings: 4.0,
      priceProducts: 150.0),
  AllProducts(
      products: Image.asset(
        Assets.ramen,
        height: 70,
        width: 100,
        fit: BoxFit.fill,
      ),
      nameProducts: "Ramen",
      ratings: 3.0,
      priceProducts: 95.0),
];
