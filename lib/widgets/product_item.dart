import 'package:flutter/material.dart';
import 'package:ostad_module_07_assainment/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onBuyPressed;

  const ProductItem({super.key, required this.product, required this.onBuyPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: ${product.counter}'),
          ElevatedButton(
            onPressed: onBuyPressed,
            child: Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}
