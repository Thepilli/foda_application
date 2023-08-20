import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/cart_item.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/cart_page/cart_state.dart';
import 'package:provider/provider.dart';

class OrderCard extends StatelessWidget {
  final CartItem cartItem;
  final Food? food;
  const OrderCard({
    super.key,
    required this.cartItem,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CartState>();
    final size = AppTheme.size(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        height: 250,
        width: 200,
        decoration: const BoxDecoration(),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(
                        food!.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    right: size.width / 2 - 80.w,
                    child: FodaCircleButton(
                      height: 40,
                      onTap: () {},
                      icon: Text('${cartItem.quantity}'),
                      gradientColors: const [AppColors.gradient1, AppColors.gradient3],
                    ),
                  ),
                  Positioned(
                    right: size.width / 2 - 110.w,
                    top: 40,
                    child: FodaCircleButton(
                      height: 35,
                      onTap: () {
                        state.removeCartItem(food!);
                      },
                      icon: const Icon(
                        Icons.remove,
                        size: 15,
                      ),
                      color: AppColors.buttonColor,
                    ),
                  )
                ],
              ),
            ),
            Text('${food?.title}',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.txtLight.withOpacity(.6),
                      fontSize: 20,
                    )),
            RichText(
              text: TextSpan(
                text: '\$${food?.price}.00 ', //food price
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.orange,
                      fontSize: 17,
                    ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'x ${cartItem.quantity}', //food quantity
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.txtLight.withOpacity(.6),
                            fontSize: 15,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
