class Product {
  final String name;
  final double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});
}
final List<Product> products = [
  Product(name: 'Smartphone', price: 699),
  Product(name: 'Laptop', price: 999),
  Product(name: 'Tablet', price: 399),
  Product(name: 'Headphones', price: 149),
  Product(name: 'Camera', price: 499),
  Product(name: 'Smartwatch', price: 199),
  Product(name: 'Bluetooth Speaker', price: 79),
  Product(name: 'Gaming Console', price: 299),
  Product(name: 'HDTV', price: 699),
  Product(name: 'Wireless Mouse', price: 29),
];
