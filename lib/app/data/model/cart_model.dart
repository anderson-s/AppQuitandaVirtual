import 'package:quitanda_virtual/app/data/model/item_model.dart';

class CartModel {
  ItemModel item;
  int quantity;
  CartModel({
    required this.item,
    required this.quantity,
  });
}
