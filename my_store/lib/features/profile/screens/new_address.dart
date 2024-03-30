import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/controllers/address_controller.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/validators/validator.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      /// Appbar
      appBar: const CustomAppBar(
        title: Text('Add New Address'),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      MyValidator.validateEmptyText('Name', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => MyValidator.validatePhoneNumber(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: controller.street,
                      validator: (value) =>
                          MyValidator.validateEmptyText('Street', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.building_31),
                        labelText: 'Street',
                      ),
                    )),
                    const SizedBox(
                      width: MySizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: controller.postalCode,
                      validator: (value) =>
                          MyValidator.validateEmptyText('Postal Code', value),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.code),
                        labelText: 'Postal Code',
                      ),
                    )),
                  ],
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            MyValidator.validateEmptyText('City', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: MySizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.county,
                        validator: (value) =>
                            MyValidator.validateEmptyText('County', value),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'County',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      MyValidator.validateEmptyText('Country', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(
                  height: MySizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress(),
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
