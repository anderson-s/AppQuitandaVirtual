import 'package:get/get.dart';
import 'package:quitanda_virtual/app/routes/app_routes.dart';
import 'package:quitanda_virtual/app/ui/base_ui.dart';
import 'package:quitanda_virtual/app/ui/login_ui.dart';
import 'package:quitanda_virtual/app/ui/register_ui.dart';
import 'package:quitanda_virtual/app/ui/splash_screen.dart';

abstract class AppPages {
  static const initialPage = AppRoutes.SPLASH_SCREEN;
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN_UI,
      page: () => const LoginUi(),
    ),
    GetPage(
      name: AppRoutes.REGISTER_UI,
      page: () => RegisterUi(),
    ),
    GetPage(
      name: AppRoutes.BASE_UI,
      page: () => const BaseUi(),
    )
  ];
}
