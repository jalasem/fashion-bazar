import 'package:fashion_bazar/models/cart.dart';
import 'package:fashion_bazar/screens/home_screen.dart';
import 'package:fashion_bazar/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Cart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routes = {
      '/home': (context) => const HomeScreen(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const IntroScreen(),
    );
  }
}
