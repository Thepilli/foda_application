import 'package:flutter/material.dart';
import 'package:foda/core/components/app_cart_nav_bar_card.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class CartBottomNavigationBar extends StatelessWidget {
  const CartBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final overviewState = context.read<OverviewState>();
    final cart = context.select<CheckoutState, List<CartItem>>(
      (value) => value.cart,
    );
    final cartItems = context.select<CheckoutState, Map<String, Food>>(
      (value) => value.cartItems,
    );
    return Container(
      padding: const EdgeInsets.only(
        right: 10,
        bottom: 10,
      ),
      child: Row(children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: cart.length,
            itemBuilder: (BuildContext context, int index) {
              return CartBottomNavigationBarCard(cartItem: cart[index], food: cartItems[cart[index].foodId]);
            },
          ),
        ),
        FodaButton(
          label: 'Cart',
          labelStyle: Theme.of(context).textTheme.titleMedium,
          width: 100,
          height: 60,
          color: AppColors.buttonColor,
          onTap: () {
            overviewState.openCartView(context);
          },
        )
      ]),
    );
  }
}
