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
  final List<String> products = [
    "Gaming Mouse",
    "Mechanical Keyboard",
    "Curved Monitor",
    "USB-C Cable",
    "Webcam HD",
    "Gaming Chair",
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
          String productName = products[index];

          return ListTile(
            leading: const Icon(Icons.shopping_bag_outlined),
            title: Text(productName), // 4. Display the String
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
