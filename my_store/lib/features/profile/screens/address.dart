import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/screens/new_address.dart';
import 'package:my_store/features/profile/widgets/address_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Add new address button
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primary,
        onPressed: () => Get.to(() => const NewAddressScreen()),
        child: const Icon(Iconsax.add, color: MyColors.white,),
      ),

      /// Appbar
      appBar: CustomAppBar(title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),
      
      /// Body
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MySizes.defaultSpace),
          child: Column(
            children: [
              AddressCard(selectedAddress: true),
              AddressCard(selectedAddress: false),
              AddressCard(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}