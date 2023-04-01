// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';
import 'package:untitled/screens/Components/constants.dart';
import 'package:untitled/screens/Courses/faqscreen.dart';
import 'CourseList.dart';

class CourseHome extends StatefulWidget {
  final List courseList;
  const CourseHome({super.key, required this.courseList});
  @override
  // ignore: no_logic_in_create_state
  State<CourseHome> createState() => _CourseHomeState(courseList: courseList);
}

class _CourseHomeState extends State<CourseHome> {
  List courseList;
  // ignore: non_constant_identifier_names
  List course_question = [];
  _CourseHomeState({required this.courseList});

  @override
  Widget build(BuildContext context) {
    if(courseList[1] == javacourses[1])
    {
      course_question = JavaFAQ;
    }
    if(courseList[1] == WebDev[1])
    {
      course_question = WebFAQ;
    }
    if(courseList[1] == Python[1])
    {
      course_question = PythonFAQ;
    }
    if(courseList[1] == Flutter[1])
    {
      course_question = flutterFAQ;
    }
    if(courseList[1] == Photoshop[1])
    {
      course_question = PhotoshopFAQ;
    }
    if(courseList[1] == Premiere[1])
    {
      course_question = PremiereFAQ;
    }
    if(courseList[1] == Illustrator[1])
    {
      course_question = IllustratorFAQ;
    }
    return StreamProvider<DocumentSnapshot?>.value(

      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          title: const Text("Course Home",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Sarabun", fontSize: 24)),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.question_mark),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Doubts(questions: course_question,)));
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: CourseList(courses: courseList),
        ),
      ),
    );
  }
}