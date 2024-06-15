import 'package:flutter/material.dart';
import 'products_page.dart';
import 'checkout_page.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Šviesesnė pilka spalva fonui
      appBar: AppBar(
        backgroundColor: Colors.grey, // Tamsesnė juosta navigacijai
        toolbarHeight: 60, // Mažesnis aukštis navigacijos juostai
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Meniu ikona
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Atidaro stalčių
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white), // Vartotojo ikona
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white), // Krepšelio ikona
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckoutPage()), // Navigacija į Checkout puslapį
              );
            },
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset('lib/images/logo2.png', height: 50), // Logotipo dydis
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pop(); // Uždaro stalčių
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_basket),
              title: const Text('Products'),
              onTap: () {
                Navigator.of(context).pop(); // Uždaro stalčių
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check),
              title: const Text('Check Out'),
              onTap: () {
                Navigator.of(context).pop(); // Uždaro stalčių
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CheckoutPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 5,
            color: const Color.fromARGB(255, 133, 165, 180), // Horizontalios juostos spalva
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 36, // Didelis teksto dydis
                          color: Color.fromARGB(255, 145, 190, 211),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Say '),
                          TextSpan(
                            text: 'YES',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                          TextSpan(text: ' for a change.'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'Convert your outdated and dull bathroom into a palace of peace and tranquility you deserve. ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Flexible(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('lib/images/grey_bathroom.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductsPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Mygtuko spalva
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 175, vertical: 25),
                    ),
                    child: const Text('Shop Now'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




/* // ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'products_page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey, // Šviesesnė pilka spalva fonui
      appBar: AppBar(
        backgroundColor: Colors.grey, // Tamsesnė juosta navigacijai
        toolbarHeight: 60, // Mažesnis aukštis navigacijos juostai
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white), // Meniu ikona
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white), // Vartotojo ikona
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white), // Krepšelio ikona
            onPressed: () {},
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Image.asset('lib/images/logo2.png', height: 50), // Logotipo dydis
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 5,
            color: const Color.fromARGB(255, 133, 165, 180), // Horizontalios juostos spalva
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 36, // Didelis teksto dydis
                          color: Color.fromARGB(255, 145, 190, 211),
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Say '),
                          TextSpan(
                            text: 'YES',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 36,
                            ),
                          ),
                          TextSpan(text: ' for a change.'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Flexible(
                    flex: 1,
                    child: Text(
                      'Convert your outdated and dull bathroom into a palace of peace and tranquility you deserve. ',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  Flexible(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset('lib/images/grey_bathroom.jpg'), // Paveikslėlio failo pavadinimas
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductsPage()), // Navigacija į produktų puslapį
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800], // Mygtuko spalva
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 175, vertical: 25),
                    ),
                    child: const Text('Shop Now'),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

 */