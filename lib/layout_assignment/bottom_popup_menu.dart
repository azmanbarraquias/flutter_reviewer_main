import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../utils/xprint.dart';
import 'popup_menu.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: MyPage(),
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.access_alarm),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        showPopover(
                            context: context,
                            bodyBuilder: (ctx) => const MenuItems(),
                            width: 250,
                            height: 150);
                      },
                      child: const Text("data1"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("data2"))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("data3"))),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuAnchorApp extends StatelessWidget {
  const MenuAnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MenuAnchorExample(),
    );
  }
}

class MenuAnchorExample extends StatefulWidget {
  const MenuAnchorExample({super.key});

  @override
  State<MenuAnchorExample> createState() => _MenuAnchorExampleState();
}

class _MenuAnchorExampleState extends State<MenuAnchorExample> {
  String? selectedMenu;
  final values = ['群组简介', '中奖公告', ' 开奖结果', '管理员信息'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MenuAnchorButton')),
      body: Center(
        child: MenuAnchor(
          style: MenuStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
          builder: (context, controller, child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: const Icon(Icons.access_alarm),
              tooltip: 'Show menu',
            );
          },
          menuChildren: List<MenuItemButton>.generate(
            values.length,
            (int index) => MenuItemButton(
              onPressed: () {
                setState(() {
                  xPrint(values[index]);
                });
              },
              child: SizedBox(
                width: 120,
                child: Column(
                  children: [
                    Text(values[index]),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
