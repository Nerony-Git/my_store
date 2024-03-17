import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/global/widgets/loaders/animation_loader.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/helpers/helper_functions.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        child: Container(
          color: HelperFunctions.isDarkMode(Get.context!)
              ? MyColors.dark
              : MyColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              AnimationLoader(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the current open loading dialog.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
