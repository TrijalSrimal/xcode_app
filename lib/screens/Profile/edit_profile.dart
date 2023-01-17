import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/main.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/utils.dart';
import '../Components/myButton.dart';

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
      if (!isValid) return;
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      );
      try {
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .updateUserData(
                classController.text.trim(),
                nameController.text.trim(),
                regnumController.text.trim(),
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#4169E1"),
        body: SingleChildScrollView(
            child: Center(
          child: Form(
            key: formKey,
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 40),
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
              SizedBox(height:20),
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
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: regnumController,
                  cursorColor: Colors.white,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Registration No.',
                    labelText: 'Registration No.',
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
                  validator: (reg) =>
                      reg == null ? 'Enter a valid RegNo.' : null,
                ),
              ),
              SizedBox(height: 20),
              MyButton(onTap: Edit, text: "Edit Details"),
            ]),
          ),
        )),
      ),
    );
  }
}
