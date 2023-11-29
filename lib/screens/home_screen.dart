import 'package:flutter/material.dart';
import 'package:my_store/screens/categories/categories_screen.dart';
import 'package:my_store/screens/favourites/favourites_screen.dart';
import 'package:my_store/screens/products/products_screen.dart';
import 'package:my_store/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = const [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),

      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.black,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _pageController.jumpToPage(index);
            setState(() {});
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              label: 'products',
                icon: Icon(Icons.shopping_bag_outlined),
            ),
            BottomNavigationBarItem(
              label: 'categories',
              icon: Icon(Icons.category_outlined),
            ),
            BottomNavigationBarItem(
              label: 'favourites',
              icon: Icon(Icons.favorite_outline),
            ),
            BottomNavigationBarItem(
              label: 'Hala',
              icon: Icon(Icons.person_2_outlined),
            ),
          ],
        ),
      ),

    );
  }
}
