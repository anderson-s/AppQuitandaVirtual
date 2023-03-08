import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';

class CustomOrderStatus extends StatelessWidget {
  final String status;
  final bool isOverduo;
  const CustomOrderStatus(
      {super.key, required this.status, required this.isOverduo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _StatusDot(
          isActive: isOverduo,
          title: "Teste de pagamento",
        ),
        const _StatusDot(
          isActive: false,
          title: "Pagamento efetuado",
        ),
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;

  const _StatusDot({required this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title,
          ),
        ),
      ],
    );
  }
}
