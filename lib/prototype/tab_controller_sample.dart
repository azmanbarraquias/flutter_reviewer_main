import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: MyTabPage(),
      ),
    ),
  ));
}

class MyTabPage extends StatefulWidget {
  const MyTabPage({super.key});

  @override
  State<MyTabPage> createState() => _MyTabPageState();
}

class _MyTabPageState extends State<MyTabPage>
    with SingleTickerProviderStateMixin {
  static List<Tab> myTabs = <Tab>[
    const Tab(
      child: Text(
        "Hello",
        style: TextStyle(color: Colors.black),
      ),
    ),
    const Tab(
      child: Text(
        "Hello x",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
          ]),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
}
