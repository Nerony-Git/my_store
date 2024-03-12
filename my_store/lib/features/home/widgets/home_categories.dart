import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/vertical_categories.dart';
import 'package:my_store/utils/constants/images.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalCategories(
            img: MyImages.clothIcon,
            title: 'Cloth',
            onTap: () {},
          );
        },
      ),
    );
  }
}
