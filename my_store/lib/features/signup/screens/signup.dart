import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/form_divider.dart';
import 'package:my_store/global/widgets/social_footer.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

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
              Form(
                child: Column(
                  children: [
                    /// First & Last Name
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: MyText.firstName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: MySizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: MyText.lastName,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields),

                    /// Username
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: MyText.username,
                        prefixIcon: Icon(Iconsax.user_edit),
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields),

                    /// Email
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: MyText.email,
                        prefixIcon: Icon(Iconsax.direct),
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields),

                    /// Phone number
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: MyText.phoneNo,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwInputFields),

                    /// Password
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: MyText.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: MySizes.spaceBtwSections),

                    /// T&Cs checkbox
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ),
                        const SizedBox(width: MySizes.spaceBtwItems),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '${MyText.iAgreeTo} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${MyText.privacyPolicy} ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? MyColors.white
                                            : MyColors.primary,
                                        decoration: TextDecoration.underline,
                                        decorationColor: dark
                                            ? MyColors.white
                                            : MyColors.primary,
                                      )),
                              TextSpan(
                                  text: '${MyText.and} ',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                text: '${MyText.termsOfUse}.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: dark
                                          ? MyColors.white
                                          : MyColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? MyColors.white
                                          : MyColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: MySizes.spaceBtwSections),

                    /// Sign up button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(MyText.createAccount),
                      ),
                    ),
                    const SizedBox(
                      height: MySizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

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
