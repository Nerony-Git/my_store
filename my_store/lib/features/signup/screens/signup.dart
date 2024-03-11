import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/signup/widgets/signup_form.dart';
import 'package:my_store/global/widgets/form_divider.dart';
import 'package:my_store/global/widgets/social_footer.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(MyText.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: MySizes.spaceBtwSections),

              /// Form
              const SignupForm(),

              /// Divider
              FormDivider(
                dividerText: MyText.orSignInWith.capitalize!,
              ),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),

              /// Social Footer
              const SocialFooter(),
              const SizedBox(
                height: MySizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
