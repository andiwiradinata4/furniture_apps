import 'package:furniture_app/models/categories.dart';

abstract class CategoryState {}

class CategoryUninitializedState extends CategoryState {}

class CategoryLoadedState extends CategoryState {
  List<Category> categories;

  CategoryLoadedState({this.categories});
}

class CategoryErrorState extends CategoryState {}
