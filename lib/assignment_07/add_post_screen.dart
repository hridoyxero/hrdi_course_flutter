import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_07/posts_view.dart';
import 'package:hrdi_course_flutter/components/submit_button.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String _post = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              SizedBox(height: 32,),

              // Post Input
              TextFormField(
                onChanged: (value) {
                  setState(() {});

                  _post = value;
                },
                minLines: 6,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Write Here..",
                  // labelText: "New",
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: 16,),

              // Add button
              submitButton(title: "Add", onTap: (){
                _addPost(_post);
              }),

              SizedBox(height: 16,),

              // Cancel button
              submitButton(title: "Cancel", color: Colors.red, onTap: (){
                Navigator.pop(context);
              }),
            ],
          ),
        ),
      ),
    );
  }

  void _addPost(String post) {
    try{
      // Loading
      Utils.showLoadingDialog(context, "Posting..");
      Utils.waitUntil(1);

      // Current User
      final user = FirebaseAuth.instance.currentUser;

      // db
      final collection = FirebaseFirestore.instance.collection("posts");

      // debugPrint(user!.email.toString());

      final postId = DateTime.now().millisecondsSinceEpoch.toString();
      // post
      final data = {
        'id': postId,
        'user_id': user!.uid,
        'user_name': user.email,
        'post_text': post,
        'is_liked': false,
        'likes': 0,
        'comments': 0,
        'shares': 0,
        'time' : Utils.getCurrentTime(),
      };

      collection.doc(postId).set(data).then((value){
        Navigator.pop(context);
        Navigator.pop(context);
        Utils.showSuccessSnackbar(context, "Posted");
      }).onError((error, stackTrace){
        Navigator.pop(context);
        Utils.showErrorSnackbar(context, "Failed to create " + error.toString());
      }).catchError((error, stackTrace){
        Navigator.pop(context);
        Utils.showErrorSnackbar(context, "Failed");
      });

      // add to collection
      // collection.add(data).then((value){  // success
      //   Navigator.pop(context);
      //   Navigator.pop(context);
      //   // Utils.replaceScreen(context, PostsView());
      // }).onError((error, stackTrace){
      //   Navigator.pop(context);
      //   Utils.showErrorSnackbar(context, "Failed to create " + error.toString());
      // }).catchError((error, stackTrace){
      //   Navigator.pop(context);
      //   Utils.showErrorSnackbar(context, "Failed");
      // });
    }catch(e){
      Navigator.pop(context);
      Utils.showErrorSnackbar(context, e.toString());
    }
  }
}
