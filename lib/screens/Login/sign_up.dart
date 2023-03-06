import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/main.dart';
import 'package:flutter/services.dart';
import 'package:untitled/screens/Components/database.dart';
import '../Components/utils.dart';
import '../Components/myButton.dart';
import '../Components/constants.dart' ;
//widget that deals with sign up
class SignUpWidget extends StatefulWidget {
  //function to help route auth
  final Function() onClickedSignIn;

  const SignUpWidget({Key? key, required this.onClickedSignIn})
      : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  //controllers to store form data
  final emailController = TextEditingController();
  final regnumController = TextEditingController();
  final classController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  //dispose is used to prevent memory leaks and data stealing
  void dispose() {
    regnumController.dispose();
    classController.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  int dropdownValue = WebDev.length;
  String coursename = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text("Sign Up", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
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
                      hintStyle: TextStyle(color: Colors.black),
labelStyle: TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) =>
                        name == null ? 'Enter a valid name' : null,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: classController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    cursorColor: Colors.black,
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
                      hintStyle: TextStyle(color: Colors.black),
labelStyle: TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) =>
                        name == null ? 'Enter a valid class' : null,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: regnumController,
                    cursorColor: Colors.black,
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
                      hintStyle: TextStyle(color: Colors.black),
labelStyle: TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) =>
                        name == null ? 'Enter a valid RegNo.' : null,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
labelStyle: TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: passwordController,
                    cursorColor: Colors.black,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
labelStyle: TextStyle(color: Colors.black),
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter minimum 6 characters'
                        : null,
                  ),
                ),
                SizedBox(height: 20),
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

                        DropdownMenuItem(child: Text("WebDev", style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),), value: WebDev.length,
                        onTap: (){
                          setState(() {
                            coursename = "Web Development";
                          });
                        },),
                        DropdownMenuItem(child: Text("JAVA",style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),), value: javacourses.length,
                          onTap: (){
                            setState(() {
                              coursename = "Java DSA";
                            });
                          },),
                        DropdownMenuItem(child: Text("Flutter",style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),), value: Flutter.length,
                          onTap: (){
                            setState(() {
                              coursename = "Flutter App Development";
                            });
                          },),
                        DropdownMenuItem(child: Text("Video",style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),), value: 0,onTap: (){
                          setState(() {
                            coursename = "Video";
                          });
                        },),
                        DropdownMenuItem(child: Text("Graphic",style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Sarabun",
                          fontSize: 16,
                        ),), value: 0,
                          onTap: (){
                            setState(() {
                              coursename = "Graphic";
                            });
                          },),

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
                SizedBox(height: 20),
                MyButton(onTap: signUp, text: "Sign Up"),
                SizedBox(height: 20),
                RichText(
                    text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: "Sarabun"),
                  text: 'Already Have An Account? Log In!',
                )),
              ]),
        ),
      )),
    );
    }
//main signup function, that handles the signup
  Future<void> signUp() async {
    //checks for form validity
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
      //trying to create user and login
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      //setting initial user data using the databse service.dart file to cloud firestore
      await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
          .setInitialUserData(
              classController.text.trim(),
              nameController.text.trim(),
              regnumController.text.trim(),
              emailController.text.trim(),
              0,
              0,
       coursename,
      dropdownValue);
    } on FirebaseAuthException catch (e) {
      //exception handling
      print(e);
      Utils.showSnackBar(e.message);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    //updating the display name
    FirebaseAuth.instance.currentUser!
        .updateDisplayName(nameController.text.trim());
    //popping to first route so that auth state change takes place
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
