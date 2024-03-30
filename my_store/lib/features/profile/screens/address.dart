import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/controllers/address_controller.dart';
import 'package:my_store/features/profile/screens/new_address.dart';
import 'package:my_store/features/profile/widgets/address_card.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/cloud_functions.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      /// Add new address button
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.primary,
        onPressed: () => Get.to(() => const NewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: MyColors.white,
        ),
      ),

      /// Appbar
      appBar: const CustomAppBar(
        title: Text(
          'Addresses',
        ),
        showBackArrow: true,
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MySizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                // Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Handle loader, no record, or error message
                  final widget = CloudFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                  );
                  if (widget != null) return widget;

                  /// Record found
                  final addresses = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: addresses.length,
                    itemBuilder: (_, index) => AddressCard(
                      address: addresses[index],
                      onTap: () => controller.selectAddress(addresses[index]),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
