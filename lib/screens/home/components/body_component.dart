import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text_component.dart';
import 'package:furniture_app/screens/home/components/recommended_product.dart';
import 'package:furniture_app/services/categories_service.dart';
import 'package:furniture_app/services/product_service.dart';
import 'package:furniture_app/size_config.dart';
import 'categories.dart';

class BodyComponent extends StatelessWidget {
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
          FutureBuilder(
              future: CategoryService.getAllCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"))),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(defaultSize * 2),
            child: TitleText(
              title: "Recommended for you",
            ),
          ),
          FutureBuilder(
              future: ProductService.getAllProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommandedProduct(
                      products: snapshot.data,
                    )
                  : Center(child: Image.asset("assets/ripple.gif"))),
        ],
      ),
    ));
  }
}
