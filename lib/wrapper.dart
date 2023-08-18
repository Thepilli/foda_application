import 'package:flutter/material.dart';
import 'package:foda/core/constants/route_path.dart';
import 'package:foda/services/navigation_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const navigationService = NavigationService;
    return Scaffold(
      body: Navigator(
          key: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationService.instance.onGeneratedRoute,
          initialRoute: welcomePath),
    );
  }
}
