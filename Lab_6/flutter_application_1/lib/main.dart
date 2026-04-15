import 'package:flutter/material.dart';

void main() {
  runApp(const ProductApp());
}

List<Map<String, dynamic>> products = [
  {"id": 1, "name": "Gaming Mouse", "price": "25.00", "isAvailable": true},
  {
    "id": 2,
    "name": "Mechanical Keyboard",
    "price": "75.00",
    "isAvailable": true,
  },
];

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("JSON Product List")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ListTile(
            leading: CircleAvatar(child: Text(item['id'].toString())),
            title: Text(item['name']),
            subtitle: Text("\$${item['price']}"),
            trailing: Icon(
              item['isAvailable'] ? Icons.check : Icons.close,
              color: item['isAvailable'] ? Colors.green : Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddProductScreen()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  bool isAvailable = true;

  void _saveProduct() {
    if (nameController.text.isEmpty || priceController.text.isEmpty) return;

    Map<String, dynamic> newProduct = {
      "id": products.length + 1,
      "name": nameController.text,
      "price": priceController.text,
      "isAvailable": isAvailable,
    };

    products.add(newProduct);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Product")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(
                labelText: "Price",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField<bool>(
              value: isAvailable,
              decoration: const InputDecoration(
                labelText: "Availability",
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: true, child: Text("Available")),
                DropdownMenuItem(value: false, child: Text("Out of Stock")),
              ],
              onChanged: (val) => setState(() => isAvailable = val!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text("Save Product"),
            ),
          ],
        ),
      ),
    );
  }
}
