import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                        fontSize: 40,
                      ),
                      children: [
                        const TextSpan(
                          text: "Green",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "grocer",
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CustomTextField(
                    labelText: "Email",
                    iconPref: Icons.email,
                  ),
                  const CustomTextField(
                    labelText: "Senha",
                    iconPref: Icons.lock,
                    isSecret: true,
                  ),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
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
                      onPressed: () {},
                      child: const Text(
                        "Entrar",
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
                      onPressed: () {},
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
            )
          ],
        ),
      ),
    );
  }
}
