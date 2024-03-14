import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/home/screens/home.dart';
import 'package:my_store/features/store/screens/store.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
