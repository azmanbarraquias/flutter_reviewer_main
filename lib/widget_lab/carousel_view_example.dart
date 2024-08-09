import 'package:cached_network_image/cached_network_image.dart';
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
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  final title = 'Carousel Page';

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final carouselController = CarouselController();

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
        child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 240),
            child: CarouselView(
                itemExtent: 330,
                shrinkExtent: 200,
                controller: carouselController,
                // itemSnapping: true,
                elevation: 2,
                children: List.generate(10, (i) {
                  return Container(
                    color: Colors.grey,
                    child: CachedNetworkImage(
                      imageUrl: 'https://picsum.photos/1000?random=$i',
                      fit: BoxFit.cover,
                    ),
                  );
                }))),
      ),
    );
  }
}
