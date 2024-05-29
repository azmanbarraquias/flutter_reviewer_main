import 'package:flutter/material.dart';

main() => runApp(const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: AnimationDialogSample(),
        ),
      ),
    ));

class AnimationDialogSample extends StatelessWidget {
  const AnimationDialogSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                _openAnimatedDialog(context);
              },
              child: const Text("Animated Dialog"))
        ],
      ),
    );
  }

  void _openAnimatedDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: '',
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (ctx, animation1, animation2) {
          return Container();
        },
        transitionBuilder: (ctx, a1, a2, widget) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
            child: FadeTransition(
              opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: AlertDialog(
                title: const Text("Hello"),
                content: const Text("I am Dev Azman"),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: BorderSide.none),
              ),
            ),
          );
        });
  }
}
