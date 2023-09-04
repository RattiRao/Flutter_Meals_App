import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';
import 'package:meals_app/widget/filter_tile.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapFilters = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          FilterTile(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meal.',
              isValueSet: mapFilters[FilterMeal.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.glutenFree, isChecked);
              }),
          FilterTile(
              title: 'Lactos-free',
              subtitle: 'Only incluee lactos-free meals.',
              isValueSet: mapFilters[FilterMeal.lactosFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.lactosFree, isChecked);
              }),
          FilterTile(
              title: 'Vegetarian',
              subtitle: 'Only incluee vegetarian meals.',
              isValueSet: mapFilters[FilterMeal.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.vegetarian, isChecked);
              }),
          FilterTile(
              title: 'Vegan',
              subtitle: 'Only incluee vegan meals.',
              isValueSet: mapFilters[FilterMeal.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filterProvider.notifier)
                    .setFilter(FilterMeal.vegan, isChecked);
              }),
        ],
      ),
    );
  }
}
