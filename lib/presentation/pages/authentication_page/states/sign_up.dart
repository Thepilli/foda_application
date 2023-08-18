import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/foda_text_field.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/authentication_state.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/auth_header.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/suffix_icon_button.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthenticationState>();
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
            controller: state.nameController,
            size: size,
            label: 'Username',
            suffixIcon: SuffixIconButton(
              icondata: Icons.question_mark,
              onPressed: () {},
            ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaTextField(
            controller: state.emailController,
            size: size,
            label: 'Email',
            suffixIcon: SuffixIconButton(
              icondata: Icons.question_mark,
              onPressed: () {},
            ),
          ),
          const JBox(height: AppTheme.elementSpacing / 2),
          FodaTextField(
            controller: state.passwordController,
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
            state: state.isLoading ? ButtonState.loading : ButtonState.idle,
            label: 'Sign up',
            onTap: state.registerUser,
            gradientColors: const [AppColors.gradient1, AppColors.gradient2],
          )
        ],
      ),
    );
  }
}
