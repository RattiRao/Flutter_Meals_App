import 'package:flutter/material.dart';
import 'package:meals_app/model/category_info.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.categoryInfo, required this.didSelectCategory});
  final Category categoryInfo;
  final void Function() didSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: didSelectCategory,
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              categoryInfo.color.withOpacity(0.55),
              categoryInfo.color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(categoryInfo.title, softWrap: true,),
      ),
    );
  }
}
