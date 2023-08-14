import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories.dart';
import 'package:meals_app/screen/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  Widget selectedWidget = Categories();
  String title = '';
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (selectedIndex == 1) {
      selectedWidget = MealsScreen(meals: [],);
      title = 'Favorites';
    }
    else {
      selectedWidget = Categories();
      title = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: selectedWidget,
      bottomNavigationBar: BottomNavigationBar(onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories',),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites',),
      ],
      ), 
    );
  }
}