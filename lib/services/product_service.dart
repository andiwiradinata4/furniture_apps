import 'package:furniture_app/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  static Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    const String apiUrl =
        "https://5f210aa9daa42f001666535e.mockapi.io/api/products";
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      products = (json.decode(response.body) as List)
          .map((data) => Product.fromJson(data))
          .toList();
      return products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
