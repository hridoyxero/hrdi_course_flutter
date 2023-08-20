import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/model/post_model.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/post_item.dart';
import 'package:hrdi_course_flutter/assignment_07/single_post_view.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {
  late List<String> _posts = [];

  final _db = FirebaseFirestore.instance;
  final _currentUser = FirebaseAuth.instance.currentUser;
  final _dbPosts = FirebaseFirestore.instance.collection('posts').snapshots();
  CollectionReference postRef = FirebaseFirestore.instance.collection('posts');

  // Method to get posts from firestore db
  void _getPosts() async {
    Utils.showLoadingDialog(context);

    _db.collection("posts").get().then((snapshot) {
      Navigator.pop(context);

      for (var data in snapshot.docs) {
        _posts.add(data.get("post_text"));
      }

      setState(() {});
    }).onError((error, stackTrace) {
      Navigator.pop(context);
      Utils.showErrorSnackbar(context, error.toString());
    });
  }

  @override
  void initState() {
    super.initState();

    // Future.microtask((){
    //   _getPosts();
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) => _getPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _dbPosts,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Something wrong");
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                debugPrint(snapshot.data!.docs[index]['id'].toString());
                return singlePostItem(
                  userName: _currentUser!.email.toString(),
                  caption: snapshot.data!.docs[index]['post_text'],
                  likes: snapshot.data!.docs[index]['likes'],
                  location: "Bangladesh",
                  isLiked: snapshot.data!.docs[index]['is_liked'],

                  onLikeTap: (){
                    _like(snapshot, index, context);

                    setState(() {

                    });
                  }, comments: []
                );
              },
            );
          }),
    );
  }

  void _like(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index, BuildContext context) {
    postRef.doc(snapshot.data!.docs[index]['id'].toString()).update({
      'likes': !snapshot.data!.docs[index]['is_liked'] ? snapshot.data!.docs[index]['likes'] + 1 : snapshot.data!.docs[index]['likes'] - 1,
      'is_liked': !snapshot.data!.docs[index]['is_liked'],
    }).then((value){
      Utils.showSnackbar(context, "Updated");
    });
  }
}
