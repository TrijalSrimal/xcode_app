import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/Components/course_player.dart';
import 'package:untitled/screens/Components/database.dart';
import 'package:untitled/screens/Courses/Course_home.dart';
import 'package:untitled/screens/Profile/profile.dart';
import '../Courses/CourseRootTree.dart';
import 'constants.dart' as c;
import '../home/home.dart';

class NavBar extends StatelessWidget {
  Future<void> navigateToHome(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Home(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  Future<void> navigateToProfile(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Profile(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  Future<void> navigateToCourseRoot(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: CourseRoot(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String? name = FirebaseAuth.instance.currentUser?.displayName == null
        ? "N/A"
        : FirebaseAuth.instance.currentUser!.displayName.toString();
    String email = user!.email != null ? user.email.toString() : "N/A";
    String uid = user!.uid != null ? user.uid.toString() : "N/A";
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/X_CODE.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: HexColor("#4169E1"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () => navigateToProfile(context),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => navigateToHome(context),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: (){ ;},
          ),
          ListTile(
            leading: Icon(Icons.book_online),
            title: Text('Courses'),
            onTap: () => navigateToCourseRoot(context),
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text('About Us'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Links'),
            onTap: () => null,
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
