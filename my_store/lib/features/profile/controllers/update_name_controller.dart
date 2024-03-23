import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/profile/controllers/user_controller.dart';
import 'package:my_store/features/profile/screens/profile.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/fullscreen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Initialize user data
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user data
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// Update user name
  Future<void> updateUserName() async {
    try {
      /// Start Loading
      FullScreenLoader.openLoadingDialog(
          'We are updating your information...', MyImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      /// Update the Rx user values
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show success message
      SnackBars.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated.',
      );

      /// Move to the profile screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    }
  }
}
