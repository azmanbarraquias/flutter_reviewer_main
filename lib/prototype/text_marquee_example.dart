import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: CustomMarquee()));

class CustomMarquee extends StatefulWidget {
  const CustomMarquee({super.key});

  @override
  State<CustomMarquee> createState() => _CustomMarqueeState();
}

class _CustomMarqueeState extends State<CustomMarquee> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _startScrolling();
  }

  void _startScrolling() {
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController
          .animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 2),
        curve: Curves.linear,
      )
          .then((_) {
        // Scroll back to the start
        _scrollController.jumpTo(0.0);
        _startScrolling();
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              "This is a custom marquee text! vh asd asd asd  asd asd ",
              style: TextStyle(fontSize: 24),
            ),
          )),
    );
  }
}



class CustomMarqueeText extends StatefulWidget {
  const CustomMarqueeText({super.key});

  @override
  State<CustomMarqueeText> createState() => _CustomMarqueeTextState();
}

class _CustomMarqueeTextState extends State<CustomMarqueeText> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

