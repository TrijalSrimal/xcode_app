// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/NavBar.dart';

class LeaderBoard extends StatefulWidget {
  const LeaderBoard({Key? key}) : super(key: key);

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {
  @override
  Widget build(BuildContext context) {
     String uid = FirebaseAuth.instance.currentUser!.uid;
    return StreamProvider.value(value: DatabaseService(uid:uid).Leaders,
        initialData: null,
        child: const LeaderChild(),
    );
  }
}
class LeaderChild extends StatefulWidget {
  const LeaderChild({Key? key}) : super(key: key);

  @override
  State<LeaderChild> createState() => _LeaderChildState();
}

class _LeaderChildState extends State<LeaderChild> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<QuerySnapshot?>(context);
    Map<int, DocumentSnapshot> data= {};
    if (user != null) {
      data = user.docs.asMap();
    }
    else
    {
      return const CircularProgressIndicator();
    }
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const Text("Leaderboard"),
        elevation: 0,
      ),
      drawer: const NavBar(),
      body: Column(children: [
          const SizedBox(height: 30),
      Row(children: <Widget>[
        const Expanded(child: Divider(thickness: 2, color: Colors.black)),
        Text("  Leaderboard  ",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: "Sarabun",
              fontSize: 24,
            )),
        const Expanded(child: Divider(thickness: 2, color: Colors.black)),
      ]),
      const SizedBox(height: 30),
        Text("${"1. " + data[0]?.get('Name')} - ${data[0]?.get('Points')}", style: const TextStyle(fontSize: 24, fontFamily: "Sarabun"),),
        const SizedBox(height: 20),
        Text("${"2. " + data[1]?.get('Name')} -  ${data[1]?.get('Points')}", style: const TextStyle(fontSize: 24, fontFamily: "Sarabun"),),
        const SizedBox(height: 20),
        Text("${"3. " + data[2]?.get('Name')} - ${data[2]?.get('Points')}", style: const TextStyle(fontSize: 24, fontFamily: "Sarabun"),),
      ])
    );
  }
}

