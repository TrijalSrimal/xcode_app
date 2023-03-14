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
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/X_CODE.jpg"),
                        contentPadding: EdgeInsets.all(20),
                        onTap: (){
                          currentCourse = "Java DSA";
                          navigateToCourses(context, javacourses,);}
                    ),
                    ListTile(
                      title: const Text("Web Development"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/X_CODE.jpg"),
                      contentPadding: EdgeInsets.all(20),

                      onTap: (){
                        currentCourse = "Web Development";
                        print(currentCourse);
                        navigateToCourses(context, WebDev);
                      },
                    ),
                    ListTile(
                      title: const Text("Flutter App Development"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/X_CODE.jpg"),
                      contentPadding: EdgeInsets.all(20),
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

class Course_Options_Editing extends StatefulWidget {
  const Course_Options_Editing({Key? key}) : super(key: key);

  @override
  State<Course_Options_Editing> createState() => _Course_Options_EditingState();
}

class _Course_Options_EditingState extends State<Course_Options_Editing> {

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
                        title: const Text(" Video Editing "),
                        trailing: Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/X_CODE.jpg"),
                        contentPadding: EdgeInsets.all(20),
                        onTap: (){
                          currentCourse = "Java DSA";
                          navigateToCourses(context, javacourses,);}
                    ),
                    ListTile(
                      title: const Text(" Photo Editing "),
                      trailing: Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/X_CODE.jpg"),
                      contentPadding: EdgeInsets.all(20),

                      onTap: (){
                        currentCourse = "Web Development";
                        print(currentCourse);
                        navigateToCourses(context, WebDev);
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

