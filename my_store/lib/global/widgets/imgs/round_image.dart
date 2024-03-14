import 'package:flutter/material.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class RoundImage extends StatelessWidget {
  const RoundImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.img,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = MySizes.sm,
  });

  final BoxFit? fit;
  final String img;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (HelperFunctions.isDarkMode(context)
                ? MyColors.black
                : MyColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(img)
                : AssetImage(img) as ImageProvider,
            color: overlayColor),
      ),
    );
  }
}
