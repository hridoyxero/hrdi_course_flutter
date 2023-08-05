import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_a/login_screen.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/chats_view.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/feeds_view.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/model/post_model.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/post_item.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/profile_view.dart';
import 'package:hrdi_course_flutter/res/app_colors.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  final _views = [
    FeedsView(),
    ChatsView(),
    ProfileView(),
  ];
  int _selectedViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentScreen == 0 ? "Feeds" : (currentScreen == 1 ? "Chats" : currentScreen == 2 ? "Profile" : "")),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_rounded),
          SizedBox(
            width: 16,
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout();
            },
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      drawer: NavigationDrawer(
        children: [],
      ),
      body: _views[_selectedViewIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems,
        currentIndex: _selectedViewIndex,
        selectedItemColor: AppColors.primary,
        onTap: (index){
          _selectedViewIndex = index;

          currentScreen = index;

          setState(() {

          });
        },
      ),
    );
  }

  void _logout() async {
    Utils.showLoadingDialog(context, "Logging Out . .");
    await FirebaseAuth.instance.signOut();
    await Future.delayed(Duration(seconds: 1));
    Utils.replaceScreen(context, LoginScreen());
    Utils.showSuccessSnackbar(context, "Logged Out");
  }
}
