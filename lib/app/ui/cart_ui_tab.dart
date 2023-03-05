import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/provider/app_data.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';

class CartUiTab extends StatelessWidget {
  CartUiTab({super.key});

  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: const Text(
            "Carrinho",
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: itemsCart.length,
                itemBuilder: (_, index) {
                  return Text(itemsCart[index].item.itemName);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    30,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Total geral",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    utilServices.priceToCurrency(50.05),
                    style: TextStyle(
                      fontSize: 23,
                      color: CustomColors.customSwatchColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.customSwatchColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Concluir pedido",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
