import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Doubts extends StatefulWidget {
  String questions;
  Doubts({Key? key, required this.questions}) : super(key: key);

  @override
  State<Doubts> createState() => _DoubtsState(questions: questions);
}

class _DoubtsState extends State<Doubts> {
  String questions;
  _DoubtsState({required this.questions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: Text("Frequently asked questions"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height:20),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 20),
                child: Text(questions,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),),
              ),
            ),
            ElevatedButton(onPressed: (){
            },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(3, 12, 34, 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      0.05 * MediaQuery.of(context).size.width),
                ),
                fixedSize: Size(
                  0.5625 * MediaQuery.of(context).size.width,
                  .0825 * MediaQuery.of(context).size.height,
                ),
              ),
                child: Text("ASK YOUR DOUBT",
                  style: TextStyle(
                    color: Colors.white,
                  fontSize:
                  0.03625 * MediaQuery.of(context).size.width,
                  letterSpacing:
                  0.00125 * MediaQuery.of(context).size.width,
                ),),
            ),
            const SizedBox(height:10),
          ],
        ),
      ),
    );
  }
}
