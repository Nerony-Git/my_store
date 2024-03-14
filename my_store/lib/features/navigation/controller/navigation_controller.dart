import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/features/home/screens/home.dart';
import 'package:my_store/features/store/screens/store.dart';
import 'package:my_store/features/wishlist/screens/wishlist.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const WishlistScreen(),
    Container(
      color: Colors.blue,
    ),
  ];
}
