import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/screens/Components/NavBar.dart';
import 'package:untitled/screens/home/home.dart';
import '../Components/constants.dart' as c;
import 'Course_home.dart';


class Course_Options extends StatefulWidget {
  const Course_Options({Key? key}) : super(key: key);

  @override
  State<Course_Options> createState() => _Course_OptionsState();
}

class _Course_OptionsState extends State<Course_Options> {
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
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Courses"),
          ),
          body: Scrollbar(
            child: ListView(
              children: [
                  Column(
                    children: [
                      ListTile(
                          title: Text("Java"),
                          onTap: (){
                            showDialog(context: context, builder: (context)=>AlertDialog(
                              backgroundColor: Colors.black,
                              content: Container(
                                height: 0.5 * MediaQuery.of(context).size.width,
                                width: 0.5 * MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                        navigateToCourses(context, c.javacourses,);
                                      },
                                      child: Text("Course ",style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),),

                                    ),
                                    TextButton(
                                      onPressed: (){},
                                      child: Text("Questions  ",style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),),

                                    ),
                                    TextButton(
                                      onPressed: (){},
                                      child: Text("Doubts ",style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white
                                      ),),

                                    ),
                                  ],
                                ),
                              )
                            ),);
                          },
                        ),

                      ListTile(
                        title: Text("Web"),
                        onTap: (){
                          navigateToCourses(context, c.WebDev);
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
