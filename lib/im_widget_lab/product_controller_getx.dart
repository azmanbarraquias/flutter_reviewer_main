import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../utils/xprint.dart';

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

class ProductController extends GetxController
    with GetTickerProviderStateMixin {
  final titleFocusNode = FocusNode();
  final priceFocusNode = FocusNode();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  var currentController = TextEditingController();
  final quantityFocusNode = FocusNode();

  final form = GlobalKey<FormState>();

  RxBool isKeyboardShow = false.obs;
  void onFocusChange() {
    // xPrint("Focus titleFocusNode: ${titleFocusNode.hasFocus.toString()}");
    xPrint("Focus priceFocusNode: ${priceFocusNode.hasFocus.toString()}");
    // xPrint("Focus quantity: ${quantity.hasFocus.toString()}");
    isKeyboardShow.value =
        priceFocusNode.hasFocus || quantityFocusNode.hasFocus;
    if (priceFocusNode.hasFocus) {
      currentController = priceController;
    }
    if (quantityFocusNode.hasFocus) {
      currentController = quantityController;
    }
  }

  @override
  void onInit() {
    xPrint('onInit');
    // titleFocusNode.addListener(onFocusChange);
    titleFocusNode.addListener(onFocusChange);
    priceFocusNode.addListener(onFocusChange);
    quantityFocusNode.addListener(onFocusChange);
    // quantity.addListener(onFocusChange);
    super.onInit();
  }

  @override
  void onReady() {
    xPrint('onReady');
    super.onReady();
  }

  @override
  void onClose() {
    xPrint('onClose');
    titleFocusNode.dispose();
    priceFocusNode.dispose();
    quantityFocusNode.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    xPrint('dispose');
    titleFocusNode.dispose();
    priceFocusNode.dispose();
    quantityFocusNode.dispose();
    super.dispose();
  }
}
