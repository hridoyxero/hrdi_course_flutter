import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_04/contacts_screen.dart';
import 'package:hrdi_course_flutter/assignment_04/dice_roller_screen.dart';
import 'package:hrdi_course_flutter/assignment_04/music_player_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment 04"),
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MusicPlayerScreen()));
            }, child: Text("Music Player".toUpperCase())),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsScreen()));
            }, child: Text("Contacts".toUpperCase()),),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DiceRollerScreen()));
            }, child: Text("Dice Roller".toUpperCase())),
          ],
        ),
      ),
    );;
  }
}
