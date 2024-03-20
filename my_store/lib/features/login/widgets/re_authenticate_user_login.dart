import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/controllers/user_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/validators/validator.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: MyValidator.validateEmail,
                  decoration: const InputDecoration(prefixIcon:  Icon(Iconsax.direct), labelText: MyText.email,),
                ),
                const SizedBox(height: MySizes.spaceBtwInputFields,),

                /// Password
                Obx(
                  () => TextFormField(
                    obscureText: controller.hidePassword.value,
                    controller: controller.verifyPassword,
                    validator: (value) => MyValidator.validateEmptyText('Password', value),
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
                const SizedBox(height: MySizes.spaceBtwSections,),

                /// Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () => controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify'),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}