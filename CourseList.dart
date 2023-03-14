import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/determinant.dart';
import 'Player.dart';

class CourseList extends StatefulWidget {
  List courses;
  CourseList({required this.courses});


  @override
  State<CourseList> createState() => _CourseListState(courses: courses);
}

class _CourseListState extends State<CourseList> {
  Future<void> navigateToParent_player(context, String url, int seconds) async {

    Navigator.push(
        context,
        PageTransition(
          child: Parent_player(url: url, startAt: seconds,),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
  List courses;
  _CourseListState({required this.courses});

  @override
  Widget build(BuildContext context) {
    final user =  Provider.of<DocumentSnapshot?>(context);

    Map<String, dynamic> data = new Map();
    if(user!= null)
      data = user?.data() as Map<String, dynamic>;
    List<Widget> url = courses.map((inputurl) {
      return ListTile(
          title: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
                YoutubeThumbnail(youtubeId: YoutubePlayer.convertUrlToId(inputurl)!)
                    .standard()
                ,errorBuilder: (context, error, stackTrace) {
      return Image.network("https://thumbs.dreamstime.com/b/not-available-red-rubber-stamp-over-white-background-87242466.jpg");}),
          ),
          onTap: () {
            int listid = int.parse(inputurl.substring(inputurl.lastIndexOf('=') + 1));
            String playid = inputurl.substring(inputurl.lastIndexOf("list=") + 5,inputurl.lastIndexOf('\\'));
            int deviation = determinant(a: playid).diversion();
            int seconds = data['DURATION'][listid-1+deviation];
      navigateToParent_player(context, inputurl, seconds);
      });
          }).toList();
    return Column(
      children:url,

    );
  }
}
