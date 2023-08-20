import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_state.dart';
import 'package:provider/provider.dart';

class CompeltedOrderPage extends StatelessWidget {
  const CompeltedOrderPage({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CheckoutState>();

    return Stack(
      children: [
        Align(
          alignment: const Alignment(0, -0.95),
          child: Text(
            "Thank You Order",
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.orange,
                ),
          ),
        ),
        Positioned(
          bottom: AppTheme.cardPadding,
          left: AppTheme.cardPadding,
          right: AppTheme.cardPadding,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(AppTheme.cardPadding),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.orange,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.currentUser.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.orange,
                          ),
                    ),
                    Text(
                      "Port Harcourt, Nigeria",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                    const SizedBox(height: AppTheme.elementSpacing),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.call),
                                const SizedBox(width: AppTheme.elementSpacing * 0.5),
                                Text(
                                  "Personal +234XXXX 564",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.grey,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.place),
                                const SizedBox(width: AppTheme.elementSpacing * 0.5),
                                Text(
                                  "14km - 5min",
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: AppColors.grey,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "\$ ${state.totalOrderPrice}",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppColors.red,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTheme.cardPadding),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.blue,
                        ),
                        const SizedBox(width: AppTheme.elementSpacing),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            Text(
                              "Courier",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.grey,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.cardPadding),
              FodaButton(
                label: "Complete",
                gradientColors: const [
                  AppColors.gradient3,
                  AppColors.gradient4,
                ],
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ],
    );
  }
}
