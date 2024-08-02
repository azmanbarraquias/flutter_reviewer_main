import 'package:flutter/material.dart';

class KeyboardNumber extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String? key)? onTap;
  final bool isShowDot;
  final bool showTopButtons;
  final Function()? onTapConfirm;
  final Function()? onTapCancel;
  final Color? cancelColor;
  final Color? doneColor;

  const KeyboardNumber({
    super.key,
    this.controller,
    this.onTap,
    this.isShowDot = true,
    this.showTopButtons = false,
    this.onTapConfirm,
    this.onTapCancel,
    this.cancelColor,
    this.doneColor,
  });

  Widget _textBtn(buttonValue, {Color? colors}) {
    return Text(
      buttonValue,
      style:
          TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: colors),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (true)
            ColoredBox(
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onTapCancel,
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapConfirm,
                    behavior: HitTestBehavior.opaque,
                    child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Done',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue),
                        )),
                  ),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.all(2),
            color: Colors.black,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 2.2,
              children: List.generate(
                12,
                (index) {
                  Widget buttonChild;
                  Function buttonAction;
                  String? key;
                  if (index < 9) {
                    key = '${index + 1}';
                    buttonChild = _textBtn('${index + 1}');
                    buttonAction = () => controller?.text += '${index + 1}';
                  } else if (index == 9) {
                    key = '.';
                    buttonChild =
                        _textBtn(isShowDot ? '.' : '');
                    buttonAction = () => controller?.text += '.';
                  } else if (index == 10) {
                    key = '0';
                    buttonChild = _textBtn('0');
                    buttonAction = () => controller?.text += '0';
                  } else {
                    buttonChild = const Icon(
                      Icons.delete,
                      size: 24,
                      // color: Colors.white70,
                    );

                    buttonAction = () {
                      if (controller == null) return;
                      if (controller!.text.isNotEmpty) {
                        controller!.text = controller!.text
                            .substring(0, controller!.text.length - 1);
                      }
                    };
                  }

                  return InkWell(
                    onTap: (index == 9 && !isShowDot)
                        ? null
                        : () {
                            //震動
                            buttonAction();
                            onTap?.call(key);
                          },
                    child: Container(
                      alignment: Alignment.center,
                      color: (index == 9 || index == 11)
                          ? Colors.white70
                          : Colors.white70,
                      child: buttonChild,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
