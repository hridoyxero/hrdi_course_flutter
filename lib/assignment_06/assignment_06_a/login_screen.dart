import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_a/signup_screen.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/home_screen.dart';
import 'package:hrdi_course_flutter/res/app_colors.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  "Login",
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
                      _login(_email, _password);
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
                        "Login".toUpperCase(),
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text("New Here? Create Account")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _login(String emailAddress, String password) async {
    Utils.showLoadingDialog(context, "Logging In . .");
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((value) {
        debugPrint("logged in ");
        Utils.replaceScreen(context, HomeScreen());

        Utils.showSuccessSnackbar(context, "Logged In");
      });
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();

      if (e.code == 'user-not-found') {
        Utils.showErrorSnackbar(context, "No user found for that email.");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Utils.showErrorSnackbar(
            context, "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      }
    }
  }
}
