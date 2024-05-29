import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utils/xprint.dart';
import '../models/meal_model.dart';
import '../screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.removeItem});

  final Meal meal;
  final Function removeItem;

  void onSelectMeal(ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: {meal},
    ).then((result) {
      if (result != null) {
        Meal? test = result as Meal;
        xPrint(test.title);
        removeItem(test);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Hero(
                    tag: meal.id.toString(),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 300,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 27, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const Gap(6),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                      ),
                      const Gap(6),
                      Text(meal.complexityValue)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const Gap(6),
                      Text(meal.affordabilityValue)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
