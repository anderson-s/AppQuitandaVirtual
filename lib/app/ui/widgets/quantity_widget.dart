import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom_quantify.dart';

class QuantifyWidget extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quantify) result;
  const QuantifyWidget(
      {super.key,
      required this.value,
      required this.suffixText,
      required this.result});

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
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomQuantify(
            icon: Icons.remove,
            color: Colors.grey,
            function: () {
              if (value == 1) {
                return;
              }
              int resultCount = value - 1;
              result(resultCount);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(
              "$value$suffixText",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomQuantify(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            function: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}
