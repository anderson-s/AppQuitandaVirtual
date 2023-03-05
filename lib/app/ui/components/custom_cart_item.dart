import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/cart_model.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
import 'package:quitanda_virtual/app/ui/widgets/quantity_widget.dart';

class CustomCartItem extends StatefulWidget {
  final CartModel cart;
  final Function(CartModel) remove;
  const CustomCartItem({super.key, required this.cart, required this.remove});

  @override
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
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
          widget.cart.item.urlImage,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cart.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilServices.priceToCurrency(
            widget.cart.totalPrice(),
          ),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: QuantifyWidget(
          value: widget.cart.quantity,
          suffixText: widget.cart.item.unit,
          isRemovable: true,
          result: (quantify) {
            setState(
              () {
                widget.cart.quantity = quantify;
                if (quantify == 0) {
                  widget.remove(widget.cart);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
