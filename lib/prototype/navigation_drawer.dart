import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, home: NavigationDrawerF()));

class NavigationDrawerF extends StatelessWidget {
  const NavigationDrawerF({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Dev Azuma",
          style: TextStyle(fontSize: 17),
        ),
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _builderHeader(),
            _buildItem(
                icon: Icons.home_rounded,
                title: 'Home',
                onTap: () => Navigator.pop(context)),
            _buildItem(
                icon: Icons.notification_add_rounded,
                title: 'Notifications',
                onTap: () => Navigator.pop(context)),
                // onTap: () => Navigator.pushNamed(context, "Notification")),
            _buildItem(
                icon: Icons.person,
                title: 'Profile',
                onTap: () => Navigator.pop(context)),
                // onTap: () => Navigator.pushNamed(context, "Profile")),
            _buildItem(
                icon: Icons.settings,
                title: 'Setting',
                onTap: () => Navigator.pop(context)),
                // onTap: () => Navigator.pushNamed(context, "Setting")),
          ],
        ),
      ),
    );
  }

  _builderHeader() {
    return const DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.grey,
        // image: DecorationImage(
        //   image: AssetImage('assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
        //   fit: BoxFit.fill,
        // )
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
                'assets/instagram_bottom_navigation_bar/assets/images/profile.png'),
            radius: 50,
          ),
          Spacer(),
          Text(
            'Azman Barraquias',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  _buildItem(
      {required IconData icon,
      required String title,
      required GestureTapCancelCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
