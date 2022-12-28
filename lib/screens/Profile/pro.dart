import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/Profile/edit_profile.dart';

class userprolist extends StatelessWidget {
  const userprolist({Key? key}) : super(key: key);

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
    print(user?.data());
    Map<String, dynamic> data = user?.data() as Map<String, dynamic>;
    return Column(children: [
      ListTile(
        leading: Icon(Icons.person),
        title: Text("Name: " + data['Name']),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.mail),
        title: Text("Email: " + data['Email']),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.class_),
        title: Text("Class: " + data['Class']),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.app_registration),
        title: Text("Registration no: " + data['Registration No.']),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.ac_unit_sharp),
        title: Text("Points: " + data['Points'].toString()),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.stream),
        title: Text("Streak: " + data['Coding Streak'].toString()),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.edit),
        title: Text("Edit"),
        onTap: () =>
            navigateToEdit(context, data['Points'], data['Coding Streak']),
      ),
    ]);
  }
}
