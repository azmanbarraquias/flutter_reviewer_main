
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// This class is relatively expensive, because it adds a speculative
// layout pass before the final layout phase. Avoid using it where possible.
// In the worst case, this widget can result in a layout that is O(N2) in the depth of the tree.

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
      backgroundColor: Colors.grey.withOpacity(0.9),
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
          color: Colors.yellow,
          child: IntrinsicHeight(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 70,
                      width: 50,
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 50,
                    color: Colors.green,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.blue,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}

// Container(
// color: Colors.red,
// child: Flexible(
// child: ListView.builder(
// padding: const EdgeInsets.symmetric(horizontal: 20),
// itemCount: 3,
// shrinkWrap: true,
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemBuilder: (ctx, i) {
// return Container(
// width: 200,
// margin: const EdgeInsets.only(right: 20),
// clipBehavior: Clip.hardEdge,
// decoration: BoxDecoration(
// color: Colors.grey,
// borderRadius: BorderRadius.circular(12)),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// mainAxisSize: MainAxisSize.min,
// children: [
// const SizedBox(height: 200, child: FlutterLogo()),
// Container(
// color: Colors.white,
// padding: const EdgeInsets.all(20),
// child: const Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('ABCfsd d'),
// Text('ABCfsd d'),
// ],
// ),
// )
// ],
// ),
// );
// }),
// ),
// ),
// Expanded(
//   child: Container(
//     clipBehavior: Clip.hardEdge,
//     decoration: BoxDecoration(
//         color: Colors.grey, borderRadius: BorderRadius.circular(12)),
//     margin: const EdgeInsets.symmetric(horizontal: 20),
//     child: ListView.builder(
//         itemCount: 10,
//         shrinkWrap: true,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (ctx, i) {
//           return Container(
//             decoration: const BoxDecoration(
//               border: Border(
//                 bottom: BorderSide(width: 1.5, color: Colors.black),
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text('ABCfsd d'),
//                       OutlinedButton(
//                           onPressed: () {},
//                           child: const Text('ABCfsd')),
//                     ],
//                   ),
//                 ),
//                 Container(
//                     height: 48,
//                     margin: const EdgeInsets.symmetric(vertical: 12),
//                     color: Colors.pink,
//                     child: ListView.builder(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10),
//                         itemCount: 10,
//                         shrinkWrap: true,
//                         physics: const BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         itemBuilder: (ctx, i) {
//                           return Align(
//                             alignment: Alignment.topCenter,
//                             child: Container(
//                               width: 48,
//                               margin:
//                                   const EdgeInsets.only(right: 20),
//                               clipBehavior: Clip.hardEdge,
//                               decoration: BoxDecoration(
//                                   color: Colors.blue,
//                                   borderRadius:
//                                       BorderRadius.circular(12)),
//                               child: Container(
//                                   height: 48,
//                                   child: const FlutterLogo()),
//                             ),
//                           );
//                         })),
//               ],
//             ),
//           );
//         }),
//   ),
// ),
