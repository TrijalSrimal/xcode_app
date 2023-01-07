import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/course_player.dart';
import '../Components/database.dart';

class Parent_player extends StatefulWidget {
  String url;

  Parent_player({required this.url});

  @override
  State<Parent_player> createState() => _Parent_playerState(url: url);
}

class _Parent_playerState extends State<Parent_player> {
  String url;

  _Parent_playerState({required this.url});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      child: Yt(inputurl: url),
    );
  }
}
