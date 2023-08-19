import 'package:flutter/material.dart';
import 'package:foda/core/components/base_state.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/get_it.dart';
import 'package:foda/services/navigation_service.dart';

class OverviewState extends BaseState {
  final navigationService = locate<NavigationService>();
  final userRepo = locate<UserRepository>();

  PageController pageController = PageController();

  OverviewState() {
    navigationService.currentIndexNotifier.addListener(_currentIndexListener);
  }

  void animateToPage(int page) {
    pageController.animateToPage(page, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  void _currentIndexListener() {
    animateToPage(navigationService.currentIndexNotifier.value);
  }
}
