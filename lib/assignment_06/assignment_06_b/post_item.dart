import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel postModel;

  const PostItem({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // User
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.person),
          ),
          title: Text(postModel.userName),
          subtitle: Text(postModel.location),
          trailing: Icon(Icons.more_horiz),
        ),

        Container(
          child: Image(image: NetworkImage(postModel.photoUrl)),
        ),

        SizedBox(
          height: 8,
        ),

        // Loves, comments, bookmarks, share
        Container(
          padding: EdgeInsets.only(
            left: 16,
            top: 4,
            bottom: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Loves
                  Icon(Icons.favorite),

                  SizedBox(width: 8,),

                  // Comments
                  Icon(Icons.comment_sharp),

                  SizedBox(width: 8,),

                  // Bookmarks
                  Icon(Icons.bookmark),
                ],
              ),

              // Share
              Container(
                padding: EdgeInsets.only(
                  right: 16,
                ),
                child: Icon(Icons.share),
              ),
            ],
          ),
        ),

        //Space after post
        Divider(),
      ],
    );
  }
}
