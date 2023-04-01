//this class is an in between class, because i could not completely understand
//why a provider can only be heard in a child and not parent widget
//ill have to get a masterclass here
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
  Future<void> navigateToEdit(context, int points, int streak, bool increase) async {
    Navigator.push(
        context,
        PageTransition(
          child: EditWidget(points: points, streak: streak, increase: increase,),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    bool increase = false;
    //takes in data from stream provider
    final user = Provider.of<DocumentSnapshot?>(context);
    Map<String, dynamic> data = {};
    if (user != null)
      {
        data = user.data() as Map<String, dynamic>;
      }
    else
    {
      return const CircularProgressIndicator();
    }
    //checks if 80 percent of course is completed, and if so, language known icreases by one
    if(data['Points'] >= 0.80*data['ARRAY'].length)
      {
        increase = true;
      }
    return StreamProvider<DocumentSnapshot?>.value(
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: IconButton(
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () =>
            navigateToEdit(context, data['Points'], data['Coding Streak'], increase),
      ),
    );
  }
}
