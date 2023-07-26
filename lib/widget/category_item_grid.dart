import 'package:flutter/widgets.dart';
import 'package:meals_app/model/category_info.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({Key key, @required this.categoryInfo})
      : super(key: key);
  final Category categoryInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            categoryInfo.color.withOpacity(0.55),
            categoryInfo.color.withOpacity(0.9)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(categoryInfo.title),
    );
  }
}
