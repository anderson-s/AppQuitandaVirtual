import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;

  sigin() {
   
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      Future.delayed(
        const Duration(seconds: 3),
        () {
          isLoading.value = false;
          Get.offAllNamed(AppRoutes.BASE_UI);
        },
      );
    }
  }
}
