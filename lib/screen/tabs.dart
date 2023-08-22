import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/main_drawer.dart';

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

  void _showFavSnackbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _handleFavouriteMeal(Meal meal) {
    bool isExists = _favMeals.contains(meal);
    if (isExists) {
      setState(() {
        _favMeals.remove(meal);
      });
      _showFavSnackbar("This meal is no longer favorite");
    } else {
      setState(() {
        _favMeals.add(meal);
      });
      _showFavSnackbar("This meal added to your favorites");
    }
  }

  void _setScreen(ScreenType identifier) {
    switch (identifier) {
      case ScreenType.Categories:
        Navigator.of(context).pop();
        break;
      case ScreenType.Filters:
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedWidget = Categories(toggleFavMeal: _handleFavouriteMeal);
    String title = '';

    if (selectedIndex == 1) {
      selectedWidget = MealsScreen(
        meals: _favMeals,
        toggleFavMeal: _handleFavouriteMeal,
      );
      title = 'Favorites';
    } else {
      selectedWidget = Categories(
        toggleFavMeal: _handleFavouriteMeal,
      );
      title = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: selectedWidget,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
