import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Components/constants.dart';
import 'Course_home.dart';


class Course_Options extends StatefulWidget {
  const Course_Options({Key? key}) : super(key: key);

  @override
  State<Course_Options> createState() => _Course_OptionsState();
}

class _Course_OptionsState extends State<Course_Options> {
  Future<void> navigateToCourses(context, List courses,) async {
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
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Courses"),
          ),
          body: Scrollbar(
            child: ListView(
              children: [
                  Column(
                    children: [
                      ListTile(
                          title: const Text("Java DSA"),
                          onTap: (){
                                currentCourse = "Java DSA";
                                        navigateToCourses(context, javacourses,);}
                              ),
                      ListTile(
                        title: const Text("Web Development"),
                        onTap: (){
                          currentCourse = "Web Development";
                          print(currentCourse);
                          navigateToCourses(context, WebDev);
                        },
                      ),
                      ListTile(
                        title: const Text("Flutter App Development"),
                        onTap: (){
                          currentCourse = "Flutter App Development";
                          navigateToCourses(context, Flutter);
                        },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        )
    );
  }
}
