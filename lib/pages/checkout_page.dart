import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart'; // Importuokite savo modelio klasę

// Dummy data for the shopping cart
List<Product> cartProducts = [
  Product(id: 1, name: "Modernus Veidrodis", brand: "MirrorCo", price: 150.0, image: "lib/images/mirror1.jpg"),
  Product(id: 2, name: "Prašmatnus Dušas", brand: "ShowerLux", price: 300.0, image: "lib/images/shower1.jpg"),
  // Pridėkite daugiau produktų pagal poreikį
];

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double total = cartProducts.fold(0, (sum, item) => sum + item.price); // Bendra suma

    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.asset(cartProducts[index].image ?? '', width: 50, height: 50),
                  title: Text(cartProducts[index].name),
                  subtitle: Text("${cartProducts[index].brand} - €${cartProducts[index].price}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () {
                      // Čia būtų logika prekės šalinimui iš krepšelio
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total: €$total', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              onPressed: () {
                // Čia būtų logika užsakymo pateikimui
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
              child: const Text('Place Order', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
