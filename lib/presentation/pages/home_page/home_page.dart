import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/constants/icon_path.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/home_page/widgets/food_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final list = [
      ImagePath.chilles_de_nogada,
      ImagePath.elotes,
      ImagePath.enchiladas,
      ImagePath.enfrijoladas,
      ImagePath.huevos,
      ImagePath.mole,
      ImagePath.nachos,
      ImagePath.pozole,
      ImagePath.quesadillas,
      ImagePath.sopa_de_lima,
      ImagePath.tamales,
      ImagePath.tostadas,
    ];

    return AppScaffold(
      body: Column(children: [
        AppBar(
          leading: Image.asset(IconPath.menu),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [Image.asset(IconPath.bag)],
        ),
        Expanded(
            child: PageView.builder(
          itemCount: list.length,
          // controller: PageController(),
          controller: PageController(viewportFraction: 1.3),
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemBuilder: (context, index) {
            double scaleFactor = currentPage == index ? 1 : 0.5;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                AnimatedPositioned(
                  duration: AppTheme.animationDuration,
                  top: currentPage == index ? 0 : 300,
                  right: 0,
                  child: AnimatedScale(
                    duration: AppTheme.animationDuration,
                    scale: scaleFactor,
                    child: FoodCard(
                      list: list,
                      index: index,
                    ),
                  ),
                ),
              ],
            );
          },
        ))
      ]),
    );
  }
}
