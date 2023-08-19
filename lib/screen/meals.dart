import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meal_detail.dart';
import 'package:meals_app/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.toggleFavMeal});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal) toggleFavMeal;

  void navigateMealDetails(BuildContext context, Meal meal) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return MealDetails(meal: meal, toggleFavMeal: toggleFavMeal,);
    } ),);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: meals[index], didSelectMeal: (Meal meal) {
            navigateMealDetails(context, meals[index]);
          },);
        });

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sorry..there is no meals here',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Try selecting a different category',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
