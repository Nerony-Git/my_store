import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_store/app.dart';
import 'package:my_store/firebase_options.dart';

Future<void> main() async {
  /// Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// Initialize GetX Local Storage
  await GetStorage.init();

  // TODO: Await Native Splash

  /// Initialized Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // TODO: Initialize Authentication

  runApp(const App());
}
