// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';


class Doubts extends StatefulWidget {
  final List questions;
  const Doubts({Key? key, required this.questions}) : super(key: key);

  @override
  State<Doubts> createState() => _DoubtsState(questions: questions);
}

class _DoubtsState extends State<Doubts> {
  List questions;
  _DoubtsState({required this.questions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
        title: const Text("Frequently Asked Questions"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          final question = questions[index]['question'];
          final answer = questions[index]['answer'];
          return ExpansionTile(
            title: Text(question!, style: const TextStyle(color: Colors.white)),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(answer!,style: const TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      ),
    );
  }
}