import 'package:flutter/material.dart';
import 'package:foda/core/constants/icon_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final overviewState = context.read<OverviewState>();
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        color: AppColors.orange,
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 15,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        InkWell(
          onTap: () => overviewState.openCartView(context),
          child: Builder(
            builder: (context) {
              final cartItems = context.select<CheckoutState, List<CartItem>>((value) => value.cart);
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(color: AppColors.buttonColor, borderRadius: BorderRadius.circular(99)),
                    child: Image.asset(IconPath.bag),
                  ),
                  if (cartItems.isNotEmpty) ...[
                    Positioned(
                        right: -2,
                        child: Text(
                          cartItems.length.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                        ))
                  ]
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
