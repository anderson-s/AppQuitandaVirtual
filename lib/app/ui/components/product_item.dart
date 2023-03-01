import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/controller/services/utils_services.dart';
import 'package:quitanda_virtual/app/data/model/item_model.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';

class ProductItem extends StatelessWidget {
  final ItemModel item;
  const ProductItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 3,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    item.urlImage,
                  ),
                ),
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      UtilServices().priceToCurrency(item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    Text(
                      "/${item.unit}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    15,
                  ),
                  topRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
