import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../Components/NavBar.dart';
import '../Components/database.dart';
import 'pro.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot?>.value(
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: Scaffold(
          backgroundColor: HexColor("#4169E1"),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text("X-CODE", style: TextStyle(color: Colors.white)),
            centerTitle: true,
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
