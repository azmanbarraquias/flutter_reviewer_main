import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
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
        backgroundColor: Colors.grey,
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
        child: CustomScrollView(
            // Start Here
            slivers: [
              const SliverAppBar(
                title: Center(child: Text('SliverAppBar')),
                centerTitle: true,
                expandedHeight: 150,
                stretch: true,
                backgroundColor: Colors.pinkAccent,
                flexibleSpace: FlexibleSpaceBar(
                  background: FlutterLogo(),
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle,
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          margin: const EdgeInsets.only(right: 10),
                          alignment: Alignment.center,
                          color: Colors.red,
                          child: const Text('HELLO'));
                    },
                  ),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                sliver: DecoratedSliver(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10)),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    sliver: SliverList.builder(
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return const Card(
                            child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('data'),
                        ));
                      },
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
