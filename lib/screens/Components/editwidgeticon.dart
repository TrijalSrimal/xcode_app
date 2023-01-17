import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../Profile/edit_profile.dart';
import 'database.dart';

class EditWidget2 extends StatefulWidget {
  const EditWidget2({Key? key}) : super(key: key);

  @override
  State<EditWidget2> createState() => _EditWidget2State();
}

class _EditWidget2State extends State<EditWidget2> {
  Future<void> navigateToEdit(context, int points, int streak) async {
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
    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = new Map();
    if (user != null) data = user?.data() as Map<String, dynamic>;
    return StreamProvider<DocumentSnapshot?>.value(
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () =>
            navigateToEdit(context, data['Points'], data['Coding Streak']),
      ),
    );
  }
}
