import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/data/provider/app_data.dart' as app_data;
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
// ignore: library_prefixes
import 'package:badges/badges.dart' as packageBadge;
import 'package:quitanda_virtual/app/ui/components/custom_category_tile.dart';
import 'package:quitanda_virtual/app/ui/components/product_item.dart';
import 'package:quitanda_virtual/app/ui/product_detail.dart';

class HomeUiTab extends StatefulWidget {
  const HomeUiTab({super.key});

  @override
  State<HomeUiTab> createState() => _HomeUiTabState();
}

class _HomeUiTabState extends State<HomeUiTab> {
  String selected = "Frutas";
  GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToCartAnimation;
  int _cartQuantifyItems = 0;

  void itemSelectedCartAnimations(GlobalKey gkImage) {
    runAddToCartAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  // print("Clicando...");
                },
                child: packageBadge.Badge(
                  badgeContent: Text(
                   _cartQuantifyItems.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 227, 192, 192),
                      fontSize: 12,
                    ),
                  ),
                  badgeStyle: packageBadge.BadgeStyle(
                    badgeColor: CustomColors.customContrastColor,
                  ),
                  child: AddToCartIcon(
                    
                    key: cartKey,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: CustomColors.customSwatchColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
          title: Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 30,
              ),
              children: [
                TextSpan(
                  text: "Green",
                  style: TextStyle(
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "grocer",
                  style: TextStyle(
                    color: CustomColors.customContrastColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: AddToCartAnimation(
          gkCart: cartKey,
          previewDuration: const Duration(milliseconds: 300),
          previewCurve: Curves.ease,
          receiveCreateAddToCardAnimationMethod: (p0) {
            runAddToCartAnimation = p0;
           
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    hintText: "Pesquise aqui...",
                    hintStyle: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: CustomColors.customContrastColor,
                      size: 21,
                    ),
                    isDense: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        60,
                      ),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 10,
                ),
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: app_data.categorias.length,
                  separatorBuilder: (_, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (_, index) => CustomCategoryTile(
                    category: app_data.categorias[index],
                    isSelected: app_data.categorias[index] == selected,
                    onPressed: () {
                      setState(
                        () {
                          selected = app_data.categorias[index];
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    16,
                    0,
                    16,
                    16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: app_data.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(item: app_data.items[index]),
                          ),
                        );
                      },
                      child: ProductItem(
                        item: app_data.items[index],
                        cartAnimationMethod: runAddToCartAnimation,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
