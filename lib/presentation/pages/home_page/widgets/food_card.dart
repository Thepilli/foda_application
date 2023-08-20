import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    final state = context.read<OverviewState>();

    return Column(
      children: [
        Stack(
          /// !!!!
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 300.h,
              width: 300.w,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     color: AppColors.blackColor.withOpacity(.6),
                //     spreadRadius: 20,
                //     blurRadius: 20,
                //     offset: const Offset(15, 5),
                //   ),
                // ],
              ),
              child: Image.network(food.imageUrl),
            ),
            Positioned(
              left: 0,
              bottom: 50,
              child: FodaCircleButton(
                height: 60,
                onTap: () {
                  state.addToCart(food);
                },
                icon: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
                gradientColors: const [AppColors.orange, AppColors.gradient3],
              ),
            ),
            Positioned(
              left: 50,
              bottom: 0,
              child: FodaCircleButton(
                height: 40,
                onTap: () {
                  state.addToFavorite(food);
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
            Positioned(
                left: -120,
                bottom: 100,
                child: SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppTheme.elementSpacing * 0.5),
                      Text("\$ ${food.price}.00",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.orange))
                    ],
                  ),
                )),
          ],
        )
      ],
    );
  }
}
