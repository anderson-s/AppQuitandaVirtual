import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';
import 'package:quitanda_virtual/app/data/model/user_model.dart';

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
            CustomTextField(
              labelText: "Email",
              iconPref: Icons.email,
              initialValue: user.email,
              readyOnly: true,
            ),
            CustomTextField(
              labelText: "Nome",
              initialValue: user.nome,
              iconPref: Icons.person,
              readyOnly: true,
            ),
            CustomTextField(
              labelText: "Celular",
              formatters: [phoneFormatter],
              initialValue: user.phone,
              iconPref: Icons.phone,
              readyOnly: true,
            ),
            CustomTextField(
              labelText: "CPF",
              initialValue: user.cpf,
              iconPref: Icons.file_copy,
              formatters: [cpfFormatter],
              isSecret: true,
              readyOnly: true,
            ),
            SizedBox(
              height: 58,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    side: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text("Atualizar senha"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
