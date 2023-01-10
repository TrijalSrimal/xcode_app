
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/screens/Components/NavBar.dart';
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
          title: Text("Courses", style: TextStyle(color: Colors.white, fontSize: 24,fontFamily: "Sarabun")),
          backgroundColor: HexColor("#4169E1"),
          elevation: 0,
          centerTitle: true,
        ),
        drawer: NavBar(),
        body:Column(
          children:
            [
              SizedBox(height: 30),
              Row(
                  children: <Widget>[
                    const Expanded(
                        child: Divider(thickness: 2,color: Colors.black)
                    ),

                    Text("  Coding And Development  ", style: TextStyle(
                      color: HexColor("#4169E1"),
                      fontFamily: "Sarabun",
                      fontSize: 24,
                    )),

                    const Expanded(
                        child: Divider(thickness: 2,color: Colors.black)
                    ),
                  ]
              ),
              SizedBox(height:30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:
                  [
                    Container(
                      child: Center(child: TextButton(onPressed:(){navigateToCourses(context, c.javacourses);},child: Text("Java Programming", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun")))),
                      width: 150,
                      height: 110,
                      decoration: BoxDecoration(
                        color: HexColor("#4169E1"),
                        ),
                      ),
                    SizedBox(width:30),
                    Container(
                      child: Center(child: TextButton(onPressed:(){navigateToCourses(context, c.WebDev);},child: Text("Web Development", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun")))),
                      width: 150,
                      height: 110,
                      decoration: BoxDecoration(
                        color: HexColor("#4169E1"),
                      ),
                    ),
                  ]
              ),
              SizedBox(height:30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    child: Center(child: TextButton(onPressed:(){navigateToCourses(context, c.Flutter);},child: Text("App Development", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun")))),
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: HexColor("#4169E1"),
                    ),
                  ),
                ]
              ),
              SizedBox(height:30),
              Row(
                  children: <Widget>[
                    const Expanded(
                        child: Divider(thickness: 2,color: Colors.black)
                    ),

                    Text("  Editing Skills  ", style: TextStyle(
                      color: HexColor("#4169E1"),
                      fontFamily: "Sarabun",
                      fontSize: 24,
                    )),

                    const Expanded(
                        child: Divider(thickness: 2,color: Colors.black)
                    ),
                  ]
              ),
              SizedBox(height:30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    child: Center(child: Text("Video Editing", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun"))),
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: HexColor("#4169E1"),
                    ),
                  ),
                  SizedBox(width:30),
                  Container(
                    child: Center(child: TextButton(onPressed: (){} ,child: Text("Graphic Design", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun")))),
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: HexColor("#4169E1"),
                    ),
                  ),
                ]
              ),
              SizedBox(height:30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    child: Center(child: Text("UI/UX Design", style: TextStyle(color: Colors.white, fontSize: 15,fontFamily: "Sarabun"))),
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: HexColor("#4169E1"),
                    ),
                  ),
                ]
              ),
            ]
        )
      ),
    );
  }
}
