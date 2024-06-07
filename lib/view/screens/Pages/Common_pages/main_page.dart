import 'package:flutter/material.dart';
import 'package:ui/view/screens/Pages/Cart/ui/cart_page.dart';
import 'package:ui/view/screens/Pages/Common_pages/profile_page.dart';
import 'package:ui/view/screens/Pages/Favorite/ui/favorite_page.dart';
import 'package:ui/view/screens/Pages/Home/ui/hom_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
    const ProfilePage()
  ];

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white70,
            unselectedItemColor: Colors.grey.shade800,
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
                backgroundColor: Colors.black,
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.favorite_outlined),
                label: 'WishList',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]),
      ),
      body: pages[currentPage],
    );
  }
}
