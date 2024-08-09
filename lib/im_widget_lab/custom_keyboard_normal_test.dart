import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reviewer_main/utils/xprint.dart';
import 'package:flutter_reviewer_main/x_experiment/flutter_lifecycle.dart';

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
  final _quantityFocusNode = FocusNode();

  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();
  var _currentController = TextEditingController();

  final _form = GlobalKey<FormState>();

  var isKeyboardShow = false;

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
        title: const Text('Keyboard Normal'),
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
                      TextFormField(
                        focusNode: _titleFocusNode,
                        decoration: const InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (_) {
                          // FocusScope.of(context).requestFocus(_priceFocusNode);
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a value';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {},
                      ),
                      TextFormField(
                          decoration: const InputDecoration(labelText: 'Price'),
                          textInputAction: TextInputAction.next,
                          controller: _priceController,
                          keyboardType: TextInputType.none,
                          focusNode: _priceFocusNode,
                          onFieldSubmitted: (_) {
                            // FocusScope.of(context).requestFocus(_quantity);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid number';
                            }
                            if (double.parse(value) <= 0) {
                              return 'Please enter greater than 0';
                            }
                            return null;
                          },
                          onSaved: (value) {}),
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Quantity'),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.none,
                          controller: _quantityController,
                          focusNode: _quantityFocusNode,
                          onFieldSubmitted: (_) {
                            // FocusScope.of(context).requestFocus(_quantity);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please provide a value';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid number';
                            }
                            if (double.parse(value) <= 0) {
                              return 'Please enter greater than 0';
                            }
                            return null;
                          },
                          onSaved: (value) {}),
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
                        FocusScope.of(context).nextFocus();
                        if (_quantityFocusNode.hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                      },
                      controller: _currentController,
                      onTap: (value) {
                        // Some Function
                      },
                    ))
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
