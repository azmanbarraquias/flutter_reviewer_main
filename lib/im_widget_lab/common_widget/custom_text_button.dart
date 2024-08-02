import 'package:flutter/material.dart';


class CustomTextButton extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool isBold;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final bool isDisabled;
  final void Function() onClick;

  const CustomTextButton(
    this.text, {
    super.key,
    this.fontSize,
    this.isBold = false,
    this.color,
    this.padding,
    this.isDisabled = false,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    Widget child = Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 17,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        leadingDistribution: TextLeadingDistribution.even,
        color: isDisabled ? Colors.red : Colors.black45,
      ),
    );

    return GestureDetector(
      onTap: isDisabled ? null : onClick,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
