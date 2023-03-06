import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/main.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/utils.dart';
import '../Components/myButton.dart';
import '../Components/constants.dart';

class EditWidget extends StatefulWidget {
  int points;
  int streak;

  EditWidget({Key? key, required this.points, required this.streak})
      : super(key: key);

  @override
  State<EditWidget> createState() =>
      _EditWidgetState(streak: streak, points: points);
}

class _EditWidgetState extends State<EditWidget> {
  int points;
  int streak;

  _EditWidgetState({required this.points, required this.streak});

  final regnumController = TextEditingController();
  final classController = TextEditingController();
  final nameController = TextEditingController();
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
    Future<void> Edit() async {
      final isValid = formKey.currentState!.validate();
      final change_course = coursename.compareTo(mainCourse) == 0
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
      if (change_course) {
        try {
          await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
              .updateUserData(
              classController.text.trim(),
              nameController.text.trim(),
              FirebaseAuth.instance.currentUser!.email.toString(),
              0,
              streak, coursename, dropdownValue);
        } on FirebaseAuthException catch (e) {
          print(e);
          Utils.showSnackBar(e.message);
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(nameController.text.trim());
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
            print(e);
            Utils.showSnackBar(e.message);
            navigatorKey.currentState!.popUntil((route) => route.isFirst);
          }
          FirebaseAuth.instance.currentUser!
              .updateDisplayName(nameController.text.trim());
          navigatorKey.currentState!.popUntil((route) => route.isFirst);
        }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#4169E1"),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: nameController,
                  cursorColor: Colors.white,
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
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) => name == null ? 'Enter a valid name' : null,
                ),
              ),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
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
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (clas) =>
                      clas == null ? 'Enter a valid class' : null,
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
                  child: Expanded(

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
                        DropdownMenuItem(value: 0,onTap: (){
                          setState(() {
                            coursename = "Video";
                          });
                        },child: const Text("Video",style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),),),
                        DropdownMenuItem(value: 0,
                          onTap: (){
                            setState(() {
                              coursename = "Graphic";
                            });
                          },child: const Text("Graphic",style: TextStyle(
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
