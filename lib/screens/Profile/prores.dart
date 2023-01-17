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
      Center(
        child: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              'images/X_CODE.jpg',
              fit: BoxFit.cover,
              width: 90,
              height: 90,
            ),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.person,color: Colors.white,),
        title: Text(data['Name'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.mail,color: Colors.white,),
        title: Text("Email: " + data['Email'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.class_,color: Colors.white,),
        title: Text("Class: " + data['Class'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),

      ListTile(
        leading: Icon(Icons.app_registration,color: Colors.white,),
        title: Text("Registration no: " + data['Registration No.'],style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.ac_unit_sharp,color: Colors.white,),
        title: Text("Points: " + data['Points'].toString(),style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.stream,color: Colors.white,),
        title: Text("Streak: " + data['Coding Streak'].toString(),style: TextStyle(color: Colors.white, fontFamily: "Sarabun", fontSize: 20)),
        onTap: () => null,
      ),

    ]);
  }
}
