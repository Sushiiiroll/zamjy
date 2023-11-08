import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zamjy/service/initialize.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Initialize>(context);

    if (provider.selectedCarts.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text(
            'MY CART',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          children: [
            const Text(
              "Order",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            const SizedBox(height: 18.0),
            ListView.builder(
              itemCount: provider.selectedCarts.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
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
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'http://10.0.2.2:3000/${provider.selectedCarts[index]['image']}',
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
                            SizedBox(
                              width: 100.0,
                              child: Text(
                                "${provider.selectedCarts[index]['menu']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                // GestureDetector(
                                //   onTap: () {},
                                //   child: Container(
                                //     width: 20.0,
                                //     height: 20.0,
                                //     decoration: BoxDecoration(
                                //       color: Colors.red,
                                //       borderRadius: BorderRadius.circular(4.0),
                                //     ),
                                //     child: const Icon(
                                //       Icons.remove,
                                //       color: Colors.white,
                                //       size: 15.0,
                                //     ),
                                //   ),
                                // ),
                                // const Padding(
                                //   padding:
                                //       EdgeInsets.symmetric(horizontal: 8.0),
                                //   child: Text(
                                //     "123",
                                //     style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // ),
                                // GestureDetector(
                                //   onTap: () {},
                                //   child: Container(
                                //     width: 20.0,
                                //     height: 20.0,
                                //     decoration: BoxDecoration(
                                //       color: Colors.blue,
                                //       borderRadius: BorderRadius.circular(4.0),
                                //     ),
                                //     child: const Icon(
                                //       Icons.add,
                                //       color: Colors.white,
                                //       size: 15.0,
                                //     ),
                                //   ),
                                // ),
                                const Spacer(),
                                Text(
                                  "\$${provider.selectedCarts[index]['price']}",
                                  style: const TextStyle(
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
              },
            ),
            const SizedBox(height: 21.0),
            const Spacer(),
            // const Text(
            //   'Total Price',
            //   style: TextStyle(
            //     fontSize: 19,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // const Text(
            //   '\$300',
            //   style: TextStyle(
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        child: const Text("NO CARTS"),
      );
    }
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
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
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "123",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
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
