import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/login_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quitana Virtual',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginUi(),
      debugShowCheckedModeBanner: false,
    );
  }
}
