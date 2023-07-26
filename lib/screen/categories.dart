import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widget/category_item_grid.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        children: DummyData.availableCategories
            .map((e) => CategoryGridItem(categoryInfo: e))
            .toList(),
      ),
    );
  }
}
