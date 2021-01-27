import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/bloc/category/category_bloc.dart';
import 'package:furniture_app/bloc/category/category_state.dart';
import 'package:furniture_app/bloc/product/product_bloc.dart';
import 'package:furniture_app/bloc/product/product_state.dart';
import 'package:furniture_app/components/title_text_component.dart';
import 'package:furniture_app/screens/category/widgets/categories_widget.dart';
import 'package:furniture_app/screens/home/components/recommended_product.dart';
import 'package:furniture_app/screens/product/recommended_product_bloc.dart';
import 'package:furniture_app/services/product_service.dart';

import '../../size_config.dart';

class CategoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    /// It enables scrolling
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TitleText(
              title: "Browse by Categories",
            ),
          ),
          BlocBuilder<CategoryBloc, CategoryState>(builder: (context, state) {
            if (state is CategoryUninitializedState ||
                state is CategoryErrorState) {
              return Center(child: Image.asset("assets/ripple.gif"));
            } else {
              CategoryLoadedState categoryLoadedState =
                  state as CategoryLoadedState;
              return CategoriesWidget(categories: categoryLoadedState);
            }
          }),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText(
                  title: "Recommended for you",
                ),
                // SizedBox(
                //   width: defaultSize * 3,
                // ),
              ],
            ),
          ),
          // FutureBuilder(
          //     future: ProductService.getAllProducts(),
          //     builder: (context, snapshot) => snapshot.hasData
          //         ? RecommandedProduct(
          //             products: snapshot.data,
          //           )
          //         : Center(child: Image.asset("assets/ripple.gif"))),
          BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
            if (state is ProductUninitializedState ||
                state is ProductErrorState) {
              return Center(child: Image.asset("assets/ripple.gif"));
            } else {
              ProductLoadedState productLoadedState =
                  state as ProductLoadedState;
              return RecommendedProductBloc(
                products: productLoadedState,
              );
            }
          }),
        ],
      ),
    ));
  }
}
