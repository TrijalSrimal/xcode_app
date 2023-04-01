import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
        title: const Text("Sign Up", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Form(
          key: formKey,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: const TextStyle(color:Colors.black),
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
                    validator: (name) =>
                        // ignore: prefer_is_empty
                        name!.length == 0 ? 'Enter a valid name' : null,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: const TextStyle(color:Colors.black),
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
                      hintStyle: const TextStyle(color: Colors.black),
labelStyle: const TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.disabled,
                    validator: (clas) =>
                    ( clas ==null || int.parse(clas)< 6 || int.parse(clas)>12) ? 'Enter a valid class' : null,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: const TextStyle(color:Colors.black),
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
                      hintStyle: const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (name) =>
                        name == null ? 'Enter a valid RegNo.' : null,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: const TextStyle(color:Colors.black),
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
                      hintStyle: const TextStyle(color: Colors.black),
labelStyle: const TextStyle(color: Colors.black),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    style: const TextStyle(color:Colors.black),
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
                      hintStyle: const TextStyle(color: Colors.black),
labelStyle: const TextStyle(color: Colors.black),
                    ),
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter minimum 6 characters'
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
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
                MyButton(onTap: signUp, text: "Sign Up"),
                const SizedBox(height: 20),
                RichText(
                    text: TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn,
                  style: const TextStyle(
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
      builder: (context) => const Center(
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
