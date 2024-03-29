import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_store/utils/exceptions/firebase_exceptions.dart';
import 'package:my_store/utils/exceptions/platform_exceptions.dart';

class CloudFunctions {
  /// Helper function to check the state of a single database record.
  ///
  /// Return a widget based on the state of the snapshot.
  /// If data is still loading, it returns a circular progress indicator.
  /// If no data is found, it returns a generic "No Data Found" message.
  /// If an error occurs, it returns a generic error message.
  /// Else it returns null
  static Widget? checkSingleRecordState<M>(AsyncSnapshot<M> snapshot) {
    // // Create a shimmer effect loader
    // const loader = VerticalProductShimmer();

    // Check the state of the future builder snapshot
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Check if snapshot is null or empty
    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(
        child: Text('No Data Found'),
      );
    }

    // Check if snapshot has errors
    if (snapshot.hasError) {
      return const Center(
        child: Text('Something went wrong.'),
      );
    }

    return null;
  }

  /// Helper function to check the state of multiple database record.
  ///
  /// Return a widget based on the state of the snapshot.
  /// If data is still loading, it returns a circular progress indicator.
  /// If no data is found, it returns a generic "No Data Found" message or a custom nothing found widget if provided.
  /// If an error occurs, it returns a generic error message.
  /// Else it returns null
  static Widget? checkMultiRecordState<M>(
      {required AsyncSnapshot<List<M>> snapshot,
      Widget? loader,
      Widget? error,
      Widget? nothingFound}) {
    // // Create a shimmer effect loader
    // const loader = VerticalProductShimmer();

    // Check the state of the future builder snapshot
    if (snapshot.connectionState == ConnectionState.waiting) {
      if (loader != null) return loader;
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    // Check if snapshot is null or empty
    if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      if (nothingFound != null) return nothingFound;
      return const Center(
        child: Text('No Data Found'),
      );
    }

    // Check if snapshot has errors
    if (snapshot.hasError) {
      if (error != null) return error;
      return const Center(
        child: Text('Something went wrong.'),
      );
    }

    return null;
  }

  /// Function to create a reference with an initial file path and name and retrieve the download url
  static Future<String> getURLFromFilePathAndName(String path) async {
    try {
      if (path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw CustomFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw CustomPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong.';
    }
  }
}
