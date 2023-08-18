import 'package:flutter/material.dart';
import 'package:foda/core/exceptions/route_excepions.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_page.dart';
import 'package:foda/presentation/pages/onboarding_page/onboarding_page.dart';

class AppRouter {
  static const String onboarding = 'onboarding';
  static const String authentication = 'authentication';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name;
    switch (routeName) {
      case authentication:
        final state = settings.arguments as AuthenticationViewState;
        return MaterialPageRoute(
          builder: (_) => AuthenticationPage(
            viewState: state,
          ),
        );
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        );

      default:
        debugPrint('Route not found!');
        throw const RouteException('Route not found!');
    }
  }
}
