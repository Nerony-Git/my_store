import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/onboarding/controllers/onboarding_controller.dart';
import 'package:my_store/features/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:my_store/features/onboarding/widgets/onboarding_next_button.dart';
import 'package:my_store/features/onboarding/widgets/onboarding_page.dart';
import 'package:my_store/features/onboarding/widgets/onboarding_skip.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/texts.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                img: MyImages.onBoardingImage1,
                title: MyText.onBoardingTitle1,
                subTitle: MyText.onBoardingSubTitle1,
              ),
              OnboardingPage(
                img: MyImages.onBoardingImage2,
                title: MyText.onBoardingTitle2,
                subTitle: MyText.onBoardingSubTitle2,
              ),
              OnboardingPage(
                img: MyImages.onBoardingImage3,
                title: MyText.onBoardingTitle3,
                subTitle: MyText.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnboardingSkip(),

          /// Dot Navigation
          const OnboardingDotNavigation(),

          /// Circular Button
          const OnboardingNextButton(),
        ],
      ),
    );
  }
}
