import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/bloc/category/category_bloc.dart';
import 'package:furniture_app/bloc/category/category_event.dart';
import 'package:furniture_app/bloc/category/category_state.dart';
import 'package:furniture_app/bloc/product/product_bloc.dart';
import 'package:furniture_app/bloc/product/product_event.dart';
import 'package:furniture_app/bloc/product/product_state.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/category/category_body.dart';
import 'package:furniture_app/screens/home/components/body_component.dart';
import 'package:furniture_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// it help us to make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      // body: BodyComponent(),
      // body: BlocProvider<CategoryBloc>(
      //   create: (context) => CategoryBloc(CategoryUninitializedState())
      //     ..add(ListCategoryEvent()),
      //   child: CategoryBody(),
      // ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
              create: (context) => CategoryBloc(CategoryUninitializedState())
                ..add(ListCategoryEvent())),
          BlocProvider<ProductBloc>(
              create: (context) => ProductBloc(ProductUninitializedState())
                ..add(ListProductEvent())),
        ],
        child: CategoryBody(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/menu.svg", height: SizeConfig.defaultSize * 2, //20
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            icon: SvgPicture.asset(
              "assets/icons/scan.svg",
              height: SizeConfig.defaultSize * 2.4, //24
            ),
            onPressed: () {}),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(color: cTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
