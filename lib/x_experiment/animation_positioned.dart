import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyList(),
  ));
}

class MyList extends StatelessWidget {
  const MyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(95, 152, 156, 1),
          Color.fromRGBO(109, 159, 138, 1),
          Color.fromRGBO(134, 167, 117, 1),
        ],
      )),
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: 3,
          itemBuilder: (ctx, i) {
            return MyItem();
          }),
    )));
  }
}

class MyItem extends StatefulWidget         {
  const MyItem({super.key});

  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.fastOutSlowIn;

  @override
  State<MyItem> createState() => _MyItemState();
}

class _MyItemState extends State<MyItem> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 10.0,
        sigmaY: 10.0,
      ),
      child: Container(
        width: 183.0,
        height: 183.0,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.black.withOpacity(0.2)),
        child: LayoutBuilder(builder: (ctx, constraints) {
          final cX = (constraints.maxWidth - 80) / 2; // 100 is the box width
          final cY = (constraints.maxHeight - 80) / 2; // 100 is the box height
          return Stack(
            children: [
              Positioned.fill(
                child: !selected ? FlutterLogo() : Container(),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                          right: 4.0,
                        ),
                        child: Icon(Icons.signal_cellular_alt_2_bar)),
                    Text(constraints.maxWidth.toString(), style: TextStyle()
                        // jxTextStyle.normalSmallText(
                        //   color: Colors.white,
                        //   fontWeight:
                        //   MFontWeight.bold6.value,
                        // ),
                        ),
                  ],
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.signal_cellular_0_bar),
                // child: SvgPicture.asset(
                //   'assets/svgs/signal-4.svg',
                //   color: Colors.white,
                //   fit: BoxFit.fill,
                //   width: 16,
                //   height: 16,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Icon(Icons.signal_cellular_0_bar),
                // child: SvgPicture.asset(
                //   'assets/svgs/signal-4.svg',
                //   color: Colors.white,
                //   fit: BoxFit.fill,
                //   width: 16,
                //   height: 16,
              ),
              AnimatedPositioned(
                width: selected ? 80.0 : 50.0,
                height: selected ? 80.0 : 50.0,
                left: selected ? cX : 8,
                bottom: selected ? cY : 8,
                duration: MyItem.duration,
                curve: MyItem.curve,
                child: GestureDetector(
                  onTap: () {
                    setState(() => selected = !selected);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    ));
  }
}
