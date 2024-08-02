import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_text_button.dart';

enum ClearButtonType {
  small,
  big,
}

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? rightTitle;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? hintText;
  final String errorText;
  final Widget? descriptionWidget;
  final bool showTextButton;
  final String? textButtonTitle;
  final void Function()? onTapInput;
  final void Function()? onTapClearButton;
  final void Function()? onTapTextButton;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(bool)? hasFocus;
  final void Function(PointerDownEvent)? onTapOutside;
  final List<TextInputFormatter>? inputFormatters;
  final ClearButtonType clearButtonType;

  const CustomInput({
    super.key,
    required this.controller,
    this.title,
    this.rightTitle,
    this.focusNode,
    this.keyboardType = TextInputType.none,
    this.maxLength,
    this.hintText,
    this.errorText = '',
    this.descriptionWidget,
    this.showTextButton = false,
    this.textButtonTitle,
    this.onTapInput,
    this.onTapClearButton,
    this.onTapTextButton,
    this.onChanged,
    this.hasFocus,
    this.onSubmitted,
    this.onTapOutside,
    this.inputFormatters,
    this.clearButtonType = ClearButtonType.big,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _hasFocus = false;

  @override
  void initState() {
    widget.controller.addListener(_updateClearIconVisibility);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateClearIconVisibility);
    super.dispose();
  }

  void _updateClearIconVisibility() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null || widget.rightTitle != null) _buildHeader(),
        Flexible(child: _buildTextField()),
        _buildBottomWidget(),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title ?? '',
            style: const TextStyle(fontSize: 13),
          ),
          Text(
            widget.rightTitle ?? '',
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    bool isClearButtonBig = widget.clearButtonType == ClearButtonType.big;

    return Focus(
      onFocusChange: (hasFocus) {
        // widget.hasFocus!(hasFocus);
        // if (hasFocus) Focus.of(context).requestFocus(widget.focusNode)
        setState(() => _hasFocus = hasFocus);
      },
      child: TextField(
        inputFormatters: widget.inputFormatters ??
            [LengthLimitingTextInputFormatter(widget.maxLength)],
        minLines: 1,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: TextInputAction.next,
        keyboardType: widget.keyboardType,
        cursorRadius: const Radius.circular(2),
        style: const TextStyle(
          fontSize: 17,
          decorationThickness: 0,
        ),
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 11,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontSize: 17),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.controller.text.isNotEmpty && _hasFocus)
                  IconButton(
                    onPressed: () {
                      widget.controller.clear();
                      if (widget.onTapClearButton != null) {
                        widget.onTapClearButton!();
                      }
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      size: isClearButtonBig ? 20 : 14,
                      color: isClearButtonBig
                          ? Colors.black
                          : Colors.black.withOpacity(0.24),
                    ),
                  ),
                if (widget.showTextButton)
                  CustomTextButton(
                    widget.textButtonTitle ?? '',
                    fontSize: 16,
                    padding: const EdgeInsets.only(left: 12),
                    onClick: widget.onTapTextButton ?? () {},
                  ),
              ],
            ),
          ),
        ),
        onTap: widget.onTapInput,
        onChanged: widget.onChanged,
        onTapOutside: widget.onTapOutside,
      ),
    );
  }

  Widget _buildBottomWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.errorText.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                widget.errorText,
                style: const TextStyle(fontSize: 14, color: Colors.redAccent),
                maxLines: 2,
              ),
            ),
          if (widget.descriptionWidget != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: widget.descriptionWidget!,
            ),
        ],
      ),
    );
  }
}
