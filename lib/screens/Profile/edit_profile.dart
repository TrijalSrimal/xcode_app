// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/utils.dart';
import '../Components/myButton.dart';
import '../Components/constants.dart';

class EditWidget extends StatefulWidget {
  int points;
  int streak;
  bool increase;

  EditWidget({Key? key, required this.points, required this.streak, required this.increase})
      : super(key: key);

  @override
  State<EditWidget> createState() =>
      // ignore: no_logic_in_create_state
      _EditWidgetState(streak: streak, points: points, increase: increase);
}

class _EditWidgetState extends State<EditWidget> {
  int points;
  int streak;
  bool increase;
  _EditWidgetState({required this.points, required this.streak, required this.increase});

  final regnumController = TextEditingController();
  final classController = TextEditingController();
  final nameController = TextEditingController(
  );
  final formKey = GlobalKey<FormState>();
  int dropdownValue = WebDev.length;
  String coursename = "Web Development";
  @override
  void dispose() {
    regnumController.dispose();
    nameController.dispose();
    classController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    classController.value = const TextEditingValue(text: "");
    nameController.value = TextEditingValue(text: FirebaseAuth.instance.currentUser!.displayName.toString());
    Future<void> Edit() async {
      final isValid = formKey.currentState!.validate();
      final changeCourse = coursename.compareTo(mainCourse) == 0
          ? false
          : true;
      if (!isValid) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
        const Center(
          child: CircularProgressIndicator(),
        ),
      );
      if (changeCourse) {
        if(increase)
          {
            try
                {
                  await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                      .updateUserStreak(++ streak);
                }
            on FirebaseAuthException catch (e) {
              Utils.showSnackBar(e.message);
              navigatorKey.currentState!.popUntil((route) => route.isFirst);
            }
          }
        try {
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .updateUserData(
              classController.text.trim(),
              nameController.text.trim(),
              FirebaseAuth.instance.currentUser!.email.toString(),
              0,
              streak, coursename, dropdownValue);
        } on FirebaseAuthException catch (e) {
          Utils.showSnackBar(e.message);
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
        try {
          FirebaseAuth.instance.currentUser!
              .updateDisplayName(nameController.text.trim());
        } on FirebaseAuthException catch (e) {
          Utils.showSnackBar(e.message);
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
        navigatorKey.currentState!.popUntil((route) => route.isFirst);
      }
      else
        {
          try {
            await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                .updateUserData2(
                classController.text.trim(),
                nameController.text.trim(),
                FirebaseAuth.instance.currentUser!.email.toString(),
                points,
                streak);
          } on FirebaseAuthException catch (e) {
            Utils.showSnackBar(e.message);
            navigatorKey.currentState!.popUntil((route) => route.isFirst);
          }
          try {
            FirebaseAuth.instance.currentUser!
                .updateDisplayName(nameController.text.trim());
          } on FirebaseAuthException catch (e) {
            Utils.showSnackBar(e.message);
            navigatorKey.currentState!.popUntil((route) => route.isFirst);
          }
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: nameController,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),

                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // ignore: prefer_is_empty
                  validator: (name) => name!.length == 0? 'Enter a valid name' : null,
                ),
              ),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: classController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Class',
                    labelText: 'Class',
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintStyle: const TextStyle(color: Colors.black),
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (clas) =>
                  (clas == "" || int.parse(clas!) > 12 || int.parse(clas) < 6) ? 'Enter a valid class' :null,
                ),
              ),
              const SizedBox(height:20),
              Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownValue,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Sarabun",
                      fontSize: 16,
                    ),
                    items: [

                      DropdownMenuItem(value: WebDev.length,
                        onTap: (){
                          setState(() {
                            coursename = "Web Development";
                          });
                        },child: const Text("WebDev", style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: Python.length,
                        onTap: (){
                          setState(() {
                            coursename = "Python";
                          });
                        },child: const Text("Python", style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: javacourses.length,
                        onTap: (){
                          setState(() {
                            coursename = "Java DSA";
                          });
                        },child: const Text("JAVA",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: Flutter.length,
                        onTap: (){
                          setState(() {
                            coursename = "Flutter App Development";
                          });
                        },child: const Text("Flutter",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: Premiere.length,onTap: (){
                        setState(() {
                          coursename = "Video Editing With Premiere";
                        });
                      },child: const Text("Video Editing",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: Photoshop.length,
                        onTap: (){
                          setState(() {
                            coursename = "Photoshop";
                          });
                        },child: const Text("Editing With Photoshop",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),
                      DropdownMenuItem(value: Illustrator.length,
                        onTap: (){
                          setState(() {
                            coursename = "Illustrator";
                          });
                        },child: const Text("Design With Illustrator",style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Sarabun",
                        fontSize: 16,
                      ),),),

                    ], onChanged: (int? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },


                  ),
                ),
              ),
              const SizedBox(height: 20),
              MyButton(onTap: Edit, text: "Edit Details"),
            ]),
          ),
        )),
      ),
    );
  }
}
