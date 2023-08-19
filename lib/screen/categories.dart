import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category_info.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/category_item_grid.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.toggleFavMeal});
  final Function(Meal meal) toggleFavMeal;

  void _didSelectCategory(BuildContext context, Category category) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      final filteredMeal = DummyData.dummyMeals
          .where((element) => element.categories.contains(category.id))
          .toList();
      return MealsScreen(title: category.title, meals: filteredMeal, toggleFavMeal: toggleFavMeal,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18),
        children: DummyData.availableCategories
            .map((e) => CategoryGridItem(
                  categoryInfo: e,
                  didSelectCategory: () {
                    _didSelectCategory(context, e);
                  },
                ))
            .toList(),
      );
  }
}
