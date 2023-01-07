import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Components/utils.dart';

import '../../main.dart';
import 'database.dart';

class EditPoints extends StatefulWidget {
  int points = 0;

  EditPoints({required this.points});

  @override
  State<EditPoints> createState() => _EditPointsState(points: points);
}

class _EditPointsState extends State<EditPoints> {
  int points = 0;

  _EditPointsState({required this.points});

  @override
  Widget build(BuildContext context) {
    Future<void> Edit(String name, String Class, String regnum, int points,
        int streak) async {
      try {
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .updateUserData(
                Class,
                name,
                regnum,
                FirebaseAuth.instance.currentUser!.email.toString(),
                points,
                streak);
      } on FirebaseAuthException catch (e) {
        print(e);
        Utils.showSnackBar(e.message);
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = user?.data() as Map<String, dynamic>;
    Edit(data['Name'], data['Class'], data['Registration No.'],
        data['Points'] + 1, data['Coding Streak']);
    return const SizedBox(height: 0, width: 0);
  }
}
