// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/screens/Components/Mythemes.dart';
import 'package:untitled/screens/Login/auth_page.dart';
import 'package:untitled/screens/Login/verifyemail.dart';
import 'package:untitled/screens/Components/utils.dart';
import 'package:untitled/screens/home/error_home.dart';
import 'firebase_options.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//Defining navigator key to ease the popping and pushing of routes in login, signup, etc
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  //Initializing Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //After initialization, building material app
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Connectivity _connectivity = Connectivity();
  // ignore: unused_field
  late StreamSubscription _streamSubscription;

  @override
  void initState() {

    checkRealtimeConnection();
    super.initState();
  }
  late Widget to_be = const ErrorHome();
  void checkRealtimeConnection() {
    _streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile) {
        setState(() {to_be = const MainPage();});
      } else if (event == ConnectivityResult.wifi) {
        setState(() {to_be = const MainPage();});
      } else {
        setState(() {to_be = const ErrorHome();});
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: Mythemes.lightTheme,
      darkTheme: Mythemes.darkTheme,
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      home: to_be,
    );
  }
}


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  //Listening for auth changes from Firebase Auth via streams
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#4169E1"),
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Something Went Wrong!!"),
                );
              } else if (snapshot.hasData) {
                return const VerifyEmailPage();
              } else {
                return const AuthPage();
              }
            }),
      );
   }
}