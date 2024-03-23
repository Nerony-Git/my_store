import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/bindings/general_bindings.dart';
import 'package:my_store/utils/constants/colors.dart';
import 'package:my_store/utils/routes/app_routes.dart';
import 'package:my_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const Scaffold(
        backgroundColor: MyColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
