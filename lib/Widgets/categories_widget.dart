import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key,
      required this.caText,
      required this.imgPath,
      required this.color})
      : super(key: key);
  final String caText, imgPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        print('Category Pressed');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Column(children: [
          Container(
            height: screenWidth * 0.3,
            width: screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          Text(
            caText,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}
