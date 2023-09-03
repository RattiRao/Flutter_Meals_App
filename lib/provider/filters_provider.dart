import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
