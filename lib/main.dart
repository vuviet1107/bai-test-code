import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:untitled/routes/app_pages.dart';

import 'constants/app_colors.dart';
import 'cv_screen/cv_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
