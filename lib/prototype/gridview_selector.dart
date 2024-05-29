import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: SafeArea(
        child: MyPage(),
      ),
    ),
  ));
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          _displayBottomSheet(context);
        },
        child: const Text('Open'),
      ),
    );
  }
}

class AmountBottomSheetBody extends StatelessWidget {
  const AmountBottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: Center(
              child: Text(
            "金额选择", // Amount Selection
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                fontFamily: 'PingFang SC'),
            textAlign: TextAlign.center,
          )),
        ),
        const MyGridView(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 44,
                child: TextButton(
                    style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Color.fromRGBO(18, 18, 18, 0.1),
                        ),
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: const Text(
                      '取消', // Cancel
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: SizedBox(
              height: 44,
              child: TextButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(0, 122, 255, 1)),
                  onPressed: () {},
                  child: const Text(
                    '取消', // Ok
                    style: TextStyle(color: Colors.white),
                  )),
            )),
            const SizedBox(width: 10),
          ],
        )
      ],
    );
  }
}

Future _displayBottomSheet(BuildContext bCtx) async {
  return showModalBottomSheet(
      context: bCtx,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) => const SizedBox(
            height: 50 + 204,
            child: Center(
              child: AmountBottomSheetBody(),
            ),
          ));
}

class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  int selectedCard = -1;
  var selectedColor = const Color.fromRGBO(0, 122, 255, 1);

  var amounts = [
    10,
    50,
    100,
    500,
    1000,
    5000,
    10000,
    50000,
    100000,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: GridView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.vertical,
          itemCount: amounts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: (114 / 40),
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCard = index;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      color: selectedCard == index
                          ? selectedColor
                          : const Color.fromRGBO(18, 18, 18, 0.1),
                      width: 1, //                   <--- border width here
                    )),
                child: Center(
                  child: Text(
                    '${amounts[index]}',
                    style: TextStyle(
                      fontSize: 14,
                      color: selectedCard == index
                          ? selectedColor
                          : const Color.fromRGBO(18, 18, 18, 0.48),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
