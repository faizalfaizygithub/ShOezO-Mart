import 'package:flutter/material.dart';
import 'package:ui/view/screens/Pages/Cart/ui/cart_page.dart';
import 'package:ui/view/screens/Pages/Category/ui/category_page.dart';
import 'package:ui/view/screens/Pages/Common_pages/profile_page.dart';
import 'package:ui/view/screens/Pages/Home/ui/hom_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const HomePage(),
    CatogeryPage(),
    CartPage(),
    ProfilePage()
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.grey,
          // selectedLabelStyle: subHeadingStyleBlue,
          selectedFontSize: 17,
          unselectedFontSize: 14,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: pages[currentPage],
    );
  }
}
