import 'package:flutter/material.dart';
import 'package:foda/core/constants/icon_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/services/navigation_service.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required this.navigationService,
  }) : super(key: key);

  final NavigationService navigationService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: navigationService.currentIndexNotifier,
        builder: (context, index, _) {
          return BottomNavigationBar(
            currentIndex: index,
            onTap: (index) {
              navigationService.updateIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(IconPath.home),
                activeIcon: Image.asset(IconPath.home, color: AppColors.orange),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(IconPath.favourite),
                activeIcon: Image.asset(IconPath.favourite, color: AppColors.orange),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(IconPath.search),
                activeIcon: Image.asset(IconPath.search, color: AppColors.orange),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(IconPath.account),
                activeIcon: Image.asset(IconPath.account, color: AppColors.orange),
                label: "",
              ),
            ],
            elevation: 0,
            selectedFontSize: 11,
            unselectedFontSize: 11,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
            selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
            showSelectedLabels: true,
            showUnselectedLabels: true,
          );
        });
  }
}
