// ignore: file_names
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:zamjy/service/initialize.dart';

class ProductAppBar extends StatefulWidget {
  const ProductAppBar({super.key});

  @override
  State<ProductAppBar> createState() => _ProductAppBarState();
}

class _ProductAppBarState extends State<ProductAppBar> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Initialize>(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.grey,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Product",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -10, end: -12),
            showBadge: true,
            ignorePointer: false,
            onTap: () {},
            badgeContent: Text(
              '${provider.selectedCarts.length}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            badgeAnimation: const badges.BadgeAnimation.rotation(
              animationDuration: Duration(milliseconds: 300),
              loopAnimation: false,
            ),
            badgeStyle: const badges.BadgeStyle(
              shape: badges.BadgeShape.circle,
              badgeColor: Colors.teal,
              padding: EdgeInsets.all(5),
            ),
            child: GestureDetector(
              onTap: (() {}),
              child: const Icon(
                EvaIcons.shoppingCart,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
