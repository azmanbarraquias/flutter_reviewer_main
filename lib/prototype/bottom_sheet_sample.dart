import 'package:flutter/material.dart';

import 'gridview_selector.dart';

main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: SafeArea(
        child: BottomSheetSample(),
      ),
    ),
  ));
}

class BottomSheetSample extends StatelessWidget {
  const BottomSheetSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Bottom Sheet Sample"),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                    builder: (context) => const SizedBox(
                      height: 50 + 204,
                      child: Center(
                        child: AmountBottomSheetBody(),
                      ),
                    ));
              },
              child: const Text("Open Bottom Sheet"))
        ],
      ),
    );
  }
}

Future _displayBottomSheet(BuildContext context)  async {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.amberAccent,
      barrierColor: const Color.fromARGB(92, 200, 158, 239),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => const SizedBox(
            height: 200,
            child: Center(
              child: Text(
                "DevAzusa",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ));
}
