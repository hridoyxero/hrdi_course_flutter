import 'package:flutter/material.dart';
import 'package:hrdi_course_flutter/assignment_04/person.dart';


class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);


  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}


class _ContactsScreenState extends State<ContactsScreen> {
  List<Person> people = [
    Person(name: "Mr. A", age: 23, occupation: "Bekar"),
    Person(name: "Mr. B", age: 23, occupation: "Service Holder"),
    Person(name: "Mr. C", age: 23, occupation: "Engineer"),
    Person(name: "Mr. D", age: 23, occupation: "Doctor"),
    Person(name: "Mr. E", age: 23, occupation: "Bekar"),
    Person(name: "Mr. F", age: 23, occupation: "Bekar"),
    Person(name: "Mr. G", age: 23, occupation: "Bekar"),
    Person(name: "Mr. H", age: 23, occupation: "Bekar"),
    Person(name: "Mr. I", age: 23, occupation: "Bekar"),
    Person(name: "Mr. J", age: 23, occupation: "Bekar"),
    Person(name: "Mr. K", age: 23, occupation: "Bekar"),
    Person(name: "Mr. L", age: 23, occupation: "Bekar"),
    Person(name: "Mr. M", age: 23, occupation: "Bekar"),
    Person(name: "Mr. N", age: 23, occupation: "Bekar"),
    Person(name: "Mr. O", age: 23, occupation: "Bekar"),
    Person(name: "Mr. P", age: 23, occupation: "Bekar"),
    Person(name: "Mr. Q", age: 23, occupation: "Bekar"),
    Person(name: "Mr. R", age: 23, occupation: "Bekar"),
    Person(name: "Mr. S", age: 23, occupation: "Bekar"),
    Person(name: "Mr. T", age: 23, occupation: "Bekar"),
    Person(name: "Mr. U", age: 23, occupation: "Bekar"),
    Person(name: "Mr. V", age: 23, occupation: "Bekar"),
    Person(name: "Mr. W", age: 23, occupation: "Bekar"),
    Person(name: "Mr. X", age: 23, occupation: "Bekar"),
    Person(name: "Mr. Y", age: 23, occupation: "Bekar"),
    Person(name: "Mr. Z", age: 23, occupation: "Bekar"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16,),
                        decoration: BoxDecoration(
                            border: Border.all(color:  Colors.grey, width: 1,)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
//Photo- left
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(Icons.person),
                              ),
                            ),


//Info- right
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      people.elementAt(index).name,
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      people.elementAt(index).age.toString(),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      people.elementAt(index).occupation,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                      SizedBox(height: 8,),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}