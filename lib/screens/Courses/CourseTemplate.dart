import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Course_home.dart';

class CourseTemplate extends StatefulWidget {
  List videos;
  CourseTemplate({required this.videos});


  State<CourseTemplate> createState() => _CourseTemplateState(videos: videos);
}

class _CourseTemplateState extends State<CourseTemplate> {
  List videos;
  _CourseTemplateState({required this.videos});
  @override
  Widget build(BuildContext context) {
    Future<void> navigateToCourses(context, List courses) async {
      Navigator.push(
          context,
          PageTransition(
            child: CourseHome(courseList: courses),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500),
          ));
    }
    return Scaffold(
      body: Column(
        children:[
          ListTile(
            title: Text("Video"),
            onTap: (){navigateToCourses(context, videos);},
          ),
          ListTile(
            title: Text("Questions"),
            onTap: (){},
          ),
          ListTile(
            title: Text("Doubts"),
            onTap: (){},
          )
        ]
      )
    );
  }
}
