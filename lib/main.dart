import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product A', price: 10),
    Product(name: 'Product B', price: 20),
    Product(name: 'Product C', price: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(products: products),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            product: products[index],
            onBuyPressed: () {
              setState(() {
                products[index].incrementCounter();
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: [
                          ElevatedButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  int counter = 0;

  Product({required this.name, required this.price});

  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function() onBuyPressed;

  ProductItem({required this.product, required this.onBuyPressed});

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

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

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
