// ignore_for_file: camel_case_types, file_names

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
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          appBar: AppBar(
            title: const Text("Coding And Development"  ,style: TextStyle(fontFamily: "Sarabun", color:Colors.white)),
            centerTitle: true,
          ),
          body: Scrollbar(
            child: ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                        title: Text("Java DSA", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/java.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          currentCourse = "Java DSA";
                          navigateToCourses(context, javacourses,);}
                    ),
                    ListTile(
                      title:  Text("Web Development", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/webdev.png"),
                      contentPadding: const EdgeInsets.all(20),

                      onTap: (){
                        currentCourse = "Web Development";
                        navigateToCourses(context, WebDev);
                      },
                    ),
                    ListTile(
                      title:  Text("   Flutter App Development", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/flutter.png"),
                      contentPadding: const EdgeInsets.all(20),
                      onTap: (){
                        currentCourse = "Flutter App Development";
                        navigateToCourses(context, Flutter);
                      },
                    ),
                    ListTile(
                        title:  Text("Python ", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/python.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          currentCourse = "Python";
                          navigateToCourses(context, Python,);}
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
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          appBar: AppBar(
            title: const Text("Designing and Editing",style: TextStyle(fontFamily: "Sarabun", color:Colors.white)),
            centerTitle: true,
          ),
          body: Scrollbar(
            child: ListView(
              children: [
                Column(
                  children: [
                    ListTile(
                        title:  Text(" Video Editing With Premiere", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        leading: Image.asset("images/premiere.png"),
                        contentPadding: const EdgeInsets.all(20),
                        onTap: (){
                          currentCourse = "Video Editing";
                          navigateToCourses(context, Premiere,);}
                    ),
                    ListTile(
                      title:  Text(" Photo Editing with Photoshop ", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/photoshop.png"),
                      contentPadding: const EdgeInsets.all(20),

                      onTap: (){
                        currentCourse = "Photo Editing";
                        navigateToCourses(context, Photoshop);
                      },
                    ),
                    ListTile(
                      title:  Text(" Graphic Design with Illustrator ", style: TextStyle(fontFamily: "Sarabun", color:Theme.of(context).colorScheme.primary,)),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      leading: Image.asset("images/illustrator.png"),
                      contentPadding: const EdgeInsets.all(20),

                      onTap: (){
                        currentCourse = "Illustrator";
                        navigateToCourses(context, Illustrator);
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
