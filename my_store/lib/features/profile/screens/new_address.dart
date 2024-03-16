import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/sizes.dart';

class NewAddressScreen extends StatelessWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Phone Number'),
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street'),
                    )),
                    const SizedBox(
                      width: MySizes.spaceBtwInputFields,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code'),
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
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      ),
                    ),
                    const SizedBox(
                      width: MySizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: MySizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                const SizedBox(
                  height: MySizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
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
