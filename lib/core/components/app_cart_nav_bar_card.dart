import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/cart_page/cart_state.dart';
import 'package:provider/provider.dart';

class CartBottomNavigationBarCard extends StatelessWidget {
  final CartItem cartItem;
  final Food? food;
  final bool showDetails;
  const CartBottomNavigationBarCard({
    super.key,
    required this.cartItem,
    required this.food,
    this.showDetails = true,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();
    final size = AppTheme.size(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Image.network(
              food!.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            right: 0,
            child: FodaCircleButton(
              height: 25,
              onTap: () {},
              icon: Text(
                '${cartItem.quantity}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              gradientColors: const [AppColors.gradient1, AppColors.gradient3],
            ),
          ),
        ],
      ),
    );
  }
}
