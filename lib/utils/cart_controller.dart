import 'package:get/get.dart';
import 'package:zamjy/utils/cart_model.dart';

class CartController extends GetxController {
  final _cart = {}.obs;

  void addProduct(Cart cart) {
    if (_cart.containsKey(cart)) {
      _cart[cart] += 1;
    } else {
      _cart[cart] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${cart.nameProducts} to the cart",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
    );
  }

  get cart => _cart;
}
