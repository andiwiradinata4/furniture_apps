import 'package:furniture_app/models/categories.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {
  static Future<List<Category>> getAllCategories() async {
    List<Category> categories = [];
    const String apiUrl =
        "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      /// If the server did return a 200 OK response,
      /// then parse the JSON.
      categories = (json.decode(response.body) as List)
          .map((data) => Category.fromJson(data))
          .toList();

      /// Return list of products
      return categories;
    } else {
      /// If the server did not return a 200 OK response,
      /// then throw an exception.
      throw Exception('Failed to load');
    }
  }
}
