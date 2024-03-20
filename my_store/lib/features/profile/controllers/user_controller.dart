import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/user/user_repository.dart';
import 'package:my_store/utils/models/user_model.dart';
import 'package:my_store/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  /// Save user details from any registration provider
  Future<void> saveUserDetails(UserCredential? userCredentials) async {
    try {
      /// Check is user details is not empty
      if (userCredentials != null) {
        // Convert display name to first name and last name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName ?? '');

        // Generate username based on diaplay name
        final username = UserModel.generateUsername(userCredentials.user!.displayName ?? '');

        // Map data to user model
        final user = UserModel(
          id: userCredentials.user!.uid, 
          firstName: nameParts[0], 
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '', 
          username: username, 
          email: userCredentials.user!.email ?? '', 
          phoneNumber: userCredentials.user!.phoneNumber ?? '', 
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        // Save generated user details
        await userRepository.saveUserRecord(user);

      }
    } catch (e) {
      SnackBars.warningSnackBar(
        title: 'Data not saved!', 
        message: 'Something went wrong while saving your information. yyou can re-save your data in your profile.',
      );
    }
  }
}