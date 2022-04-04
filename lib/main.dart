import 'package:flutter/material.dart';
import 'package:wether_project/screens/drawer.dart';
import 'package:wether_project/screens/splash.dart';
import 'package:wether_project/screens/weather.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'homepage': (context) => const HomePage(),
        'drawer': (context) => const MyDrawer(),
        'splash': (context) => const SplashScreen(),
      },
    ),
  );
}
