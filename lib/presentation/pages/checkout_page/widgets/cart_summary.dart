import 'package:flutter/material.dart';
import 'package:foda/core/components/app_cart_nav_bar_card.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CheckoutState>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 100,
            child: Stack(
              clipBehavior: Clip.none,
              children: List.generate(
                state.cart.length,
                (index) => Positioned(
                  left: index.toDouble() * 50,
                  child: SizedBox(
                    height: 65,
                    child: FittedBox(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CartBottomNavigationBarCard(
                            cartItem: state.cart[index],
                            food: state.cartItems[state.cart[index].foodId],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Total",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.grey,
                  ),
            ),
            Text(
              "\$ ${state.getTotalAmount}.00",
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: AppColors.orange,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: kToolbarHeight),
          ],
        ),
      ],
    );
  }
}
