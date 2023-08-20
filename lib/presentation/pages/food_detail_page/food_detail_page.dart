// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/food_detail_page/food_detail_state.dart';
import 'package:foda/presentation/pages/food_detail_page/widgets/counter_button.dart';
import 'package:foda/presentation/pages/food_detail_page/widgets/food_details.dart';
import 'package:foda/presentation/pages/food_detail_page/widgets/image_with_controls.dart';
import 'package:foda/presentation/pages/food_detail_page/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class FoodDetailPage extends StatelessWidget {
  const FoodDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              MyAppBar(),
              ImageWithControls(),
              const CountButton(),
              FoodDetails(),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailViewWidget extends StatelessWidget {
  final Food food;
  const FoodDetailViewWidget({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FoodDetailState(food),
      child: const FoodDetailPage(),
    );
  }
}
