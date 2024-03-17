import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/app.dart';
import 'package:my_store/data/repositories/authentication/authentication_repository.dart';
import 'package:my_store/firebase_options.dart';

Future<void> main() async {
  /// Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// Initialize GetX Local Storage
  await GetStorage.init();

  /// Await Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Initialized Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    /// Initialize Authentication
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  /// Load all material design, themes, localizations and bindings.
  runApp(const App());
}
