import 'package:flutter/material.dart';
import 'package:foda/core/components/app_amaoba_paint.dart';
import 'package:foda/core/components/app_scaffold.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/foda_text_field.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/suffix_button_forget.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/auth_header.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/suffix_icon_button.dart';

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
                  return Center(
                    child: Column(
                      children: [
                        JBox(height: size.height * .35),
                        const AuthHeader(header: "Sign up"),
                        const JBox(height: AppTheme.elementSpacing),
                        FodaButton(
                          width: size.width * .7,
                          gradientColors: const [AppColors.gradient1, AppColors.gradient2],
                          label: 'Sign up with  Google',
                          onTap: () {},
                          prefixIcon: const Icon(
                            Icons.mail,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const JBox(height: AppTheme.elementSpacing / 2),
                        Text(
                          'Or with Email',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.txtLight.withOpacity(.6),
                                fontSize: 20,
                              ),
                        ),
                        const JBox(height: AppTheme.elementSpacing / 2),
                        FodaTextField(
                          size: size,
                          label: 'Username',
                          suffixIcon: SuffixIconButton(
                            icondata: Icons.question_mark,
                            onPressed: () {},
                          ),
                        ),
                        const JBox(height: AppTheme.elementSpacing / 2),
                        FodaTextField(
                          size: size,
                          label: 'Email',
                          suffixIcon: SuffixIconButton(
                            icondata: Icons.question_mark,
                            onPressed: () {},
                          ),
                        ),
                        const JBox(height: AppTheme.elementSpacing / 2),
                        FodaTextField(
                          size: size,
                          label: 'Password',
                          isObscured: true,
                          suffixIcon: SuffixIconButton(
                            icondata: Icons.question_mark,
                            onPressed: () {},
                          ),
                        ),
                        const JBox(height: AppTheme.elementSpacing / 2),
                        FodaButton(
                          width: size.width * .9,
                          label: 'Sign up',
                          onTap: () {},
                          gradientColors: const [AppColors.gradient1, AppColors.gradient2],
                        )
                      ],
                    ),
                  );
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

class ComeBackView extends StatelessWidget {
  const ComeBackView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          JBox(height: size.height * .2),
          const CircleAvatar(
            foregroundImage: AssetImage(ImagePath.avatar),
            radius: 50,
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          Text('Welcome back', textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge),
          const JBox(height: AppTheme.elementSpacing / 2),
          const AuthHeader(header: "Jiri"),
          const JBox(height: AppTheme.elementSpacing),
          FodaTextField(
            isObscured: true,
            size: size,
            label: 'Password',
            suffixIcon: SuffixIconButton(
              icondata: Icons.question_mark,
              onPressed: () {},
            ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaButton(
            label: 'Sign In',
            onTap: () {},
            width: size.width * .9,
            gradientColors: const [AppColors.gradient1, AppColors.gradient2],
          )
        ],
      ),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          JBox(height: size.height * .35),
          const AuthHeader(header: "Sign In"),
          const JBox(height: AppTheme.elementSpacing),
          FodaButton(
            width: size.width * .7,
            gradientColors: const [AppColors.gradient1, AppColors.gradient2],
            label: 'Sign in with  Google',
            onTap: () {},
            prefixIcon: const Icon(
              Icons.mail,
              color: AppColors.whiteColor,
            ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          Text(
            'Or with Email',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.txtLight.withOpacity(.6),
                  fontSize: 20,
                ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaTextField(size: size, label: 'Email'),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaTextField(
            size: size,
            label: 'Password',
            isObscured: true,
            suffixIcon: TextFieldForget(
              onPressed: () {},
            ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaButton(
            width: size.width * .9,
            label: 'Sign In',
            onTap: () {},
            gradientColors: const [AppColors.gradient1, AppColors.gradient2],
          )
        ],
      ),
    );
  }
}
