import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/course_player.dart';
import '../Components/database.dart';

class Parent_player extends StatefulWidget {
  String url;
  int startAt = 0;
  Parent_player({required this.url, required this.startAt});

  @override
  State<Parent_player> createState() => _Parent_playerState(url: url, startAt: startAt);
}

class _Parent_playerState extends State<Parent_player> {
  String url;
  int startAt = 0;
  _Parent_playerState({required this.url, required this.startAt});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      child: Yt(inputurl: url, startAt: startAt),
    );
  }
}
