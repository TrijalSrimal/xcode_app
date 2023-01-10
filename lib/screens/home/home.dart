import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Components/NavBar.dart';
import '../Courses/Player.dart';
import '../Components/constants.dart' as c;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
    Widget build(BuildContext context) {
    Future <void> navigateToParent_player(context, String url, int startAt) async {
      Navigator.push(
          context,
          PageTransition(
            child: Parent_player(url: url, startAt: startAt,),
            type: PageTransitionType.fade,
            duration: const Duration(milliseconds: 500),
          ));
    }

    return StreamProvider<DocumentSnapshot?>.value(
        value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
        initialData: null,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: HexColor("#4169E1"),
              appBar: AppBar(
                backgroundColor: HexColor("#4169E1"),
                elevation: 0,
                toolbarHeight: 20,
              ),
              drawer: NavBar(),
              body: Container(
                child: Column(
                  children: [
                    Flexible(
                      flex:1,
                      child: Column(children: [
                        Center(
                          child: CircleAvatar(
                            radius:50,
                            child: ClipOval(
                              child: Image.asset(
                                'images/X_CODE.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height:8),
                        Center(child: Text("Hi ${FirebaseAuth.instance.currentUser!.displayName},", style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Sarabun",
                          fontSize: 20,
                        )),),
                        const SizedBox(height:6),
                        const Center(child: Text("It's a great day to learn!", style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        )),),
                        const SizedBox(height:30),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                            ),

                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[

                                  const SizedBox(height: 30),
                                  Center(
                                    child: Text("  The key to become best at anything ", style: TextStyle(
                                      color: HexColor("#000000"),
                                      fontFamily: "Sarabun",
                                      fontSize: 24,
                                    )),
                                  ),
                                  Center(
                                    child: Text("is consistency. Therefore, ", style: TextStyle(
                                      color: HexColor("#000000"),
                                      fontFamily: "Sarabun",
                                      fontSize: 24,
                                    )),
                                  ),
                                  const SizedBox(height: 10),
                                  Center(
                                    child: Text("while(!(succeed = try()));", style: TextStyle(
                                      color: HexColor("#000000"),
                                      fontFamily: "Sarabun",
                                      fontSize: 24,
                                    )),
                                  ),
                                  const SizedBox(height: 50),

                                  Row(
                                      children: <Widget>[
                                        const Expanded(
                                            child: Divider(thickness: 2,color: Colors.black)
                                        ),

                                        Text("  Continue Watching  ", style: TextStyle(
                                          color: HexColor("#4169E1"),
                                          fontFamily: "Sarabun",
                                          fontSize: 24,
                                        )),

                                        const Expanded(
                                            child: Divider(thickness: 2,color: Colors.black)
                                        ),
                                      ]
                                  ),
                                  const SizedBox(height:20),
                                  ListTile(
                                      title: Image.network( c.url.compareTo("")==0? "https://thumbs.dreamstime.com/b/not-available-red-rubber-stamp-over-white-background-87242466.jpg":YoutubeThumbnail(youtubeId: YoutubePlayer.convertUrlToId(c.url)).standard()
                                          ,errorBuilder: (context, error, stackTrace) {
                                  return Image.asset("images/X_CODE.jpg");//do something
                                  },),

                                      onTap: (){
                                        if(c.url.compareTo("")==0)
                                          {
                                            return null;
                                          }
                                        else
                                          {
                                            navigateToParent_player(context, c.url, c.duration);
                                          }
                                      }),
                                ]
                            ),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              )),
        ),
      );
  }
}
