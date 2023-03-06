import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/screens/Components/NavBar.dart';
import 'package:untitled/screens/Courses/Course_page.dart';
import 'package:untitled/screens/home/home.dart';
import '../Components/constants.dart' as c;
import 'Course_home.dart';

class CourseRoot extends StatefulWidget {
  const CourseRoot({Key? key}) : super(key: key);

  @override
  State<CourseRoot> createState() => _CourseRootState();
}

class _CourseRootState extends State<CourseRoot> {
  @override
  Future<void> navigateToCourses(context, List courses) async {
    Navigator.push(
        context,
        PageTransition(
          child: CourseHome(courseList: courses),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Courses",
                style: TextStyle(
                    color: Colors.white, fontSize: 24, fontFamily: "Sarabun")),
            elevation: 10,
            centerTitle: true,
          ),
          drawer: NavBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            SizedBox(height: 30),
            Row(children: <Widget>[
              const Expanded(child: Divider(thickness: 2, color: Colors.black)),
              Text("  Coding And Development  ",
                  style: TextStyle(
                    color: HexColor("#4169E1"),
                    fontFamily: "Sarabun",
                    fontSize: 24,
                  )),
              const Expanded(child: Divider(thickness: 2, color: Colors.black)),
            ]),
            SizedBox(height: 30),
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
                        Container(
                          height: 0.4 * MediaQuery.of(context).size.width,
                          width: 0.4 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: AssetImage("images/X_CODE.jpg"),
                              fit: BoxFit.contain,
                            )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(children: <Widget>[
              const Expanded(child: Divider(thickness: 2, color: Colors.black)),
              Text("  Editing Skills  ",
                  style: TextStyle(
                    color: HexColor("#4169E1"),
                    fontFamily: "Sarabun",
                    fontSize: 24,
                  )),
              const Expanded(child: Divider(thickness: 2, color: Colors.black)),
            ]),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: InkWell(
                    onTap: (){
                                          },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.4 * MediaQuery.of(context).size.width,
                          width: 0.4 * MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: AssetImage("images/X_CODE.jpg"),
                                fit: BoxFit.contain,
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
                SizedBox(height: 80),
          ])),
    );
  }
}
