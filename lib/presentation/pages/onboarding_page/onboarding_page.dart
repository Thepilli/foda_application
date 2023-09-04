import 'package:flutter/material.dart';
import 'package:foda/core/components/app_amaoba_paint.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/core/components/app_oval_paint.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/constants/route_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = AppTheme.size(context);

    return AppScaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            const OvalPaint(),
            const AmaobaPaint(),
            Center(
              child: Column(
                children: [
                  Image.asset(ImagePath.bg, height: size.height * .45),
                  const JBox(height: AppTheme.elementSpacing),
                  Image.asset(ImagePath.logo),
                  SizedBox(
                      width: size.width * .7,
                      child: Text('Welcome to Food Delivery',
                          textAlign: TextAlign.center, style: Theme.of(context).textTheme.displayLarge)),
                  const JBox(height: AppTheme.elementSpacing / 2),
                  FodaButton(
                    gradientColors: const [AppColors.gradient1, AppColors.gradient2],
                    width: size.width * .7,
                    label: 'Sign Up',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        authPath,
                        arguments: AuthenticationViewState.signUp,
                      );
                    },
                  ),
                  const JBox(height: AppTheme.elementSpacing / 2),
                  FodaButton(
                    color: AppColors.gradient2,
                    width: size.width * .7,
                    label: 'Sign In',
                    onTap: () {
                      // AuthenticationService.instance.signUp('helloworld@gmail.com', '123123123').then((value) {
                      //   if (value != null) {
                      //     print(value.email);
                      //   }
                      // });

                      Navigator.of(context).pushNamed(
                        authPath,
                        arguments: AuthenticationViewState.signIn,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
