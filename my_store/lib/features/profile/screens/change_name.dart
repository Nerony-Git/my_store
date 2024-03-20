import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/controllers/update_name_controller.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/validators/validator.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      /// Appbar
      appBar: CustomAppBar(title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),

      /// Body
      body: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Use real name for easy verification. This na,e will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            /// Text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => MyValidator.validateEmptyText('First Name', value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.firstName, prefixIcon: Icon(Iconsax.user),),
                  ),
                  const SizedBox(height: MySizes.spaceBtwInputFields,),
                  TextFormField(
                    validator: (value) => MyValidator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(labelText: MyText.lastName, prefixIcon: Icon(Iconsax.user),),
                  ),
                ],
              )
            ),
            const SizedBox(height: MySizes.spaceBtwSections,),

            /// Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(), 
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}