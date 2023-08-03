import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories.dart';
// import 'package:google_fonts/google_fonts.dart';

// final theme = ThemeData(
//   // colorScheme: ColorScheme.from(
//   //   brightness: Brightness.dark,
//   //   seedColor: const Color.fromARGB(255, 131, 57, 0),
//   // ),
//   textTheme: GoogleFonts.latoTextTheme(),
// );

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Categories(),
    );
  }
}
