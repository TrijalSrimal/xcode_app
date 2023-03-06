import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/Components/myButton.dart';
import 'package:untitled/screens/Login/Forgot_Password_Page.dart';

import '../Components/utils.dart';
//tasked with login and sign up routing
class LoginWidget extends StatefulWidget {
  //Helps switch between login and signup
  final VoidCallback onClickedSignUp;

  const LoginWidget({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //stores the form data
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  //form key is used to check if form has been filled properly or not
  final formKey = GlobalKey<FormState>();

  @override
  //dispose to prevent memory leaks and data leaks
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  //Log in screen
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("""Its great to have
        you here""",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 30,
                      fontFamily: "Sarabun")),
              SizedBox(height: 50),
              Image.asset("images/Login.png"),
              const SizedBox(height: 50),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  style: TextStyle(color:Colors.black),
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
              SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  style: TextStyle(color:Colors.black),
                  controller: passwordController,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Forgot  Password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                      fontFamily: "Sarabun",
                    ),
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ForgotPasswordPage(),
                )),
              ),
              SizedBox(height: 20),
              MyButton(onTap: signIn, text: "Sign In"),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground, fontSize: 20, fontFamily: "Sarabun"),
                text: 'No account? Sign Up!',
              )),
            ]),
          ),
        )),
      ),
    );
  }
//function for signing in on clicking sign in
  Future<void> signIn() async {
    //showing progress indicartor
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
    //trying to authenticate
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {//exception handling
      print(e);
      Utils.showSnackBar(e.message);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }
    //going to parent route
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
