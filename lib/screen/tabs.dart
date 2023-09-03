import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/favorites_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/provider/meals_provider.dart';
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

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});
  @override
  ConsumerState<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int selectedIndex = 0;
  void _setScreen(ScreenType identifier) async {
    Navigator.of(context).pop();
    switch (identifier) {
      case ScreenType.Categories:
        break;
      case ScreenType.Filters:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilterScreen(),
        ));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final filterMap = ref.watch(filterProvider);
    String title = '';
    final availableMeals = meals.where((meal) {
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
      availableMeals: availableMeals,
    );

    if (selectedIndex == 1) {
      final favMeals = ref.watch(favoriteProvider);
      selectedWidget = MealsScreen(
        meals: favMeals,
      );
      title = 'Favorites';
    } else {
      selectedWidget = Categories(
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
