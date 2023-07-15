import 'package:flutter/material.dart';
import 'package:zamjy/Widgets/categories_widget.dart';

// ignore: must_be_immutable
class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/bibimbap.png',
      'caText': 'Solo Meals',
    },
    {
      'imgPath': 'assets/images/drinks.png',
      'caText': 'Drinks',
    },
    {
      'imgPath': 'assets/images/combo_meal.png',
      'caText': 'Combo Meals',
    },
    {
      'imgPath': 'assets/images/liquors.png',
      'caText': 'Liquors',
    },
    {
      'imgPath': 'assets/images/sisig.png',
      'caText': 'To Share',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'CATEGORIES',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 280 / 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(5, (index) {
              return CategoriesWidget(
                caText: catInfo[index]['caText'],
                imgPath: catInfo[index]['imgPath'],
                color: Colors.grey,
              );
            }),
          ),
        ),
      ),
    );
  }
}
