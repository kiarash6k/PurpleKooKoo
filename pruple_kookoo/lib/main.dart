import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Widest the app gets on tablets and web before it centres itself.
  static const double maxContentWidth = 600;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Purple KooKoo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ColoredBox(
        color: const Color.fromARGB(255, 24, 14, 86),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxContentWidth),
            child: child,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
