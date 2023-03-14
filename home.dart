import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:x_code_app/screens/Components/database.dart';
import 'package:youtube/youtube_thumbnail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../Components/NavBar.dart';
import '../Courses/Player.dart';
import '../Components/constants.dart' as c;
import '../Profile/profile.dart';

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 40,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            )
          ],
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
                        decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                        ),

                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[

                                const SizedBox(height: 30),
                                Center(
                                  child: Text("""
    Sometimes it is the people
who no one imagines anything of 
  who do the things that no one 
  can imagine.
  
  - Alan Turing
                                  """, textAlign: TextAlign.center,style: TextStyle(
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                                const SizedBox(height: 10),
                            Row(
                                children: <Widget>[
                                  const Expanded(
                                      child: Divider(thickness: 2,color: Colors.black)
                                  ),
                                  Text("  Continue Watching  ", style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
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
                                    title: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(YoutubeThumbnail(youtubeId: YoutubePlayer.convertUrlToId(c.url)).standard()
                                        ,errorBuilder: (context, error, stackTrace) {
                                              return Image.network("https://images.unsplash.com/photo-1471879832106-c7ab9e0cee23?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1073&q=80");
                                        },),
                                    ),

                                    onTap: (){
                                      if(c.url.compareTo("")!=0)
                                        {
                                          navigateToParent_player(context, c.url, c.duration);
                                      }
                                    }),
                              ]
                          ),
                        ),
                      ),
                    ),
                ]),
              )
            ],
          ),
        ));
  }
}
