import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';

class ProfileUiTab extends StatelessWidget {
  ProfileUiTab({super.key});

  final phoneFormatter = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  final cpfFormatter = MaskTextInputFormatter(
    mask: "###.###.###-##",
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Perfil do Usuário",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_outlined,
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(
            16,
            32,
            16,
            16,
          ),
          children: [
            const CustomTextField(
              labelText: "Email",
              iconPref: Icons.email,
            ),
            const CustomTextField(
              labelText: "Nome",
              iconPref: Icons.person,
            ),
            CustomTextField(
              labelText: "Celular",
              formatters: [phoneFormatter],
              iconPref: Icons.phone,
            ),
            CustomTextField(
              labelText: "CPF",
              iconPref: Icons.file_copy,
              formatters: [cpfFormatter],
              isSecret: true,
            ),
          ],
        ),
      ),
    );
  }
}
