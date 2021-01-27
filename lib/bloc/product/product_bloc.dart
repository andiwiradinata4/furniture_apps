import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/bloc/product/product_event.dart';
import 'package:furniture_app/bloc/product/product_state.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/services/product_service.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(ProductState initialState) : super(initialState);

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    List<Product> products;
    try {
      if (event is ListProductEvent) {
        products = await ProductService.getAllProducts();
      }
      yield ProductLoadedState(products: products);
    } catch (_) {
      yield ProductErrorState();
    }
  }
}
