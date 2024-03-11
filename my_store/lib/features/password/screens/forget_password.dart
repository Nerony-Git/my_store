import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/password/screens/reset_password.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                labelText: MyText.email,
                prefixIcon: Icon(Iconsax.direct),
              ),
            ),
            const SizedBox(
              height: MySizes.spaceBtwSections,
            ),

            /// Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(() => const ResetPassword()),
                child: const Text(MyText.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
