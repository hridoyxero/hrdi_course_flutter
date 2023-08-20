import 'package:flutter/material.dart';

Widget singlePostItem({
  required String userName,
  required String location,
  required String caption,
  required int likes,
  List<String>? comments,
  bool isLiked = false,
  required VoidCallback onLikeTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // User
      ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(userName),
        subtitle: Text(location),
        trailing: Icon(Icons.more_horiz),
      ),

      // Container(
      //   child: Image(image: NetworkImage(postModel.photoUrl)),
      // ),

      Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Text(caption)),

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
                InkWell(
                  onTap: onLikeTap,
                  child: Row(
                    children: [
                      Container(
                        child: Icon(
                          Icons.favorite, color: isLiked ? Colors.red : Colors.grey,),
                      ),
                      Text(likes.toString()),
                    ],
                  ),
                ),

                SizedBox(
                  width: 8,
                ),

                // Comments
                Icon(Icons.comment_sharp),

                SizedBox(
                  width: 8,
                ),

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

      //Write comment
      // Container(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 16,
      //   ),
      //   child: TextFormField(
      //     decoration: InputDecoration(
      //       hintText: "Comment here.."
      //     ),
      //   ),
      // ),

      //Comments
      // Container(child: CommentsWidget()),

      //Space after post
      Divider(),
    ],
  );
}

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
          child: Text("comment"),
        );
      },);
  }
}
