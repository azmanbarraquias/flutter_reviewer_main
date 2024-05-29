import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/flutter_all_icons.dart';
import '../utils/xprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
      theme: ThemeData(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Map<String, IconData> _foundUsers = {};

  int gridItemCrossAxisCount = 5;

  @override
  initState() {
    _foundUsers = iconsData;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    Map<String, IconData> result = {};
    result.clear();
    if (enteredKeyword.isEmpty) {
      result = iconsData;
    } else {
      iconsData.forEach((key, currentVal) {
        if (key.contains(enteredKeyword.toLowerCase())) {
          result.putIfAbsent(key, () => currentVal);
        }
      });
    }
    _foundUsers = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Icon finder'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (gridItemCrossAxisCount >= 10) {
                    return;
                  }
                  gridItemCrossAxisCount++;
                });
              },
              icon: const Icon(Icons.add_circle_outline_outlined)),
          Text('$gridItemCrossAxisCount'),
          IconButton(
              onPressed: () {
                setState(() {
                  if (gridItemCrossAxisCount <= 1) {
                    return;
                  }
                  gridItemCrossAxisCount--;
                });
              },
              icon: const Icon(Icons.remove_circle_outline)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                cursorHeight: 20,
                onChanged: (value) {
                  setState(() {
                    _runFilter(value);
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Scrollbar(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridItemCrossAxisCount,
                      ),
                      itemCount: _foundUsers.length,
                      itemBuilder: (BuildContext context, int index) {
                        final currentIcon =
                            _foundUsers.entries.elementAt(index);
                        return Tooltip(
                          waitDuration: Durations.extralong4,
                          triggerMode: TooltipTriggerMode.tap,
                          onTriggered: () async {
                            xPrint('$currentIcon');
                            await Clipboard.setData(ClipboardData(
                                text: 'Icons.${currentIcon.key}'));
                          },
                          message: currentIcon.key ?? '',
                          child: GestureDetector(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: 'Icons.${currentIcon.key}'));
                              feedbackSnackBar(index);
                              // copied successfully
                            },
                            child: Card(
                              child: xIcon(
                                icon: Icon(
                                  currentIcon.value,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future feedbackSnackBar(index) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 500),
        content: Text(
            'Icons.${iconsData.entries.elementAt(index).key}, has been copy')));
  }

  ListView buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: iconsData.length,
      itemBuilder: (context, index) {
        var item = iconsData.entries.elementAt(index);
        return Row(children: [Text("${item.key} - "), Icon(item.value)]);
      },
    );
  }
}

// you can use width and height for icon instead of size
xIcon({width = 30.00, height = 30.00, background, decoration, required icon}) {
  return Container(
    decoration: decoration,
    color: background,
    height: height,
    width: width,
    child: FittedBox(
      fit: BoxFit.fill,
      child: icon,
    ),
  );
}
