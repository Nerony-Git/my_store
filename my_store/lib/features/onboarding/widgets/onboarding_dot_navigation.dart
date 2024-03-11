import 'package:flutter/material.dart';
import 'package:my_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/devices.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    final controller = OnboardingController.instance;

    return Positioned(
      bottom: MyDevices.getBottomNavigationBarHeight() + 25,
      left: MySizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? MyColors.light : MyColors.dark,
            dotHeight: 6),
      ),
    );
  }
}
