import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/store/controllers/category_controller.dart';
import 'package:my_store/features/store/screens/sub_category.dart';
import 'package:my_store/global/widgets/shimmers/category_shimmer.dart';
import 'package:my_store/global/widgets/vertical_categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      // Check if categories is loading
      if (controller.isLoading.value) {
        return const CategoryShimmer();
      }

      // Check id featured category is empty
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return VerticalCategories(
              img: category.img,
              title: category.name,
              onTap: () => Get.to(() => const SubCategoryScreen()),
            );
          },
        ),
      );
    });
  }
}
