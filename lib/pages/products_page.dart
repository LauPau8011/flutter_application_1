import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/services/api_service.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Product>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = _apiService.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Our Products', style: TextStyle(color: Colors.lightBlue)),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        color: const Color.fromARGB(255, 88, 80, 80),
        child: FutureBuilder<List<Product>>(
          future: _productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var product = snapshot.data![index];
                  return Card(
                    color: Colors.grey,
                    child: ListTile(
                      leading: Image.network(product.image ?? '', width: 50, height: 50),
                      title: Text(product.name, style: const TextStyle(color: Colors.lightBlue)),
                      subtitle: Text('${product.brand} - €${product.price}', style: const TextStyle(color: Colors.lightBlue)),
                      trailing: ElevatedButton(
                        onPressed: () {
                          // Logika mygtuko paspaudimui
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue[800],
                        ),
                        child: const Text('Pirkti'),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('No products found'));
            }
          },
        ),
      ),
    );
  }
}






/* import 'package:flutter/material.dart';

// Dummy data for demonstration
final List<Map<String, dynamic>> products = [
  {
    'category': 'Veidrodžiai',
    'items': [
      {'title': 'Modernus Veidrodis', 'brand': 'MirrorCo', 'price': '€150', 'image': 'lib/images/mirror1.jpg'},
      {'title': 'Klasikinis Veidrodis', 'brand': 'Reflect', 'price': '€120', 'image': 'lib/images/mirror2.jpg'},
    ],
  },
  {
    'category': 'Dušai',
    'items': [
      {'title': 'Prašmatnus Dušas', 'brand': 'ShowerLux', 'price': '€300', 'image': 'lib/images/shower1.jpg'},
      {'title': 'Ekonominis Dušas', 'brand': 'BudgetShower', 'price': '€80', 'image': 'lib/images/shower2.jpg'},
    ],
  },
  {
    'category': 'Kranai',
    'items': [
      {'title': 'Šiuolaikinis Kranas', 'brand': 'FaucetModern', 'price': '€200', 'image': 'lib/images/faucet1.jpg'},
      {'title': 'Retro Kranas', 'brand': 'VintageFlow', 'price': '€175', 'image': 'lib/images/faucet2.jpg'},
    ],
  },
  {
    'category': 'Vėjeliai',
    'items': [
      {'title': 'Tylus Vėjelis', 'brand': 'QuietAir', 'price': '€100', 'image': 'lib/images/fan1.jpg'},
      {'title': 'Energiją Taupantis Vėjelis', 'brand': 'EcoAir', 'price': '€120', 'image': 'lib/images/fan2.jpg'},
    ],
  },
];

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Our Products',
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        color: const Color.fromARGB(255, 88, 80, 80), // Šviesiai pilkas fonas
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            var category = products[index];
            return ExpansionTile(
              title: Text(
                category['category'],
                style: const TextStyle(color: Colors.lightBlue),
              ),
              children: category['items'].map<Widget>((item) {
                return Card(
                  color: Colors.grey, // Kortelės fonas
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 50, height: 50),
                    title: Text(item['title'], style: const TextStyle(color: Colors.lightBlue)),
                    subtitle: Text('${item['brand']} - ${item['price']}', style: const TextStyle(color: Colors.lightBlue)),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Logika mygtuko paspaudimui
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue[800], // Teksto spalva mygtuke
                      ),
                      child: const Text('Pirkti'),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
 */