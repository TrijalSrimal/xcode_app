import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Components/NavBar.dart';
import '../Components/database.dart';
import '../Components/editwidgeticon.dart';
import 'edit_profile.dart';
import 'pro.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future <void> navigateToEdit(context, int points, int streak) async {
    Navigator.push(
        context,
        PageTransition(
          child: EditWidget(points: points, streak: streak),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
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
            title: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 24,fontFamily: "Sarabun")),
            centerTitle: true,
            actions: <Widget>[
              EditWidget2(),
            ],
          ),
          drawer: NavBar(),
          body: Container(
            child: Column(
              children: [
                userprolist(),
              ],
            ),
          )),
    );
  }
}
