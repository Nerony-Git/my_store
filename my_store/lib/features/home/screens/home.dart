import 'package:flutter/material.dart';
import 'package:my_store/features/home/widgets/header_container.dart';
import 'package:my_store/features/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Home screen header
            HeaderContainer(
              child: Column(
                children: [
                  /// Home App Bar
                  HomeAppBar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
