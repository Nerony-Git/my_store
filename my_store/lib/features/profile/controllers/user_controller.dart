import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/features/login/screens/login.dart';
import 'package:my_store/features/login/widgets/re_authenticate_user_login.dart';
import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/constants/sizes.dart';
import 'package:my_store/utils/helpers/network_manager.dart';
import 'package:my_store/utils/models/user_model.dart';
import 'package:my_store/utils/popups/fullscreen_loader.dart';
import 'package:my_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  /// Save user details from any registration provider
  Future<void> saveUserDetails(UserCredential? userCredentials) async {
    try {
      // First update the Rx user data and check if user dat is already stored.
      await fetchUserData();
      // If no data found
      if (user.value.id.isEmpty) {
        /// Check is user details is not empty
        if (userCredentials != null) {
          // Convert display name to first name and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');

          // Generate username based on diaplay name
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map data to user model
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save generated user details
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      SnackBars.warningSnackBar(
        title: 'Data not saved!',
        message:
            'Something went wrong while saving your information. yyou can re-save your data in your profile.',
      );
    }
  }

  /// Fetch user data
  Future<void> fetchUserData() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserData();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Delete account warining pop up
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(MySizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: MySizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  /// Delete user account
  void deleteUserAccount() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing...', MyImages.docerAnimation);

      /// Re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Check user login provider
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          FullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          FullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
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

  /// Reauthenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      FullScreenLoader.openLoadingDialog(
          'Processing...', MyImages.docerAnimation);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!reAuthFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      FullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
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

  /// Uploade user profile image
  uploadUserProfilePicture() async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      // Check if image is selected
      if (img != null) {
        // Upload image
        imageUploading.value = true;
        final imageUrl =
            await userRepository.uploadImage('assets/img/profile/', img);

        // Update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        // Refresh profile picture
        user.value.profilePicture = imageUrl;
        user.refresh();
        // Display success message
        SnackBars.successSnackBar(
            title: 'Congratulations',
            message: 'Your profile picture has been updated!');
      }
    } catch (e) {
      /// Remove loader
      FullScreenLoader.stopLoading();

      /// Show some generic error to the user
      SnackBars.errorSnackBar(
        title: 'Oh Snap',
        message: e.toString(),
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
