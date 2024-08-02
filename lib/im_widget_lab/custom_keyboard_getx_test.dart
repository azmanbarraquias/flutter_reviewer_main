import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reviewer_main/im_widget_lab/product_controller_getx.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../utils/xprint.dart';
import 'common_widget/custom_input.dart';
import 'common_widget/keyboard_number.dart';

void main() {
  runApp(const MyApp());
}

extension GetExtension on GetInterface {
  S findOrPut<S>(S create, {String? tag, bool permanent = false}) {
    return isRegistered<S>(tag: tag)
        ? find<S>(tag: tag)
        : put<S>(create, tag: tag, permanent: permanent);
  }

  Future<bool> findAndDelete<S>({String? tag, bool force = false}) async {
    return isRegistered<S>(tag: tag) && await delete<S>(tag: tag, force: force);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
    );
  }
}

class MyPage extends GetView<ProductController> {
  const MyPage({super.key});

  @override
  ProductController get controller =>
      Get.findOrPut<ProductController>(ProductController());

  @override
  Widget build(BuildContext context) {
    xPrint('MyPage Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyboard Test'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Form(
                key: controller.form,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListView(
                    children: [
                      CustomInput(
                          controller: controller.titleController,
                          hintText: 'Title',
                          focusNode: controller.titleFocusNode,
                          onSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(controller.priceFocusNode);
                            xPrint('OK na');
                          },
                          hasFocus: (focus) {
                            xPrint('controller.titleController: $focus');
                          },
                          keyboardType: TextInputType.text),
                      const Gap(14),
                      CustomInput(
                        controller: controller.priceController,
                        hintText: 'Price',
                        focusNode: controller.priceFocusNode,
                        onSubmitted: (_) {
                          Future.delayed(Duration.zero, () {
                            FocusScope.of(context)
                                .requestFocus(controller.quantityFocusNode);
                          });
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                      ),
                      const Gap(14),
                      CustomInput(
                        controller: controller.quantityController,
                        hintText: 'Quantity',
                        focusNode: controller.quantityFocusNode,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: controller.isKeyboardShow.value,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: KeyboardNumber(
                      onTapCancel: () {
                        FocusScope.of(context).unfocus();
                      },
                      onTapConfirm: () {
                        if (controller.priceFocusNode.hasFocus) {
                          Future.delayed(Duration.zero, () {
                            FocusScope.of(context)
                                .requestFocus(controller.quantityFocusNode);
                          });
                        }
                        if (controller.quantityFocusNode.hasFocus) {
                          Future.delayed(Duration.zero, () {
                            FocusScope.of(context).unfocus();
                          });
                        }
                      },
                      controller: controller.currentController,
                      onTap: (value) {
                        // Some Function
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
