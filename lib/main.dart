import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screen/Categories.dart';

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
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Categories(),
    );
  }
}
