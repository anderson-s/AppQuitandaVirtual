import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';

class RegisterUi extends StatelessWidget {
  const RegisterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.customSwatchColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Cadastro",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      const CustomTextField(
                        labelText: "Nome",
                        iconPref: Icons.person,
                      ),
                      const CustomTextField(
                        labelText: "Celular",
                        iconPref: Icons.phone,
                      ),
                      const CustomTextField(
                        labelText: "CPF",
                        iconPref: Icons.file_copy,
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
                            "Cadastrar Usuário",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
