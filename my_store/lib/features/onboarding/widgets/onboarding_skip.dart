import 'package:flutter/material.dart';
import 'package:my_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/device/devices.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MyDevices.getAppBarHeight(),
      right: MySizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnboardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
