import 'package:flutter/material.dart';
import 'package:foda/core/components/foda_button.dart';
import 'package:foda/core/components/foda_text_field.dart';
import 'package:foda/core/components/j_box.dart';
import 'package:foda/core/constants/image_path.dart';
import 'package:foda/core/themes/app_theme.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/auth_header.dart';
import 'package:foda/presentation/pages/authentication_page/widgets/suffix_icon_button.dart';

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
