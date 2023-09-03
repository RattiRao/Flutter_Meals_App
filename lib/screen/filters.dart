import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/widget/filter_tile.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  bool _isGlutenFreeSet = false;
  bool _isLactosFreeSet = false;
  bool _isVegetarian = false;
  bool _isVegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filterProvider);
    _isGlutenFreeSet = activeFilters[FilterMeal.glutenFree]!;
    _isLactosFreeSet = activeFilters[FilterMeal.lactosFree]!;
    _isVegetarian = activeFilters[FilterMeal.vegetarian]!;
    _isVegan = activeFilters[FilterMeal.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    final mapFilters = ref.watch(filterProvider);

    _isGlutenFreeSet = mapFilters[FilterMeal.glutenFree]!;
    _isLactosFreeSet = mapFilters[FilterMeal.lactosFree]!;
    _isVegetarian = mapFilters[FilterMeal.vegetarian]!;
    _isVegan = mapFilters[FilterMeal.vegan]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == ScreenType.Categories) {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => TabScreen()));
      //   }
      // },),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            FilterMeal.glutenFree: _isGlutenFreeSet,
            FilterMeal.lactosFree: _isLactosFreeSet,
            FilterMeal.vegetarian: _isVegetarian,
            FilterMeal.vegan: _isVegan,
          });
          return false;
        },
        child: Column(children: [
          FilterTile(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meal.',
              isValueSet: _isGlutenFreeSet,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.glutenFree, isChecked);
              }),
          FilterTile(
              title: 'Lactos-free',
              subtitle: 'Only incluee lactos-free meals.',
              isValueSet: _isLactosFreeSet,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.lactosFree, isChecked);
              }),
          FilterTile(
              title: 'Vegetarian',
              subtitle: 'Only incluee vegetarian meals.',
              isValueSet: _isVegetarian,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.vegetarian, isChecked);
              }),
          FilterTile(
              title: 'Vegan',
              subtitle: 'Only incluee vegan meals.',
              isValueSet: _isVegan,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.vegan, isChecked);
              }),
        ]),
      ),
    );
  }
}
