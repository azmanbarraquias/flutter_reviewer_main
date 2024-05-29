import 'package:flutter/material.dart';

import '../utils/xprint.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: SafeArea(child: MyPage())));
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    var itemsString = [
      '恭喜发财',
      '点胜',
      'ALL in',
      '赢不了一点',
      '跟上大佬, 这把ALL in',
      '搏一搏单车变摩托',
      '这局必胜 跟上我带你们赢',
      '大佬NB'
    ];
    return SuggestionClipboard(items: itemsString);
  }
}

class SuggestionClipboard extends StatelessWidget {
  const SuggestionClipboard({super.key, required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          alignment: Alignment.topLeft,
          width: double.infinity,
          color: const Color.fromRGBO(243, 243, 243, 1),
          child: Wrap(
              runSpacing: 5,
              spacing: 5,
              children: items.map((item) {
                var index = items.indexOf(item);
                return GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        items[index],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(18, 18, 18, 1),
                        ),
                      ),
                    ),
                    onTap: () {
                      xPrint(items[index]);
                    });
              }).toList()),
        ),
        Divider(
          color: Colors.grey[300],
          height: 0,
          indent: 0,
          thickness: 0.33,
        ),
      ],
    );
  }
}
