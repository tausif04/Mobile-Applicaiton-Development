import 'package:flutter/material.dart';

void main() {
  runApp(const SimpleListApp());
}

class SimpleListApp extends StatelessWidget {
  const SimpleListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  // 1. The Simple Array (Our "Database")
  final List<Map<String, dynamic>> products = [
    {
      "productName": "Gaming Mouse",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
    {
      "productName": "Mechanical Keyboard",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
    {
      "productName": "Curved Monitor",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
    {
      "productName": "USB-C Cable",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
    {
      "productName": "Webcam HD",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
    {
      "productName": "Gaming Chair",
      "price": "245 usd",
      "Rating": 6,
      "Stock": "5 Unit",
      "Discount": "30%",
    },
  ];

  ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 1: Basic Array to UI"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        // 2. Tell Flutter how many items are in the list
        itemCount: products.length,
        itemBuilder: (context, index) {
          // 3. Access the string at the current index
          final product = products[index];

          final productName = product["productName"];
          final price = product["price"];
          final rating = product["Rating"];
          final stock = product["Stock"];
          final discount = product["Discount"];

          return ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: Text(productName),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(price),
                Text(rating.toString()),
                Text(stock),
                Text(discount),
              ],
            ),

            // subtitle:Text(products["price"]) ,// 4. Display the String
            onTap: () {
              // Quick debug print to console
              print("Selected: $productName");
            },
          );
        },
      ),
    );
  }
}
