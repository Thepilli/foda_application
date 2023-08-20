// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/food_detail_page/food_detail_state.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class CountButton extends StatelessWidget {
  const CountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final overviewState = context.read<OverviewState>();
    final state = context.watch<FoodDetailState>();
    if (state.cartItem == null) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.blackColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  state.cartItem?.quantity != null
                      ? overviewState.addToCart(state.food, false)
                      : debugPrint('Cart Item is empty');
                },
                icon: const Icon(Icons.remove)),
            Text(
              "${state.cartItem?.quantity}",

              // state.cartItem?.quantity != null ? '${state.cartItem?.quantity}' : '0',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            IconButton(
                onPressed: () {
                  overviewState.addToCart(state.food);
                },
                icon: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
