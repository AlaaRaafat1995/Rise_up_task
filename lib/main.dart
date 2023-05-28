import 'package:flutter/material.dart';
import 'package:rise_up_task/UI/Pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rise Up Task",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
