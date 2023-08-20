import 'package:flutter/material.dart';
import 'package:foda/core/components/app_cart_nav_bar.dart';
import 'package:foda/core/components/app_nav_bar.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/services/get_it.dart';
import 'package:foda/services/navigation_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationService = locate<NavigationService>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: ValueListenableBuilder<bool>(
          valueListenable: navigationService.showNavBar,
          builder: (context, show, _) {
            if (!show) return const SizedBox.shrink();
            return Container(
              height: 100,
              padding: const EdgeInsets.only(top: AppTheme.elementSpacing / 3),
              color: AppColors.navBarColor,
              child: ValueListenableBuilder<NavBarType>(
                valueListenable: navigationService.showNavBarType,
                builder: (context, type, child) {
                  if (type == NavBarType.cart) {
                    return const CartBottomNavigationBar();
                  }
                  return AppBottomNavigationBar(navigationService: navigationService);
                },
              ),
            );
          },
        ),
        body: Container(
          color: AppColors.navBarColor,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            child: Navigator(
              key: navigationService.navigatorKey,
              onGenerateRoute: navigationService.onGeneratedRoute,
              observers: [TabNavigationObservers()],
              initialRoute: navigationService.determineHomePath(),
            ),
          ),
        ),
      ),
    );
  }
}
