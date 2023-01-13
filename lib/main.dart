import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/home_screen.dart';

void main() => runApp(const MyPomodoroApp());

class MyPomodoroApp extends StatelessWidget {
  const MyPomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff252b52),
        backgroundColor: const Color(0xffe7626c),
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Color(0xff232b55),
          ),
        ),
        cardColor: const Color(0xfff4eddb),
      ),
      home: const HomeScreen(),
    );
  }
}
