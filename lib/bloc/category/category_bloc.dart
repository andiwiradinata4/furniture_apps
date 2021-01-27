import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/bloc/category/category_event.dart';
import 'package:furniture_app/bloc/category/category_state.dart';
import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/services/categories_service.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(CategoryState initialState)
      : super(CategoryUninitializedState());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    List<Category> categories;
    try {
      if (event is ListCategoryEvent) {
        categories = await CategoryService.getAllCategories();
      }
      yield CategoryLoadedState(categories: categories);
    } catch (_) {
      yield CategoryErrorState();
    }
  }
}
