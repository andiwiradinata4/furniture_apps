import 'package:furniture_app/models/product.dart';

abstract class ProductState {}

class ProductUninitializedState extends ProductState {}

class ProductLoadedState extends ProductState {
  List<Product> products;

  ProductLoadedState({this.products});
}

class ProductErrorState extends ProductState {}
