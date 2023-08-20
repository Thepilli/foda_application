import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foda/core/components/base_state.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/models/food.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_page.dart';
import 'package:foda/repositories/cart_repository.dart';
import 'package:foda/repositories/food_repository.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/get_it.dart';
import 'package:foda/services/navigation_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class OverviewState extends BaseState {
  final navigationService = locate<NavigationService>();
  final userRepository = locate<UserRepository>();
  final foodRepository = locate<FoodRepository>();
  final cartRepository = locate<CartRepository>();

  PageController pageController = PageController();

  OverviewState() {
    foodRepository.getFoodItems();
    cartRepository.getCart(userRepository.currentUserUID!);
    navigationService.currentIndexNotifier.addListener(_currentIndexListener);
  }

  void animateToPage(int page) {
    pageController.animateToPage(page, duration: AppTheme.animationDuration * 2, curve: Curves.decelerate);
  }

  void _currentIndexListener() {
    animateToPage(navigationService.currentIndexNotifier.value);
  }

  void addToCart(Food food) {
    cartRepository.addOrRemoveFoodFromCart(userRepository.currentUserUID!, food);
  }

  void addToFavorite(Food food) {
    userRepository.addFoodToFavorite(userRepository.currentUserUID!, food);
  }

  Future<void> openCartView(BuildContext context) async {
    await showMaterialModalBottomSheet(
      context: context,
      enableDrag: true,
      useRootNavigator: true,
      elevation: 10,
      builder: (_) => SizedBox(height: MediaQuery.of(context).size.height * 0.90.h, child: const CheckoutPage()),
    );
  }
}
