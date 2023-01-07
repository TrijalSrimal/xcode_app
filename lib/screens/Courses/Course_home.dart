import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';
import 'package:untitled/screens/Components/constants.dart' as c;
import 'package:untitled/screens/Courses/Player.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/NavBar.dart';
import '../Components/course_player.dart';

class CourseHome extends StatefulWidget {
  const CourseHome({Key? key}) : super(key: key);

  @override
  State<CourseHome> createState() => _CourseHomeState();
}

class _CourseHomeState extends State<CourseHome> {
  Future<void> navigateToParent_player(context, String url) async {
    Navigator.push(
        context,
        PageTransition(
          child: Parent_player(url: url),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> url = c.javacourses.map((Event) {
      return ListTile(
          title: Image.network(
              YoutubeThumbnail(youtubeId: YoutubePlayer.convertUrlToId(Event)!)
                  .standard()),
          onTap: () => navigateToParent_player(context, Event));
    }).toList();
    return StreamProvider<DocumentSnapshot?>.value(
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: HexColor("#4a68d9"),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: HexColor("#4169E1"),
          title: Text("Courses",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Sarabun", fontSize: 24)),
          centerTitle: true,
        ),
        drawer: NavBar(),
        body: SingleChildScrollView(
          child: Column(children: url),
        ),
      ),
    );
  }
}
