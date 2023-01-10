import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';

import '../Components/NavBar.dart';
import 'CourseList.dart';

class CourseHome extends StatefulWidget {
  List courseList;
  CourseHome({required this.courseList});
  @override
  State<CourseHome> createState() => _CourseHomeState(courseList: courseList);
}

class _CourseHomeState extends State<CourseHome> {
  List courseList;
  _CourseHomeState({required this.courseList});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot?>.value(

      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: HexColor("#4a68d9"),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: HexColor("#4169E1"),
          title: Text("Course Home",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Sarabun", fontSize: 24)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: CourseList(courses: courseList),
        ),
      ),
    );
  }
}
