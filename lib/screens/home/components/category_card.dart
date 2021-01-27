import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text_component.dart';
import 'package:furniture_app/models/categories.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.category,
    // required this.press,
  }) : super(key: key);

  final Category category;
  // final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return GestureDetector(
      // onTap: press,
      child: Padding(
        padding: EdgeInsets.all(defaultSize * 2),
        child: SizedBox(
          width: defaultSize * 20.5, // 205
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /// Using ClipPath for custom shape
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                    aspectRatio: 1.025,
                    child: Container(
                      padding: EdgeInsets.all(defaultSize * 2),
                      color: cSecondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleText(
                            title: category.title,
                          ),
                          SizedBox(
                            height: defaultSize,
                          ),
                          Text(
                            "${category.numOfProducts} + Products",
                            style:
                                TextStyle(color: cTextColor.withOpacity(0.6)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                      aspectRatio: 1.15,
                      child: FadeInImage.assetNetwork(
                          placeholder: "assets/spinner.gif",
                          image: category.image),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    /// Left Bottom
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);

    /// Right Bottom
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);

    /// Right Top
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);

    /// Left Top
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    // path.lineTo(width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
