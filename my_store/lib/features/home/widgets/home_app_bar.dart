import 'package:flutter/material.dart';
import 'package:my_store/global/widgets/counter_icon.dart';
import 'package:my_store/global/widgets/custom_app_bar.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/texts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            MyText.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: MyColors.grey),
          ),
        ],
      ),
      actions: [
        CounterIcon(
          onPressed: () {},
          iconColor: MyColors.white,
        ),
      ],
    );
  }
}
