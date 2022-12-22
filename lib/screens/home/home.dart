import 'package:flutter/material.dart';

import 'NavBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("X-CODE", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        drawer: NavBar(),
        body: Container(
          color: Colors.white,
        ));
  }
}
