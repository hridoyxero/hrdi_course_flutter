import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_a/login_screen.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/home_screen.dart';
import 'package:hrdi_course_flutter/res/app_colors.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Container(
            //   height: 100,
            //   decoration: BoxDecoration(
            //       color: AppColors.primary.withOpacity(0.5),
            //       borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(32)
            //       )
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "B",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),

                SizedBox(
                  height: 32,
                ),
                // Title
                Text(
                  "Create Account",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 32,
                ),

                // Input Email
                Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});

                      _email = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "example@email.com",
                      labelText: "Email",
                    ),
                  ),
                ),

                SizedBox(
                  height: 8,
                ),

                // Input Password
                Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {});

                      _password = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "******",
                      labelText: "Password",
                    ),
                    obscureText: true,
                  ),
                ),

                SizedBox(
                  height: 32,
                ),

                // Login Button
                Container(
                  margin: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: InkWell(
                    onTap: () {
                      debugPrint("email: " + _email);
                      debugPrint("pass: " + _password);
                      _signup(_email, _password);
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedScreen()));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Signup".toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                // Login Text button
                TextButton(
                    onPressed: () {
                      Utils.replaceScreen(context, LoginScreen());
                    },
                    child: Text("Have Account? Login")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signup(String emailAddress, String password) async {
    Utils.showLoadingDialog(context, "Creating Account . .");
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((value) {
        Utils.replaceScreen(context, HomeScreen());
        Utils.showSuccessSnackbar(context, "Account created");
        debugPrint("account created");
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'weak-password') {
        Utils.showErrorSnackbar(context, "The password provided is too weak.");
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Utils.showErrorSnackbar(
            context, "The account already exists for that email.");
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      Utils.showErrorSnackbar(context, "Failed");
      debugPrint(e.toString());
    }
  }
}
