import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/model/post_model.dart';
import 'package:hrdi_course_flutter/assignment_06/assignment_06_b/post_item.dart';
import 'package:hrdi_course_flutter/utils/utils.dart';

class FeedsView extends StatefulWidget {
  const FeedsView({super.key});

  @override
  State<FeedsView> createState() => _FeedsViewState();
}

class _FeedsViewState extends State<FeedsView> {
  late List<PostModel> posts;

  @override
  void initState() {
    super.initState();

    posts = [
      PostModel(
        "Rachel Goodman",
        "New York, USA",
        "userProfilePhotoUrl",
        "caption",
        "https://img.freepik.com/free-photo/mexican-tacos-with-beef-tomato-sauce-salsa_2829-14218.jpg?size=626&ext=jpg",
        0,
        0,
        0,
        DateTime.now().toString(),
      ),
      PostModel(
        "John Michael",
        "New York, USA",
        "userProfilePhotoUrl",
        "caption",
        "https://img.freepik.com/free-photo/pizza-pizza-filled-with-tomatoes-salami-olives_140725-1200.jpg?w=826&t=st=1691208789~exp=1691209389~hmac=438d66e9b83f4667922ac70931eb4d4fca5f8646c65a3b81f33f7ceeae60cfae",
        0,
        0,
        0,
        DateTime.now().toString(),
      ),
      PostModel(
        "Pattrick Rich",
        "New York, USA",
        "userProfilePhotoUrl",
        "caption",
        "https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19739.jpg?size=626&ext=jpg",
        0,
        0,
        0,
        DateTime.now().toString(),
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostItem(postModel: posts[index]);
        },
      ),
    );
  }
}
