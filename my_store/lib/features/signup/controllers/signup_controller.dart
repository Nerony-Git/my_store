import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/email/screens/verify_email.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/models/user_model.dart';
import 'package:my_store/utils/popups/fullscreen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// SignUp
  void signup() async {
    try {
      /// Star loading
      FullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        MyImages.docerAnimation,
      );

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        /// Remove loader
        FullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!signupFormKey.currentState!.validate()) {
        /// Remove loader
        FullScreenLoader.stopLoading();
        return;
      }
      ;

      /// Privacy policy check
      if (!privacyPolicy.value) {
        SnackBars.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create an account, you must have to read and accept the Privacy Policy and Terms of Use.');

        /// Remove loader
        FullScreenLoader.stopLoading();

        return;
      }

      /// Register user in the Firebase authentication and save user data in the database
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      /// Save authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show success message
      SnackBars.successSnackBar(
        title: 'Congratulations',
        message:
            'Your account has been created! Verify your email to continue.',
      );

      /// Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
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
