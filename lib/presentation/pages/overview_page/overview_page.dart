import 'package:flutter/widgets.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/account_page/account_page.dart';
import 'package:foda/presentation/pages/home_page/home_page.dart';
import 'package:foda/presentation/pages/overview_page/overview_state.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.scaffoldMiddle,
      body: PageView(
        controller: context.read<OverviewState>().pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomePage(),
          Container(),
          Container(),
          const AccountPage(),
        ],
      ),
    );
  }
}
