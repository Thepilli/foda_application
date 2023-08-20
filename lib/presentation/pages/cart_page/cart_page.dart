import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/cart_page/widgets/order_card.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CheckoutState>();
    if (state.cart.isNotEmpty) {
      return AppScaffold(
        body: Column(children: [
          Text('Your order', style: Theme.of(context).textTheme.displayLarge),
          Expanded(
            child: ListView.builder(
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                return OrderCard(
                  cartItem: state.cart[index],
                  food: state.cartItems[state.cart[index].foodId],
                );
              },
            ),
          ),
          Column(
            children: [
              Text('Total', style: Theme.of(context).textTheme.displayLarge),
              Text(state.cart.length > 1 ? '${state.cart.length} items' : '${state.cart.length} item',
                  style: Theme.of(context).textTheme.displaySmall),
              Text('\$${state.getTotalAmount.toDouble()}', style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          FodaButton(
            label: 'Confirm Order',
            onTap: () {
              state.animateToPage(confirm_order);
            },
            gradientColors: const [AppColors.gradient3, AppColors.gradient1],
          )
        ]),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(ImagePath.basket),
            const JBox(
              height: 20,
            ),
            Text(
              'Your basket is empty',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      );
    }
  }
}
