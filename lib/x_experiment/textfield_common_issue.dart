import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: <Widget>[
                      Container(
                        // Start Here
                        child: const Placeholder(),
                      ),
                      TextFormField(),
                      TextFormField(),
                      Spacer(),
                      Divider(),
                      Icon(Icons.block)
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'MyPage';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // Start Here
              child: const Placeholder(),
            ),
            TextFormField(),
            TextFormField(),
            Spacer(),
            OutlinedButton(onPressed: () {}, child: Text('OK'))
          ],
        ),
      ),
    );
  }
}
