import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: TabBarSample(),
    ),
  );
}

class TabBarSample extends StatelessWidget {
  const TabBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text("Dev Azuma Tab Bar"),
          bottom: TabBar(
            onTap: (index) {
              print('Hello world');
            },
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: const [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.directions_boat),
              ),
              Tab(
                icon: Icon(Icons.directions_transit),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Row(
                children: [
                  Icon(Icons.directions_bus),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Bus")
                ],
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Car"),
            ),
            Center(
              child: Text("Boat"),
            ),
            Center(
              child: Text("Transit"),
            ),
            Center(
              child: Text("Bike"),
            ),
            Center(
              child: Text("Bus"),
            )
          ],
        ),
      ),
    );
  }
}
