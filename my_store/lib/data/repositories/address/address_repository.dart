import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';
import 'package:my_store/utils/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Function to fetch all user addresses
  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userID = AuthenticationRepository.instance.authUser!.uid;
      if (userID.isEmpty) {
        throw 'Unable to find user information. Try again if few minuted.';
      }

      final result = await _db
          .collection('Users')
          .doc(userID)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

  /// Function to update selected address
  Future<void> updateSelectedField(String addressID, bool selected) async {
    try {
      final userID = AuthenticationRepository.instance.authUser!.uid;
      if (userID.isEmpty) {
        throw 'Unable to find user information. Try again if few minuted.';
      }
      await _db
          .collection('Users')
          .doc(userID)
          .collection('Addresses')
          .doc(addressID)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection. Try again later.';
    }
  }

  /// Function to add new address
  Future<String> addNewAddress(AddressModel address) async {
    try {
      final userID = AuthenticationRepository.instance.authUser!.uid;
      if (userID.isEmpty) {
        throw 'Unable to find user information. Try again if few minuted.';
      }

      final currentAddress = await _db
          .collection('Users')
          .doc(userID)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving address information. Try again later';
    }
  }
}
