import 'package:flutter/material.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/cart_page/cart_page.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:foda/presentation/pages/checkout_page/confirmation_order_page.dart';
import 'package:foda/presentation/pages/checkout_page/widgets/completed_order_page.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<CheckoutState>();
    return AppScaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 5,
          width: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(99), color: AppColors.orange),
        ),
      ),
      Expanded(
        child: PageView(
            controller: state.pageController,
            onPageChanged: state.onPageChange,
            // physics: const NeverScrollableScrollPhysics(),
            children: const [
              CartPage(),
              ConfirmationOrderPage(),
              CompeltedOrderPage(),
            ]),
      ),
    ]));
  }
}
