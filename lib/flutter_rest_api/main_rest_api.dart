
import 'package:flutter/material.dart';
import 'package:flutter_reviewer_main/flutter_rest_api/views/home_page_simple.dart';
import 'package:flutter_reviewer_main/flutter_rest_api/views/home_page_yugioh.dart';

import 'views/home_page_pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: HomePageSimple(),
      home: HomePageYugiOh(),
      // home: HomePagePokemon(),
    );
  }
}
