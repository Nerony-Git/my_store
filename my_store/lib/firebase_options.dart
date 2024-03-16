// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDHh0GncGa0d303HGG4nT5-mv9oUzmR20k',
    appId: '1:826973291462:web:4da54162f7da592262e8c7',
    messagingSenderId: '826973291462',
    projectId: 'ecommerceapp-c967c',
    authDomain: 'ecommerceapp-c967c.firebaseapp.com',
    storageBucket: 'ecommerceapp-c967c.appspot.com',
    measurementId: 'G-F1QGNH2F1F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApWfYX0XTOVyUbbi8PH5OrWJ5RnX8Prq4',
    appId: '1:826973291462:android:33af57e5628f7c1b62e8c7',
    messagingSenderId: '826973291462',
    projectId: 'ecommerceapp-c967c',
    storageBucket: 'ecommerceapp-c967c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTGAMPgXjwH3R7Ik65FyxcGEO52NyXcCk',
    appId: '1:826973291462:ios:9e82d737521e978c62e8c7',
    messagingSenderId: '826973291462',
    projectId: 'ecommerceapp-c967c',
    storageBucket: 'ecommerceapp-c967c.appspot.com',
    iosBundleId: 'com.example.myStore',
  );
}
