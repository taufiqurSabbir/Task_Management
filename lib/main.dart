import 'package:flutter/material.dart';
import 'package:task_management/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
