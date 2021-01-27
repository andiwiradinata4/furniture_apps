import 'package:flutter/material.dart';
import 'package:furniture_app/bloc/category/category_state.dart';

// import 'package:furniture_app/models/categories.dart';
import 'package:furniture_app/screens/home/components/category_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key key,
    @required this.categories,
  }) : super(key: key);

  final CategoryLoadedState categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.categories.length,
            (index) => CategoryCard(category: categories.categories[index])),
      ),
    );
  }
}
