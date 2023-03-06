class UserModel {
  String id;
  String nome;
  String email;
  String phone;
  String password;
  String cpf;
  UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.phone,
    required this.password,
    required this.cpf,
  });
}

UserModel user = UserModel(
  id: "01",
  nome: "Silva",
  email: "silva@gmail.com",
  phone: "(99)98988-7654",
  password: "senhasenha",
  cpf: "090.123.456-89",
);
