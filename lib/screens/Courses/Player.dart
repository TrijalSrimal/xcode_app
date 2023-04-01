// ignore_for_file: camel_case_types, file_names, no_logic_in_create_state

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/course_player.dart';
import '../Components/database.dart';

class Parent_player extends StatefulWidget {
  final String url;
  final int startAt;
  final int viewedDuration;
  const Parent_player({super.key, required this.url, required this.startAt, required this.viewedDuration});

  @override
  State<Parent_player> createState() => _Parent_playerState(url: url, startAt: startAt, viewedDuration: viewedDuration);
}

class _Parent_playerState extends State<Parent_player> {
  final String url;
  final int startAt;
  final int viewedDuration;
  _Parent_playerState({required this.url, required this.startAt, required this.viewedDuration});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<DocumentSnapshot?>.value(
      initialData: null,
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      child: Yt(inputurl: url, startAt: startAt, viewedDuration: viewedDuration,),
    );
  }
}
