import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: InstagramBottomNavigation(),
    ));

class InstagramBottomNavigation extends StatefulWidget {
  const InstagramBottomNavigation({super.key});

  @override
  State<InstagramBottomNavigation> createState() =>
      _InstagramBottomNavigationState();
}

class _InstagramBottomNavigationState extends State<InstagramBottomNavigation> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Container(color: Colors.red),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
  ];

  final assetPath = 'assets/instagram_bottom_navigation_bar/assets/vectors/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
          color: Colors.white,
          highlightColor: Colors.white,
          hoverColor: Colors.white),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  '$assetPath${_selectedIndex == 0 ? 'home-bold.svg' : 'home-outline.svg'}'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  '$assetPath${_selectedIndex == 1 ? 'search-bold.svg' : 'search-outline.svg'}'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  '$assetPath${_selectedIndex == 2 ? 'add-square-bold.svg' : 'add-square-outline.svg'}'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                  '$assetPath${_selectedIndex == 3 ? 'video-play-bold.svg' : 'video-play-outline.svg'}'),
              label: ''),
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
