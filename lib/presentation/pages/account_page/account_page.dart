// ignore_for_file: use_build_context_synchronously

import 'package:flutter/widgets.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/constants/route_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_page.dart';
import 'package:foda/repositories/user_repository.dart';
import 'package:foda/services/get_it.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Center(
      child: FodaButton(
        label: 'Logout',
        width: AppTheme.size(context).width * .8,
        gradientColors: const [AppColors.gradient1, AppColors.gradient2],
        onTap: () async {
          await locate<UserRepository>().logout();
          Navigator.of(context).pushNamedAndRemoveUntil(
            authPath,
            (route) => false,
            arguments: AuthenticationViewState.signIn,
          );
        },
      ),
    ));
  }
}
