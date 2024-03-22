import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/home/controllers/slider_controller.dart';
import 'package:my_store/global/widgets/circular_container.dart';
import 'package:my_store/global/widgets/imgs/rounded_image.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';

class PromotionSlider extends StatelessWidget {
  const PromotionSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SliderController());

    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
        ),
        const SizedBox(
          height: MySizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? MyColors.primary
                        : MyColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
