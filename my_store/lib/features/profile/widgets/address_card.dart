import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_store/features/profile/controllers/address_controller.dart';
import 'package:my_store/global/widgets/containers/rounded_container.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:my_store/utils/models/address_model.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final dark = HelperFunctions.isDarkMode(context);

    return Obx(() {
      final selectedAddressID = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressID == address.id;
      return InkWell(
        onTap: onTap,
        child: RoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(MySizes.md),
          backgroundColor: selectedAddress
              ? MyColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? MyColors.primary
                  : MyColors.grey,
          margin: const EdgeInsets.only(bottom: MySizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? MyColors.light
                          : MyColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: MySizes.sm / 2,
                  ),
                  Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: MySizes.sm / 2,
                  ),
                  Text(
                    address.toString(),
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
