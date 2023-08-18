import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/foda_text_field.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/suffix_button_forget.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/auth_header.dart';

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
