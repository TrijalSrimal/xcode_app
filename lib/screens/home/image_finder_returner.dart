// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Components/constants.dart';
import '../Components/determinant.dart';
import '../Courses/Player.dart';

class Image_Find_Return extends StatefulWidget {
  const Image_Find_Return({Key? key}) : super(key: key);

  @override
  State<Image_Find_Return> createState() => _Image_Find_ReturnState();
}

class _Image_Find_ReturnState extends State<Image_Find_Return> {
  @override
  Widget build(BuildContext context) {
    Future <void> navigateToParent_player(context, String url, int startAt, int viewedDuration) async {
      Navigator.push(
          context,
          PageTransition(
            child: Parent_player(url: url, startAt: startAt,viewedDuration: viewedDuration,),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500),
          ));
    }
    final user =  Provider.of<DocumentSnapshot?>(context);

    Map<String, dynamic> data = {};
    if(user!= null) {
      data = user.data() as Map<String, dynamic>;
    } else
    {
      return const CircularProgressIndicator();
    }
    if(data['Last_Video_Url'] == "")
      {
        return Image.asset("images/continue.jpg");;
      }
    String url = data['Last_Video_Url'];
    String metadata = data['Last_Title'];
    int duration = data['Last_Duration'];
    int listid = int.parse(url.substring(url.lastIndexOf('=') + 1));
    String playid = url.substring(url.lastIndexOf("list=") + 5,url.lastIndexOf('\\'));
    //deviation is used so that acccurate position of video in duration can be identified, for more details, view determinant.dart
    int deviation = determinant(a: playid).diversion();
    int viewedDuration = data['POINT_ARRAY_DURATIONS'][listid-1+deviation];
    switch(playid)
    {
      case "PLfqMhTWNBTe3LtFWcvwpqTkUSlB32kJop": currentCourse = "Java DSA";break;
      case "PLfqMhTWNBTe3H6c9OGXb5_6wcc1Mca52n": currentCourse = "Web Development";break;
      case "PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ": currentCourse = "Flutter App Development";break;
      case "PLu0W_9lII9agwh1XjRt242xIpHhPT2llg": currentCourse = "Python";break;
      case "PLttcEXjN1UcGF_PCDUcQw2WOoh6MZtvWt": currentCourse = "Video Editing";break;
      case "PLYfCBK8IplO4X-jM1Rp43wAIdpP2XNGwP": currentCourse = "Photo Editing";break;
      case "PLYfCBK8IplO6v0QjCj-TSrFUXnRV0WxfE": currentCourse = "Illustrator";break;
      default: ;
    }

    return  ListTile(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: Image.network(YoutubeThumbnail(youtubeId: YoutubePlayer.convertUrlToId(url)).standard()
            ,errorBuilder: (context, error, stackTrace) {
              if(metadata == "") {
                return Image.asset("images/continue.jpg");
              } else
              {
                return Center(child: Text("No thumbnail availlable, click to resume $metadata", style: const TextStyle(fontSize: 24, fontFamily: "Sarabun")));
              }
            },),
        ),

        onTap: (){
          if(url.compareTo("")!=0)
          {
            navigateToParent_player(context, url, duration, viewedDuration);
          }
        });
  }
}
