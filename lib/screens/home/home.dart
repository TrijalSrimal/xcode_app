// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/screens/home/image_finder_returner.dart';
import '../Components/NavBar.dart';
import '../Components/database.dart';
import '../Profile/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data = '';
  String author = '';

  Future<void> getQuote() async {
    var url = Uri.parse('https://api.quotable.io/random?tags=education|dreams|success|motivation');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    setState(() {
      data = jsonData['content'];
      author = jsonData['author'];
    });
  }
  @override
  void initState() {
    super.initState();
    getQuote();
  }
  @override
  Widget build(BuildContext context) {
     return StreamProvider<DocumentSnapshot?>.value(
      value: DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid).brews,
      initialData: null,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 40,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.person),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile()));
                },
              )
            ],
          ),
          drawer: const NavBar(),
          body: Column(
            children: [
              Flexible(
                flex:1,
                child: Column(children: [
                  Center(
                    child: CircleAvatar(
                      radius:50,
                      child: ClipOval(
                        child: Image.asset(
                          'images/X_CODE.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height:8),
                  Center(child: Text("Hi ${FirebaseAuth.instance.currentUser!.displayName},", style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Sarabun",
                    fontSize: 20,
                  )),),
                  const SizedBox(height:6),
                  const Center(child: Text("It's a great day to learn!", style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Sarabun",
                    fontSize: 16,
                  )),),
                  const SizedBox(height:30),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Container(
                      decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                      ),

                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Padding(
                                padding:EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.06, MediaQuery.of(context).size.width * 0.06,MediaQuery.of(context).size.width * 0.1,0),
                                child: Center(
                                  child: Text(data, textAlign: TextAlign.center,style: const TextStyle(
                                    fontFamily: "Sarabun",
                                    fontSize: 24,
                                  )),
                                ),
                              ),
                              Center(
                                child: Text("- $author", textAlign: TextAlign.center,style: const TextStyle(
                                  fontFamily: "Sarabun",
                                  fontSize: 24,
                                )),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                  children: <Widget>[
                                    const Expanded(
                                        child: Divider(thickness: 2,color: Colors.black)
                                    ),
                                    Text("  Continue Watching  ", style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontFamily: "Sarabun",
                                      fontSize: 24,
                                    )),
                                    const Expanded(
                                        child: Divider(thickness: 2,color: Colors.black)
                                    ),
                                  ]
                              ),
                              const SizedBox(height:20),
                              const Image_Find_Return(),
                            ]
                        ),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          )),
    );
  }
}