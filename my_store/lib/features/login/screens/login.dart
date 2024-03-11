import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/login/styles/login_padding.dart';
import 'package:my_store/features/login/widgets/login_form.dart';
import 'package:my_store/features/login/widgets/login_header.dart';
import 'package:my_store/global/widgets/form_divider.dart';
import 'package:my_store/global/widgets/social_footer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: LoginPadding.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo. Title and Sub Title
              const LoginHeader(),

              /// Form
              const LoginForm(),

              /// Divider
              FormDivider(
                dividerText: MyText.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Footer
              const SocialFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
