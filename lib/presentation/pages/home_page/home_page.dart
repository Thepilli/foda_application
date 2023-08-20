import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/constants/icon_path.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/home_page/widgets/food_card.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final state = context.read<OverviewState>();
    final list = [
      ImagePath.chillesDeNogada,
      ImagePath.elotes,
      ImagePath.enchiladas,
      ImagePath.enfrijoladas,
      ImagePath.huevos,
      ImagePath.mole,
      ImagePath.nachos,
      ImagePath.pozole,
      ImagePath.quesadillas,
      ImagePath.sopaDeLima,
      ImagePath.tamales,
      ImagePath.tostadas,
    ];

    return AppScaffold(
      body: Column(children: [
        AppBar(
          leading: Image.asset(IconPath.menu),
          elevation: 0,
          title: Text(state.userRepository.currentUserUID!),
          backgroundColor: Colors.transparent,
          actions: [InkWell(onTap: () => state.openCartView(context), child: Image.asset(IconPath.bag))],
        ),
        Expanded(
            child: ValueListenableBuilder<List<Food>>(
                valueListenable: state.foodRepository.foodNotifier,
                builder: (context, food, _) {
                  return PageView.builder(
                    itemCount: food.length,
                    // controller: PageController(),
                    controller: PageController(viewportFraction: 1.3),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
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
                                food: food[index],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }))
      ]),
    );
  }
}
