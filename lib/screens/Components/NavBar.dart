// ignore: duplicate_ignore
// ignore: file_names

// ignore_for_file: file_names
//nav bar drawer
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/LeaderBoard/leaderboard.dart';
import 'package:untitled/screens/Profile/profile.dart';
import '../Courses/CourseRootTree.dart';
import '../Courses/faqscreen.dart';
import '../Resources/resources.dart';
import '../about_us.dart';
import '../home/home.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  Future<void> navigateToHome(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Home(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
  Future<void> navigateToResources(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Resources(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
  Future<void> navigateToFAQ(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const Doubts(questions:[
            {
              'question': 'Purpose of the app ',
              'answer':
              """ The app will assist us in tracking your participation in club activities, while allowing you to document your coding journey in a structured and organized manner."""
            },
            {
              'question': "What's there in the app ? ",
              'answer':
              """Students are provided with different courses on coding, designing, and photo and video editing. The courses and content will be different based on the student's skill and agr levels and will help the student upskill himself. """
            },
          ]),
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
          child: const CourseRoot(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
  Future<void> navigateToLead(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const LeaderBoard(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }
  Future<void> navigateToAboutUs(context) async {
    Navigator.push(
        context,
        PageTransition(
          child: const AboutUs(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
        ));
  }


  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    //this checks the internet connection everywhere in app and as soon as internet goes off,
    //as this widget is the common link to evry page in the app, pops to the main route, where no internet connection is handled by main.dart
    StreamSubscription streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi) {
        //rate 5 stars, do nothing
      }
      else if (event == ConnectivityResult.mobile) {
        //rate 5 stars, do nothing
      }
      else if (event == ConnectivityResult.ethernet) {
        //rate 5 stars, do nothing
      }
      else if (event == ConnectivityResult.vpn) {
        //rate 5 stars, do nothing
      }
      else
        {
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }

    });
    final user = FirebaseAuth.instance.currentUser;
    String? name = FirebaseAuth.instance.currentUser?.displayName == null
        ? "N/A"
        : FirebaseAuth.instance.currentUser!.displayName.toString();
    String email = user!.email != null ? user.email.toString() : "N/A";
    return Drawer(
      backgroundColor:Theme.of(context).colorScheme.primaryContainer,
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
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          ListTile(
            
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => navigateToProfile(context),
          ),
          ListTile(
            
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => navigateToHome(context),
          ),
          ListTile(
            
            leading: const Icon(Icons.leaderboard),
            title: const Text('Leaderboard'),
            onTap: (){ navigateToLead(context);},
          ),
          ListTile(
            
            leading: const Icon(Icons.book_online),
            title: const Text('Courses'),
            onTap: () => navigateToCourseRoot(context),
          ),
          ListTile(
            
            leading: const Icon(Icons.question_mark),
            title: const Text('FAQ'),
            onTap: () => navigateToFAQ(context)
          ),
          ListTile(
            
            leading: const Icon(Icons.abc),
            title: const Text('About Us'),
            onTap: () => navigateToAboutUs(context),
          ),
          ListTile(
            
            leading: const Icon(Icons.share),
            title: const Text('Resources'),
            onTap: () => navigateToResources(context),
          ),
          ListTile(
            
            title: const Text('Log Out'),
            leading: const Icon(Icons.exit_to_app),
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
