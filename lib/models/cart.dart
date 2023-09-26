import 'package:ostad_module_07_assainment/models/product.dart';

class Cart {
  final Map<Product, int> items = {};

  double get totalPrice {
    double total = 0.0;
    items.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }
}