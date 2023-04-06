import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/app/controller/login_controller.dart';

import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom,_app_name.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';
import 'package:quitanda_virtual/app/ui/register_ui.dart';

class LoginUi extends GetView<LoginController> {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomAppName(
                        textSize: 40,
                        greenTitleColor: Colors.white,
                      ),
                      // Text.rich(
                      DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 30,
                          child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText("Frutas"),
                              FadeAnimatedText("Legumes"),
                              FadeAnimatedText("Verduras"),
                              FadeAnimatedText("Laticínios"),
                              FadeAnimatedText("Cereais"),
                              FadeAnimatedText("Carnes"),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 32,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        45,
                      ),
                    ),
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          controller: controller.controllerEmail,
                          labelText: "Email",
                          iconPref: Icons.email,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return "Digite seu email!";
                            }
                            if (!email.isEmail) {
                              return "Digite um email válido!";
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          controller: controller.controllerPassword,
                          labelText: "Senha",
                          iconPref: Icons.lock,
                          isSecret: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return "Digite sua senha!";
                            }
                            if (password.length < 7) {
                              return "A senha deve possuir pelo menos 7 caracteres!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40,
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    18,
                                  ),
                                ),
                                textStyle: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      controller.sigin();
                                    },
                              child: controller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      "Entrar",
                                    ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Text(
                                  "Ou",
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(RegisterUi(),
                                  transition: Transition.rightToLeft);
                            },
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  18,
                                ),
                              ),
                              side: BorderSide(
                                width: 2,
                                color: CustomColors.customSwatchColor,
                              ),
                              textStyle: TextStyle(
                                fontSize: 18,
                                color: CustomColors.customSwatchColor,
                              ),
                            ),
                            child: const Text(
                              "Criar Conta",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
