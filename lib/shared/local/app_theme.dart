import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme{
  ThemeData getTheme(bool isDark){
    if(isDark){
      return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.white,
            )),
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.black,
          unselectedItemColor:Colors.grey,
          selectedItemColor: Colors.blue,
        ),
      );
    }else{
      return ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              color: Colors.black,
            )),
        appBarTheme: const AppBarTheme(
            color: Colors.white,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            )),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          unselectedItemColor:Colors.grey,
          selectedItemColor: Colors.blue,
        ),
      );
    }
  }
}