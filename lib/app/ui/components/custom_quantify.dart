import 'package:flutter/material.dart';

class CustomQuantify extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback function;
  const CustomQuantify({super.key, required this.icon, required this.color, required this.function});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(
          50,
        ),
        onTap: function,
        child: Container(
          height: 25,
          width: 25,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
