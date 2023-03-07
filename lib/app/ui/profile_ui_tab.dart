import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/app/ui/components/custom_textfield.dart';
import 'package:quitanda_virtual/app/data/model/user_model.dart';

class ProfileUiTab extends StatefulWidget {
  const ProfileUiTab({super.key});

  @override
  State<ProfileUiTab> createState() => _ProfileUiTabState();
}

class _ProfileUiTabState extends State<ProfileUiTab> {
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
                onPressed: () {
                  updatePasswordDialog();
                },
                child: const Text("Atualizar senha"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  updatePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                      ),
                      child: Text(
                        "Atualização de senha",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const CustomTextField(
                      labelText: "Senha atual",
                      isSecret: true,
                      iconPref: Icons.lock,
                    ),
                    const CustomTextField(
                      labelText: "Nova atual",
                      isSecret: true,
                      iconPref: Icons.lock_outline,
                    ),
                    const CustomTextField(
                      labelText: "Confirmar nova senha",
                      isSecret: true,
                      iconPref: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Atualizar",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_outlined,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
