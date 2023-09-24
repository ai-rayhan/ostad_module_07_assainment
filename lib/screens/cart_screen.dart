
import 'package:flutter/material.dart';
import 'package:ostad_module_07_assainment/models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> products;

  const CartScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int totalItems = products.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: Center(
        child: Text('Total Items in Cart: $totalItems'),
      ),
    );
  }
}
