import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key, required this.availableMeals});

  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late Category category;
  late List<Meal> displayedMeals;
  bool _loadedInitData = false;

  void _removeMeal(Meal meal) {
    setState(() {
      displayedMeals.removeWhere((lMeal) => lMeal == meal);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, Category>;

      category = routeArgs['category'] as Category;

      displayedMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: displayedMeals.length,
        itemBuilder: (ctx, index) {
          var currentMeal = displayedMeals[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MealItem(
              meal: currentMeal,
              removeItem: _removeMeal,
            ),
          );
        },
      ),
    );
  }
}
