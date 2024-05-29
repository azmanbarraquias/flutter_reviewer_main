import 'package:flutter/material.dart';

import 'models/meal_model.dart';
import 'other/dummy_data.dart';
import 'screen/category_meals_details_screen.dart';
import 'screen/filters_screen.dart';
import 'screen/meal_detail_screen.dart';
import 'screen/tab_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  _serFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add((DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yakitori Recipe\'s',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        hintColor: Colors.amber,
        canvasColor: Colors.blueAccent,
        useMaterial3: true,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodySmall: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              titleMedium:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              titleSmall:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        tabBarTheme: const TabBarTheme(
            tabAlignment: TabAlignment.fill,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.elliptical(100, 500),
                topRight: Radius.elliptical(100, 500),
              ),
            ),
            indicatorColor: Colors.black),
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      initialRoute: '/',
      // default is /
      // home: const CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              toggleFavorites: _toggleFavorite,
              isMealFavorite: isMealFavorite,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilter: _serFilters,
              currentFilter: _filters,
            ),
      },
      // onGenerateRoute: (setting) {
      //   xPrint(setting.arguments.toString());
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },
      // onUnknownRoute: (setting) {
      //   //404
      //   xPrint(setting.arguments.toString());
      //   return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      // },
    );
  }
}
