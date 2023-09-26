import 'package:flutter/material.dart';
import 'package:ostad_module_07_assainment/models/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  ProductItemState createState() => ProductItemState();
}

class ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text('\$${widget.product.price}'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Quantity: ${widget.product.counter}'),
          ElevatedButton(
            onPressed: () {
              setState(() {
                widget.product.counter++;
                if (widget.product.counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Congratulations!'),
                        content: Text(
                            'You\'ve bought 5 ${widget.product.name}!'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
            child: const Text('Buy Now'),
          ),
        ],
      ),
    );
  }
}