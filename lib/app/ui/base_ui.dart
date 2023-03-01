import 'package:flutter/material.dart';
import 'package:quitanda_virtual/app/ui/home_ui_tab.dart';

class BaseUi extends StatefulWidget {
  const BaseUi({super.key});

  @override
  State<BaseUi> createState() => _BaseUiState();
}

class _BaseUiState extends State<BaseUi> {
  int indexPage = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const HomeUiTab(),
            Container(
              color: Colors.yellow,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.black,
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withAlpha(
            100,
          ),
          onTap: (value) {
            setState(
              () {
                indexPage = value;
                pageController.jumpToPage(value);
              },
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "Carrinho",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Perfil",
            ),
          ],
        ),
      ),
    );
  }
}
