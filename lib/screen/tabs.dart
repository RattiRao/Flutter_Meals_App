import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  final List<Meal> _favMeals = [];

  void _handleFavouriteMeal(Meal meal) {
      bool isExists = _favMeals.contains(meal);
      if (isExists) {
        setState(() {
           _favMeals.remove(meal);
        });
     
     } else {
      setState(() {
        _favMeals.add(meal);
      });
     }
  }


  @override
  Widget build(BuildContext context) {
    Widget selectedWidget = Categories(toggleFavMeal: _handleFavouriteMeal);
    String title = '';

    if (selectedIndex == 1) {
      selectedWidget = MealsScreen(meals: _favMeals, toggleFavMeal: _handleFavouriteMeal,);
      title = 'Favorites';
    }
    else {
      selectedWidget = Categories(toggleFavMeal: _handleFavouriteMeal,);
      title = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: selectedWidget,
      bottomNavigationBar: BottomNavigationBar(onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories',),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites',),
      ],
      ), 
    );
  }
}