import 'package:flutter/material.dart';

int currentScreen = 0;

class Utils {
  static void navigateScreen(BuildContext context, Widget desiredScreen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => desiredScreen));
  }
  static void replaceScreen(BuildContext context, Widget desiredScreen){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => desiredScreen));
  }
  static void showLoadingDialog(BuildContext context,
      [String title = "Loading"]) {
    AlertDialog alertDialog = AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 8,
            ),
            Text(title),
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return alertDialog;
      },
    );
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void showSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
