import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/password/controllers/forget_password_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/validators/validator.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Text(
              MyText.forgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: MySizes.spaceBtwItems,
            ),
            Text(
              MyText.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections * 2,
            ),

            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                validator: MyValidator.validateEmail,
                controller: controller.email,
                decoration: const InputDecoration(
                  labelText: MyText.email,
                  prefixIcon: Icon(Iconsax.direct),
                ),
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections,
            ),

            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(MyText.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
