import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom_quantify.dart';

class QuantifyWidget extends StatelessWidget {
  const QuantifyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          50,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          CustomQuantify(
            icon: Icons.remove,
            color: Colors.green,
            function: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              "1kg",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomQuantify(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            function: () {},
          ),
        ],
      ),
    );
  }
}
