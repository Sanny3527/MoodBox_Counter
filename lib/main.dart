import 'package:flutter/material.dart';
import 'home_screen.dart';

void main()
{
  runApp(MoodBox());
}

class MoodBox extends StatelessWidget {
  const MoodBox({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
