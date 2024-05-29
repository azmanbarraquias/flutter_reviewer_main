import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet. . .'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx, index) {
          var currentMeal = favoriteMeals[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MealItem(
              meal: currentMeal,
              removeItem: () {},
            ),
          );
        },
      );
    }
  }
}
