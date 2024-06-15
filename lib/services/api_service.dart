import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/product.dart';
 // Importuokite savo modelio klasę

class ApiService {
  final String _baseUrl = "http://your-api-url.com/api"; // Pakeiskite į savo API URL

  // Gauna visus produktus
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products'));
      if (response.statusCode == 200) {
        List<dynamic> productList = json.decode(response.body);
        return productList.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
