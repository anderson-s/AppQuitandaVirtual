import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/data/provider/app_data.dart';

class OrdersUiTab extends StatelessWidget {
  const OrdersUiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pedidos",
          ),
        ),
        body: ListView.separated(
          itemCount: orders.length,
          padding: const EdgeInsets.all(
            16,
          ),
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) => Text(orders[index].status),
        ),
      ),
    );
  }
}
