import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/NavBar.dart';
import '../Components/database.dart';
import '../Components/editwidgeticon.dart';
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
          appBar: AppBar(
            elevation: 10,
            title: const Text("Profile", style: TextStyle(color: Colors.white, fontSize: 24,fontFamily: "Sarabun")),
            centerTitle: true,
            actions: const <Widget>[
              EditWidget2(),
            ],
          ),
          drawer: const NavBar(),
          body: Column(
            children: const [
              userprolist(),
            ],
          )),
    );
  }
}
