import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_04/home_screen.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_a/login_screen.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hrdi_course_flutter/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LoginScreen(),
    );
  }
}