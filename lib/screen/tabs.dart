import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/filters.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/main_drawer.dart';

const Map<FilterMeal, bool> kFilterInitial = {
  FilterMeal.glutenFree: false,
  FilterMeal.lactosFree: false,
  FilterMeal.vegetarian: false,
  FilterMeal.vegan: false,
};

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
  Map<FilterMeal, bool> filterMap = kFilterInitial;

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

  void _setScreen(ScreenType identifier) async {
    Navigator.of(context).pop();
    switch (identifier) {
      case ScreenType.Categories:
        break;
      case ScreenType.Filters:
        final result = await Navigator.of(context)
            .push<Map<FilterMeal, bool>>(MaterialPageRoute(
          builder: (context) => FilterScreen(
            mapFilters: filterMap,
          ),
        ));

        setState(() {
          filterMap = result ?? kFilterInitial;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    String title = '';
    final availableMeals = DummyData.dummyMeals.where((meal) {
      if (filterMap[FilterMeal.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filterMap[FilterMeal.lactosFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (filterMap[FilterMeal.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (filterMap[FilterMeal.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget selectedWidget = Categories(
      toggleFavMeal: _handleFavouriteMeal,
      availableMeals: availableMeals,
    );

    if (selectedIndex == 1) {
      selectedWidget = MealsScreen(
        meals: _favMeals,
        toggleFavMeal: _handleFavouriteMeal,
      );
      title = 'Favorites';
    } else {
      selectedWidget = Categories(
        toggleFavMeal: _handleFavouriteMeal,
        availableMeals: availableMeals,
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
