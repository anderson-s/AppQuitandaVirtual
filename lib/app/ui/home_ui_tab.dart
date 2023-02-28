import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/colors/custom_colors.dart';
// ignore: library_prefixes
import 'package:badges/badges.dart' as packageBadge;
import 'package:quitanda_virtual/app/ui/components/custom_category_tile.dart';

class HomeUiTab extends StatefulWidget {
  HomeUiTab({super.key});

  @override
  State<HomeUiTab> createState() => _HomeUiTabState();
}

class _HomeUiTabState extends State<HomeUiTab> {
  List<String> categorias = [
    "Frutas",
    "Legumes",
    "Verduras",
    "Cereais",
    "Laticinios",
    "Carnes",
    "Temperos",
    "Grãos",
  ];

  String selected = "Frutas";

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
                  badgeContent: const Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  badgeStyle: packageBadge.BadgeStyle(
                    badgeColor: CustomColors.customContrastColor,
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor,
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
        body: Column(
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
                itemCount: categorias.length,
                separatorBuilder: (_, index) => const SizedBox(
                  width: 10,
                ),
                itemBuilder: (_, index) => CustomCategoryTile(
                  category: categorias[index],
                  isSelected: categorias[index] == selected,
                  onPressed: () {
                    setState(() {
                      selected = categorias[index];
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
