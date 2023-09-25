import 'package:flutter/material.dart';

class CODScreen extends StatelessWidget {
  const CODScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: const Text(
          'HOME DELIVERY',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 18.0),
            const CartItem(),
            const CartItem(),
            const CartItem(),
            const CartItem(),
            const SizedBox(height: 21.0),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$150",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery charge",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$50",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Sub Total",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "\$200",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () {},
              color: Colors.teal,
              height: 50.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                "CHECKOUT",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: NetworkImage(
                      'assets/images/combo_meal.png',
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  width: 100.0,
                  child: Text(
                    "Combo Meal",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15.0,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "\$150",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
