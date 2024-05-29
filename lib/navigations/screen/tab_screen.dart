import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import 'categories_screen.dart';
import 'fevorites_screen.dart';
import 'main_drawer.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      const CategoriesScreen(),
      FavoritesScreen(favoriteMeals: widget.favoriteMeals)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('test'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.red,
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Category'),
        ],
      ),
      body: _pages[_selectedPageIndex],
    );
  }

  DefaultTabController buildDefaultTabControllerTop(BuildContext context) {
    return DefaultTabController(
        length: _pages.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('test'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Category',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorite',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: _pages,
          ),
        ));
  }
}
