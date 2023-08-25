import 'package:flutter/material.dart';
import 'package:meals_app/widget/filter_tile.dart';

enum FilterMeal { glutenFree, lactosFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.mapFilters});
  final Map<FilterMeal, bool> mapFilters;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFreeSet = false;
  bool _isLactosFreeSet = false;
  bool _isVegetarian = false;
  bool _isVegan = false;
  
  @override
  void initState() {
    super.initState();
    _isGlutenFreeSet = widget.mapFilters[FilterMeal.glutenFree]!;
    _isLactosFreeSet = widget.mapFilters[FilterMeal.lactosFree]!;
    _isVegetarian = widget.mapFilters[FilterMeal.vegetarian]!;
    _isVegan = widget.mapFilters[FilterMeal.vegan]!;
  }
  
  @override
  Widget build(BuildContext context) {
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
        onWillPop:() async {
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
                setState(() {
                  _isGlutenFreeSet = isChecked;
                });
              }),
          FilterTile(
              title: 'Lactos-free',
              subtitle: 'Only incluee lactos-free meals.',
              isValueSet: _isLactosFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  _isLactosFreeSet = isChecked;
                });
              }),
          FilterTile(
              title: 'Vegetarian',
              subtitle: 'Only incluee vegetarian meals.',
              isValueSet: _isVegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _isVegetarian = isChecked;
                });
              }),
          FilterTile(
              title: 'Vegan',
              subtitle: 'Only incluee vegan meals.',
              isValueSet: _isVegan,
              onChanged: (isChecked) {
                setState(() {
                  _isVegan = isChecked;
                });
              }),
        ]),
      ),
    );
  }
}
