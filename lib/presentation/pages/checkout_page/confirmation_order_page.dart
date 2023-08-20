import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:foda/presentation/pages/checkout_page/widgets/cart_summary.dart';
import 'package:foda/presentation/pages/checkout_page/widgets/payment_method.dart';
import 'package:provider/provider.dart';

class ConfirmationOrderPage extends StatelessWidget {
  const ConfirmationOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CheckoutState>();
    return Column(
      children: [
        const SizedBox(height: AppTheme.elementSpacing),
        Text(
          "Confirm Order",
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.orange,
              ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: AppTheme.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppTheme.cardPadding),
                CartSummary(),
                PaymentMethod(),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppTheme.cardPadding),
          child: FodaButton(
            state: state.isLoading ? ButtonState.loading : ButtonState.idle,
            label: "Confirmation",
            gradientColors: const [
              AppColors.gradient3,
              AppColors.gradient4,
            ],
            onTap: context.read<CheckoutState>().placeOrder,
          ),
        ),
        const SizedBox(height: kToolbarHeight),
      ],
    );
  }
}
