import 'package:flutter/gestures.dart';
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
        child: HoverClickBuilder(
          builder: (bool isHovered, bool isPressed) {
            return Container(
              height: 300,
              width: 300,
              decoration:
                  BoxDecoration(color: isHovered ? Colors.grey : Colors.blue),
              child: const Placeholder(),
            );
          },
        ),
      ),
    );
  }
}

class HoverClickBuilder extends StatefulWidget {
  const HoverClickBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isHovered, bool isPressed) builder;

  @override
  State<HoverClickBuilder> createState() => _HoverClickBuilderState();
}

class _HoverClickBuilderState extends State<HoverClickBuilder> {
  bool _isHovered = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => _onHoverChanged(enabled: true),
      onExit: (PointerExitEvent event) => _onHoverChanged(enabled: false),
      child: Listener(
          onPointerDown: (_) => _onClick(click: true),
          onPointerUp: (_) => _onClick(click: false),
          onPointerCancel: (_) => _onClick(click: false),
          child: widget.builder(_isHovered, isPressed)),
    );
  }

  void _onHoverChanged({required bool enabled}) {
    setState(() {
      _isHovered = enabled;
    });
  }

  void _onClick({required bool click}) {
    if (mounted) {
      setState(() {
        isPressed = click;
      });
    }
  }
}
