
import 'package:flutter/material.dart';

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
      // home: HomePageYugiOh(),
      home: HomePagePokemon(),
    );
  }
}
