import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/NavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
    Widget build(BuildContext context) {
      return StreamProvider<DocumentSnapshot?>.value(
        value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
        initialData: null,
        child: Scaffold(
            backgroundColor: HexColor("#4169E1"),
            appBar: AppBar(
              backgroundColor: HexColor("#4169E1"),
              elevation: 0,
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
                      SizedBox(height:6),
                      Center(child: Text("Hi ${FirebaseAuth.instance.currentUser!.displayName},", style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sarabun",
                        fontSize: 20,
                      )),),
                      SizedBox(height:8),
                      Center(child: Text("It's a great day to learn!", style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      )),),
                      SizedBox(height:20),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                          ),

                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[

                                SizedBox(height: 10),
                                Center(
                                  child: Text("  The key to become best at anything ", style: TextStyle(
                                    color: HexColor("#4169E1"),
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                                Center(
                                  child: Text("is consistency. Therefore, ", style: TextStyle(
                                    color: HexColor("#4169E1"),
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                                SizedBox(height: 10),
                                Center(
                                  child: Text("while(!(succeed = try()));", style: TextStyle(
                                    color: HexColor("#4169E1"),
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                              ]
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            )),
      );
  }
}
