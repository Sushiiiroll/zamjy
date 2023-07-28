import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  const ItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.76,
      children: [
        //for(int i=1; i<5; i++)
        Container(
          padding: const EdgeInsets.symmetric(),
          margin: const EdgeInsets.symmetric(),
          decoration: BoxDecoration(color: Colors.grey, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 8,
            )
          ]),
        )
      ],
    );
  }
}
