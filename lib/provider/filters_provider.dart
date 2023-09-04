import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';

enum FilterMeal {
  glutenFree,
  lactosFree,
  vegetarian,
  vegan,
}

class FilterNotifier extends StateNotifier<Map<FilterMeal, bool>> {
  FilterNotifier()
      : super({
          FilterMeal.glutenFree: false,
          FilterMeal.lactosFree: false,
          FilterMeal.vegetarian: false,
          FilterMeal.vegan: false,
        });

  void setFilter(FilterMeal filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterMeal, bool>>((ref) {
  return FilterNotifier();
});

final filterMealProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final filterMap = ref.watch(filterProvider);

  return meals.where((meal) {
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
});
