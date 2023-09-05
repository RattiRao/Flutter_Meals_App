import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/category_info.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/category_item_grid.dart';

class Categories extends StatefulWidget {
  const Categories({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _didSelectCategory(BuildContext context, Category category) {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      final filteredMeal = widget.availableMeals
          .where((element) => element.categories.contains(category.id))
          .toList();
      return MealsScreen(
        title: category.title,
        meals: filteredMeal,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          child: child,
        );
      },
    );
  }
}
