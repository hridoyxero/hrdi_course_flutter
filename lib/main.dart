import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_02/calculator.dart';
import 'package:hrdi_course_flutter/assignment_03/expenses_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Course, HRDI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExpensesScreen(),
    );
  }
}