import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';

class LoginUi extends StatelessWidget {
  const LoginUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Container(
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
                  children: const [
                    CustomTextField(
                      labelText: "Email",
                      icon: Icons.email,
                      obscureText: false,
                    ),
                    CustomTextField(
                      labelText: "Senha",
                      icon: Icons.lock,
                      obscureText: true,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
