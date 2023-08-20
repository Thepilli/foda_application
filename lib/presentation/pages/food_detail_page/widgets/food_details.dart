import 'package:flutter/material.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/food_detail_page/food_detail_state.dart';
import 'package:provider/provider.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FoodDetailState>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              state.food.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              '\$${state.food.price.toDouble()}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        const JBox(height: AppTheme.cardPadding),
        Text(
          'Details',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const JBox(height: AppTheme.cardPadding),
        Text(
          state.food.description,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const JBox(height: AppTheme.cardPadding),
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const JBox(height: AppTheme.cardPadding),
        SizedBox(
          width: 100,
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.food.ingredients.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(state.food.ingredients[index]);
            },
          ),
        ),
      ],
    );
  }
}
