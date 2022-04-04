import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Duration d = const Duration(seconds: 3);

    Timer(d, () {
      Navigator.of(context).pushReplacementNamed('homepage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.network(
                "https://i.fbcd.co/products/original/7a739b7ae8a855b40c524660061e54e2b6cfa1e80c8aca0f670530bda09cd874.jpg",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              const Text(
                "Get Your Area Location",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
