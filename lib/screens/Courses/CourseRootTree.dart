// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/screens/Components/NavBar.dart';
import 'package:untitled/screens/Courses/Course_page.dart';
import 'Course_home.dart';

class CourseRoot extends StatefulWidget {
  const CourseRoot({Key? key}) : super(key: key);

  @override
  State<CourseRoot> createState() => _CourseRootState();
}

class _CourseRootState extends State<CourseRoot> {
  Future<void> navigateToCourses(context, List courses) async {
    Navigator.push(
        context,
        PageTransition(
          child: CourseHome(courseList: courses),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        appBar: AppBar(
          title: const Text("Courses",
              style: TextStyle(
                  color: Colors.white, fontSize: 24, fontFamily: "Sarabun")),
          elevation: 10,
          centerTitle: true,
        ),
        drawer: const NavBar(),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  const Expanded(child: Divider(thickness: 2, color: Colors.white)),
                  Text("  Coding And Development  ",
                      style: TextStyle(
                        color:Theme.of(context).colorScheme.primary,
                        fontFamily: "Sarabun",
                        fontSize: 24,
                      )),
                  const Expanded(child: Divider(thickness: 2, color: Colors.white)),
                ]),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Course_Options()));

                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                  height: 0.6 * MediaQuery.of(context).size.width,
                                  child: const Image(image: AssetImage("images/coding.png"), fit: BoxFit.cover)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  const Expanded(child: Divider(thickness: 2, color: Colors.white)),
                  Text("  Designing and Editing  ",
                      style: TextStyle(
                        color:Theme.of(context).colorScheme.primary,
                        fontFamily: "Sarabun",
                        fontSize: 24,
                      )),
                  const Expanded(child: Divider(thickness: 2, color: Colors.white)),
                ]),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Course_Options_Editing()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                height: 0.6 * MediaQuery.of(context).size.width,
                                child: const Image(image: AssetImage("images/editing.png"), fit: BoxFit.cover)
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
              ]),
        ));
  }
}