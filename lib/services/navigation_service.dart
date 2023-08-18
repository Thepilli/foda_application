import 'package:flutter/material.dart';
import 'package:foda/core/constants/route_path.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_page.dart';
import 'package:foda/presentation/pages/onboarding_page/onboarding_page.dart';

class NavigationService {
  NavigationService._();
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._();
    return _instance!;
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route? onGeneratedRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case authPath:
        final state = settings.arguments as AuthenticationViewState;
        return navigateToMaterialPageRoute(settings, AuthenticationPage(viewState: state));
      case welcomePath:
        return navigateToMaterialPageRoute(settings, const OnboardingPage());
    }

    return null;
  }

  PageRoute navigateToMaterialPageRoute(RouteSettings settings, Widget page,
      {bool maintainState = true, bool fullscreenDialog = true}) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
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
