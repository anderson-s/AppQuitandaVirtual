import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/cart_model.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/widgets/quantity_widget.dart';

class CustomCartItem extends StatelessWidget {
  final CartModel cart;
  CustomCartItem({super.key, required this.cart});
  final UtilServices utilServices = UtilServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(
        10,
        10,
        10,
        0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: ListTile(
        leading: Image.asset(
          cart.item.urlImage,
          height: 60,
          width: 60,
        ),
        title: Text(
          cart.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilServices.priceToCurrency(
            cart.totalPrice(),
          ),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: QuantifyWidget(
          value: cart.quantity,
          suffixText: cart.item.unit,
          result: (quantify) {},
        ),
      ),
    );
  }
}
