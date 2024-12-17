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
      home: Scaffold(body: MyPage()),
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
        child: Container(
          // Start Here
          child: Center(
            child: TextButton(
                onPressed: () async {
                  var result = await returnModal(context);

                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text(result.toString()),
                  // ));

                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$result')));
                },
                child: Text("Open Modal")),
          ),
        ),
      ),
    );
  }

  Future<String?> returnModal(ctx) async {
    String? value;

    await showModalBottomSheet<void>(
      context: context,
      builder: (context) => Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, 'Yep!');
          },
          child: const Text('Say hello!'),
        ),
      ),
    );

    value = 'Hello Azman 2!';

    return value;
  }
}
