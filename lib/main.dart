import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/app/routes/app_pages.dart';
import 'package:quitanda_virtual/app/ui/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initialPage,
      title: 'Greengrocer',
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(
          190,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
