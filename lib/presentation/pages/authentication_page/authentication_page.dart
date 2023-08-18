import 'package:flutter/material.dart';
import 'package:foda/core/components/app_amaoba_paint.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/states/come_back.dart';
import 'package:foda/presentation/pages/authentication_page/states/sign_in.dart';
import 'package:foda/presentation/pages/authentication_page/states/sign_up.dart';

enum AuthenticationViewState { signIn, signUp, comeBack }

class AuthenticationPage extends StatelessWidget {
  final AuthenticationViewState viewState;

  const AuthenticationPage({super.key, required this.viewState});

  @override
  Widget build(BuildContext context) {
    final size = AppTheme.size(context);
    return AppScaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(left: -50, child: Transform.rotate(angle: 30, child: AmaobaPaint(color: AppColors.gradient2.withRed(60)))),
            if (viewState != AuthenticationViewState.comeBack)
              Positioned(
                top: -50,
                right: -100,
                child: Image.asset(
                  viewState == AuthenticationViewState.signUp ? ImagePath.fries : ImagePath.salad,
                  height: 300,
                ),
              ),
            Builder(
              builder: (context) {
                if (viewState == AuthenticationViewState.signUp) {
                  return SignUpView(size: size);
                }
                if (viewState == AuthenticationViewState.signIn) {
                  return SignInView(size: size);
                } else {
                  return ComeBackView(size: size);
                }
              },
            )
          ],
        ),
      ),
    ));
  }
}



///