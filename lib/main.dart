// ignore_for_file: prefer_const_constructors
import 'package:conversor/app/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      color: Colors.amber,
      home: HomeView(),
    );
  }
}
