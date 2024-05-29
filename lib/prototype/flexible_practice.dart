import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text("Flutter Demo"),
    ),
    body: const MyFlexible(),
  )));
}

class MyFlexible extends StatelessWidget {
  const MyFlexible({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
                child: const Text(
                  'Item 1 - pretty bigxxsdasdasdasdasddsdssds!',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Container(
              height: 100,
              color: Colors.blue,
              child: const Text('Item 2'),
            ),
            Container(
              height: 100,
              color: Colors.orange,
              child: const Text('Item 33'),
            ),
            // Container
            Container()
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 100,
              color: Colors.red,
              child: const Text('Item 1 - pretty big!'),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.blue,
                child: const Text('Item 2'),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.grey,
                child: const Text('Item 3'),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 100,
                color: Colors.orange,
                child: const Text('Item 4'),
              ),
            ),
            // Container
            Container()
          ],
        ),
      ],
    );
  }
}
