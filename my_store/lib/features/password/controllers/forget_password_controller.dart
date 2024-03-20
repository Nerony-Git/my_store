import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/features/password/screens/reset_password.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/popups/fullscreen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send reset password email
  sendPasswordResetEmail() async {
    try {
      /// Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', MyImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Send password reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show Success Screen
      SnackBars.successSnackBar(
        title: 'Email Sent', 
        message: 'A link to reset your password has been sent to your email.'.tr,
      );

      /// Redirect 
      Get.to(() => ResetPassword(email: email.text.trim()));
      
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

  /// Resend reser password email
  resendPasswordResetEmail( String email) async {
    try {
      /// Start Loading
      FullScreenLoader.openLoadingDialog(
          'Processing your request...', MyImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Send password reset email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show Success Screen
      SnackBars.successSnackBar(
        title: 'Email Sent', 
        message: 'A link to reset your password has been sent to your email.'.tr,
      );
      
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