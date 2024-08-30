import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

// Mix (Package of the Week)
// https://www.youtube.com/watch?v=sjPSx6-iCao

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {

    // StyledText -> Text
    // StyledIcon -> Icon
    // StyledImage -> Image
    // FlexBox ->Flex
    // HBox -> Column
    // VBox ->Row
    // ZBox -> Stack

    final style = Style(
      $box.height(100),
      $box.width(100),
      $box.color.purple(),
      $box.borderRadius(10),
    );

    const onOutlined = Variant('outlined');

    final baseStyle = Style(
      $box.borderRadius(10),
      $box.color.black(),
      $text.style.color.white(),

      onOutlined(
        $box.color.transparent(),
        $box.border.color.black(),
        $text.style.color.black(),
      ),
    );

    final outlinedStyle = baseStyle.applyVariant(onOutlined);

    final style2 = Style(
      $box.color.black(),
      $text.style.color.white(),
      $on.dark(
        $box.color.white(),
        $text.style.color.black(),
      ),
    );



    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Box(
                style: style,
                child: const Icon(Icons.icecream),
              ),
              const SizedBox(height: 10),
              Box(
                style: baseStyle,
                child: const Icon(Icons.rocket, color: Colors.white,),
              ),
              const SizedBox(height: 10),
              Box(
                style: outlinedStyle,
                child: const Icon(Icons.car_crash),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
