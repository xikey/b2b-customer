import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: "Estedad",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      // bodyMedium: TextStyle(
      //     fontFamily: "Estedad", fontSize: 15, fontWeight: FontWeight.w400),
    ),
    // highlightColor: Colors.indigo,
    // backgroundColor: Colors.black,
    // canvasColor: Colors.grey,
    // unselectedWidgetColor: Colors.white70,
    // primaryColorLight: Color.fromRGBO(252, 178, 98, 1),
    // scaffoldBackgroundColor: Colors.grey.shade900,
    // primaryColor: Colors.amber.shade800,
    // indicatorColor: Colors.amber,
    // secondaryHeaderColor: Color.fromRGBO(176, 106, 2, 1),
    // iconTheme: IconThemeData(color: Colors.amber.shade800),
    // textSelectionTheme: const TextSelectionThemeData(
    //   cursorColor: Colors.red,
    //   selectionColor: Colors.green,
    //   selectionHandleColor: Colors.blue,
    // )
    // colorScheme: const ColorScheme.dark()
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.lightGreen,
      primary: Colors.lightGreen,
      onPrimary: Colors.green,
      secondary: Colors.green,
      onSecondary: Colors.green,
      // ···
      brightness: Brightness.light,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hoverColor: Colors.green, // Change this color to your preference
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontFamily: 'Estedad',
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      toolbarTextStyle: TextStyle(
        fontFamily: 'Estedad',
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor:
          Colors.lightGreen, // Change this color to your preference
    ),
    textTheme: Typography().black.apply(fontFamily: 'Estedad'),
    useMaterial3: true,
    fontFamily: 'Estedad',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.blue, // Change this color to your preference
      selectionColor: Colors.blue, // Change this color to your preference
      selectionHandleColor: Colors.blue, // Change this color to your preference
    ),

    // colorScheme: const ColorScheme.light()
  );
}
