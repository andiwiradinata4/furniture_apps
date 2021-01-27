import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text_component.dart';
import 'package:furniture_app/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defaultSize * 14.5,
        decoration: BoxDecoration(
            color: cSecondaryColor, borderRadius: BorderRadius.circular(30)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultSize),
                child: TitleText(
                  title: product.title,
                ),
              ),
              SizedBox(
                height: defaultSize / 2,
              ),
              Text("\$${product.price}")
            ],
          ),
        ),
      ),
    );
  }
}