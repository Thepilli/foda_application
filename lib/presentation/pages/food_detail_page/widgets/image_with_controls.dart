import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/food_detail_page/food_detail_state.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class ImageWithControls extends StatelessWidget {
  const ImageWithControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final overviewState = context.read<OverviewState>();
    final state = context.watch<FoodDetailState>();
    return Stack(
      children: [
        Container(
          height: 300.h,
          width: 300.w,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Image.network(state.food.imageUrl),
        ),
        Positioned(
          right: 0,
          bottom: 50,
          child: FodaCircleButton(
            height: 60,
            onTap: () {
              overviewState.addToCart(state.food);
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            ),
            gradientColors: const [AppColors.orange, AppColors.gradient3],
          ),
        ),
        Positioned(
          right: 50,
          bottom: 0,
          child: FodaCircleButton(
            height: 40,
            onTap: () {
              overviewState.addToFavorite(state.food);
            },
            icon: const Icon(
              Icons.favorite_border,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
