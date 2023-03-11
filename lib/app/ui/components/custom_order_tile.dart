import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/cart_model.dart';
import 'package:quitanda_virtual/app/data/model/order_model.dart';
import 'package:quitanda_virtual/app/ui/components/custom_order_status.dart';
import 'package:quitanda_virtual/app/ui/widgets/payment_dialog.dart';

class CustomOrderTile extends StatelessWidget {
  final OrderModel order;
  const CustomOrderTile({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: order.status == "pending_payment",
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pedido ${order.id}",
              ),
              Text(
                UtilServices().formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            16,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items
                            .map(
                              (orderItem) => _OrderItemWidget(
                                orderItem: orderItem,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: CustomOrderStatus(
                      isOverduo: order.overdueDateTime.isBefore(DateTime.now()),
                      // isOverduo: false,
                      status: order.status,
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: UtilServices().priceToCurrency(order.total),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: order.status == "pending_payment",
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(order: order);
                    },
                  );
                },
                icon: Image.asset(
                  "assets/images/pix.png",
                  height: 18,
                ),
                label: const Text(
                  "Ver QR Code Pix",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartModel orderItem;

  const _OrderItemWidget({
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        children: [
          Text(
            "${orderItem.quantity} ${orderItem.item.unit}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
            ),
          ),
          Text(
            UtilServices().priceToCurrency(
              orderItem.totalPrice(),
            ),
          )
        ],
      ),
    );
  }
}
