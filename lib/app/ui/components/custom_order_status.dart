import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';

class CustomOrderStatus extends StatelessWidget {
  final String status;
  final bool isOverduo;

  final Map<String, int> allStatus = <String, int>{
    "pending_payment": 0,
    "refunded": 1,
    "paid": 2,
    "praparing_purchase": 3,
    "shipping": 4,
    "delivered": 5,
  };

  int get currentStatus => allStatus[status]!;

  CustomOrderStatus({super.key, required this.status, required this.isOverduo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(
          isActive: true,
          title: "Pedido confirmado",
        ),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: "Pix estornado",
            backgroundColor: Colors.orange,
          )
        ] else if (isOverduo) ...[
          const _StatusDot(
            isActive: true,
            title: "Pagamento Pix Vencido",
            backgroundColor: Colors.red,
          )
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 3,
      ),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? backgroundColor;

  const _StatusDot(
      {required this.isActive, required this.title, this.backgroundColor});

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
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
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
