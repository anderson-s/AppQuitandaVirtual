import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/auth/widgets/custom_text_field.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: "(##) #####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Cadastro",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const CustomTextField(
                            icon: Icon(Icons.email),
                            labelText: "Email",
                            inputFormatters: []),
                        const CustomTextField(
                            icon: Icon(Icons.lock),
                            labelText: "Senha",
                            isSecret: true,
                            inputFormatters: []),
                        const CustomTextField(
                            icon: Icon(Icons.person),
                            labelText: "Nome",
                            inputFormatters: []),
                        CustomTextField(
                            icon: const Icon(Icons.phone),
                            labelText: "Telefone",
                            inputFormatters: [phoneFormatter]),
                        CustomTextField(
                          icon: const Icon(Icons.file_copy),
                          labelText: "CPF",
                          inputFormatters: [cpfFormatter],
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
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Cadastrar",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 5,
                top: 5,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
