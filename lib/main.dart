import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/screens/Components/Mythemes.dart';
import 'package:untitled/screens/Login/auth_page.dart';
import 'package:untitled/screens/Login/verifyemail.dart';
import 'package:untitled/screens/Components/utils.dart';
import 'firebase_options.dart';
//Defining navigator key to ease the popping and pushing of routes in login, signup, etc
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  //Initializing Firebase App
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //After initialization, building material app
  runApp(MaterialApp(
    themeMode: ThemeMode.system,
    theme: Mythemes.lightTheme,
    darkTheme: Mythemes.darkTheme,
    scaffoldMessengerKey: Utils.messengerKey,
    navigatorKey: navigatorKey,
    home: MainPage(),
  ));
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
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Something Went Wrong!!"),
              );
            } else if (snapshot.hasData) {
              return VerifyEmailPage();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
