import 'package:flutter/material.dart';

enum ScreenType { Categories, Filters }

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(ScreenType identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 48,
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 24,
                ),
          ),
          onTap: () {
            onSelectScreen(ScreenType.Categories);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
          ),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 24,
                ),
          ),
          onTap: () {
            onSelectScreen(ScreenType.Filters);
          },
        ),
      ],
    ));
  }
}
