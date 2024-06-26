
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/database.dart';
import 'package:untitled/screens/Profile/pro.dart';
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
            backgroundColor: Colors.black,
            title: Text("X-CODE", style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          drawer: NavBar(),
          body: Container(
            )),
    );
  }
}
