import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/profile/controllers/user_controller.dart';
import 'package:my_store/features/store/widgets/cart_icon.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/texts.dart';
import 'package:my_store/utils/helpers/shimmer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyText.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: MyColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer while user profile is loading
              return const ShimmerEffect(
                width: 80,
                height: 15,
              );
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: MyColors.white),
              );
            }
          }),
        ],
      ),
      actions: const [
        CartIcon(
          iconColor: MyColors.white,
        ),
      ],
    );
  }
}
