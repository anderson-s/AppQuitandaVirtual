import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/cart_model.dart';
import 'package:quitanda_virtual/app/data/provider/app_data.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/components/custom_cart_item.dart';

class CartUiTab extends StatefulWidget {
  const CartUiTab({super.key});

  @override
  State<CartUiTab> createState() => _CartUiTabState();
}

class _CartUiTabState extends State<CartUiTab> {
  final UtilServices utilServices = UtilServices();

  void removeItemFromCart(CartModel cartModel) {
    setState(() {
      itemsCart.remove(cartModel);
    });
  }

  double cartPrice() {
    double priceTotal = 0;
    for (var item in itemsCart) {
      priceTotal += item.totalPrice();
    }
    return priceTotal;
  }

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
                  return CustomCartItem(
                    cart: itemsCart[index],
                    remove: removeItemFromCart,
                  );
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
                    utilServices.priceToCurrency(cartPrice()),
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
                      onPressed: () {
                        showOrderConfimation();
                      },
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

  Future<bool?> showOrderConfimation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("Confirmação"),
          content: const Text("Deseja realmente concluir o pedido?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                "Não",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                "Sim",
              ),
            ),
          ],
        );
      },
    );
  }
}
