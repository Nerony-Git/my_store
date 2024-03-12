import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/home/screens/home.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
}
