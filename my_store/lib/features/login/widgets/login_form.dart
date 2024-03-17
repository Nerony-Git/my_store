import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/login/controllers/login_controller.dart';
import 'package:my_store/features/password/screens/forget_password.dart';
import 'package:my_store/features/signup/screens/signup.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/validators/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: MySizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              validator: (value) => MyValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct),
                labelText: MyText.email,
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwInputFields,
            ),

            /// Password
            Obx(
              () => TextFormField(
                validator: (value) =>
                    MyValidator.validateEmptyText('Password', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: MyText.password,
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwInputFields / 2,
            ),

            /// Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(MyText.rememberMe),
                  ],
                ),

                /// Forget password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(MyText.forgetPassword),
                ),
              ],
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections,
            ),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    Get.to(() => controller.emailAndPasswordSignIn()),
                child: const Text(MyText.signIn),
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),

            /// Sign up button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(MyText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
