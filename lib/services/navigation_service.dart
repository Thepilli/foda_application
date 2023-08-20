// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:foda/core/constants/route_path.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_page.dart';
import 'package:foda/presentation/pages/cart_page/cart_page.dart';
import 'package:foda/presentation/pages/checkout_page/checkout_page.dart';
import 'package:foda/presentation/pages/onboarding_page/onboarding_page.dart';
import 'package:foda/presentation/pages/overview_page/overview_page.dart';
import 'package:foda/repositories/user_repository.dart';

import 'get_it.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  UserRepository userRepo = locate<UserRepository>();

  ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);
  ValueNotifier<bool> showNavBar = ValueNotifier<bool>(false);

  List<String> pathToCloseNavBar = [
    authPath,
    welcomePath,
  ];

  void setNavBar(bool value) {
    showNavBar.value = value;
    showNavBar.notifyListeners();
  }

  void updateIndex(int value) {
    currentIndexNotifier.value = value;
    if (value == currentIndexNotifier.value) return;
    currentIndexNotifier.notifyListeners();
  }

  String determineHomePath() {
    if (userRepo.currentUserUID != null) {
      return overviewPath;
    }
    return welcomePath;
  }

  Route? onGeneratedRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case authPath:
        final state = settings.arguments as AuthenticationViewState;
        return navigateToMaterialPageRoute(settings, AuthenticationPage(viewState: state));
      case welcomePath:
        return navigateToMaterialPageRoute(settings, const OnboardingPage());
      case overviewPath:
        return navigateToMaterialPageRoute(settings, const OverviewPage());
      case cartPath:
        return navigateToMaterialPageRoute(settings, const CartPage());
      case checkoutPath:
        return navigateToMaterialPageRoute(settings, const CheckoutPage());
    }

    return null;
  }

  PageRoute navigateToMaterialPageRoute(RouteSettings settings, Widget page,
      {bool maintainState = true, bool fullscreenDialog = false, bool allowSnapshotting = true}) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      allowSnapshotting: allowSnapshotting,
      settings: settings,
      transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // MaterialPageRoute _navigateToModelPageRoute(RouteSettings settings, Widget child,
  //     {bool maintainState = true, bool fullscreenDialog = false}) {
  //   return MaterialWithModalsPageRoute(
  //     settings: settings,
  //     maintainState: maintainState,
  //     fullscreenDialog: fullscreenDialog,
  //     builder: (_) => child,
  //   );
  // }
}

class TabNavigationObservers extends RouteObserver<PageRoute<dynamic>> {
  TabNavigationObservers();

  final navigationService = locate<NavigationService>();

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final containPreviousRoutePath = navigationService.pathToCloseNavBar.contains(previousRoute?.settings.name);

    if (containPreviousRoutePath) {
      navigationService.setNavBar(false);
    }

    if (!containPreviousRoutePath) {
      navigationService.setNavBar(true);
    }

    super.didPop(route!, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    final paths = navigationService.pathToCloseNavBar;
    final containRoutePath = paths.contains(route.settings.name);

    if (containRoutePath) {
      navigationService.setNavBar(false);
    } else {
      navigationService.setNavBar(true);
    }

    super.didPush(route, previousRoute);
  }
}
