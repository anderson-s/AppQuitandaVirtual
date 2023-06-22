import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/order_model.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  const PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Pagamento com Pix",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                // QrImage(
                //   data: DateTime.now().millisecondsSinceEpoch.toString(),
                //   version: QrVersions.auto,
                //   size: 200.0,
                // ),
                Text(
                  "Vencimento: ${UtilServices().formatDateTime(order.overdueDateTime)}",
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  "Vencimento: ${UtilServices().priceToCurrency(order.total)}",
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy, size: 15),
                  label: const Text(
                    "Copiar código Pix",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
