import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18,),
            Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 18,),
            for (final ingredient in meal.ingredients)
             Text(ingredient),
            
            SizedBox(height: 18,),
            Text("Steps", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            SizedBox(height: 18,),
            for (final step in meal.steps)
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8,),
               child: Text(step, textAlign: TextAlign.center,),
             ),
          ],
        ),
      ),
    );
  }
}