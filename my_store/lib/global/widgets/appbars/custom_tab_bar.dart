import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/device/devices.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    
    return Material(
      color: dark ? MyColors.black : MyColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: MyColors.primary,
        unselectedLabelColor: MyColors.darkGrey,
        labelColor: dark ? MyColors.white : MyColors.primary,
        tabs: tabs,
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(MyDevices.getAppBarHeight());
}
