import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';
import 'package:gap/gap.dart';

import 'common_widget/custom_input.dart';
import 'common_widget/keyboard_number.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final _titleFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  var _currentController = TextEditingController();
  final _quantityFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();

  var isKeyboardShow = false;

  final _initValues = {'title': '', 'price': '', 'quantity': ''};

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _priceFocusNode.dispose();
    _quantityFocusNode.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // _titleFocusNode.addListener(_onFocusChange);
    _titleFocusNode.addListener(_onFocusChange);
    _priceFocusNode.addListener(_onFocusChange);
    _quantityFocusNode.addListener(_onFocusChange);
    // _quantity.addListener(_onFocusChange);
    super.initState();
  }

  void _onFocusChange() {
    // xPrint("Focus _titleFocusNode: ${_titleFocusNode.hasFocus.toString()}");
    xPrint("Focus _priceFocusNode: ${_priceFocusNode.hasFocus.toString()}");
    // xPrint("Focus _quantity: ${_quantity.hasFocus.toString()}");
    setState(() {
      isKeyboardShow = _priceFocusNode.hasFocus || _quantityFocusNode.hasFocus;
    });
    if (_priceFocusNode.hasFocus) {
      _currentController = _priceController;
    }
    if (_quantityFocusNode.hasFocus) {
      _currentController = _quantityController;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Custom Input'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Form(
                key: _form,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    children: [
                      CustomInput(
                          controller: _titleController,
                          hintText: 'Title',
                          focusNode: _titleFocusNode,
                          onSubmitted: (_) {
                            Future.delayed(Duration.zero, (){
                              _priceFocusNode.nextFocus();
                            });
                            // FocusScope.of(context)
                            //     .requestFocus(_priceFocusNode);
                            // xPrint('OK na');
                          },
                          hasFocus: (focus) {
                            xPrint('_titleController: $focus');
                          },
                          keyboardType: TextInputType.text),
                      const Gap(14),
                      CustomInput(
                        controller: _priceController,
                        hintText: 'Price',
                        focusNode: _priceFocusNode,
                        onSubmitted: (_) {
                          Future.delayed(Duration.zero, (){
                            _quantityFocusNode.nextFocus();
                          });
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                      ),
                      const Gap(14),
                      CustomInput(
                        controller: _quantityController,
                        hintText: 'Quantity',
                        focusNode: _quantityFocusNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              if (isKeyboardShow)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: KeyboardNumber(
                    onTapCancel: () {
                      FocusScope.of(context).unfocus();
                    },
                    onTapConfirm: () {
                      Future.delayed(Duration.zero, (){
                        FocusScope.of(context).nextFocus();
                      });

                    },
                    controller: _currentController,
                    onTap: (value) {
                      // Some Function
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String? id;
  final String? title;
  final num? price;
  final num? quantity;

  Product({
    this.id,
    this.title,
    this.price = 0,
    this.quantity = 0,
  });
}
