import 'package:firebase_auth/firebase_auth.dart';
import 'package:aves/reusable_widgets/reusable_widget.dart';
import 'package:aves/screens/home_screen.dart';
import 'package:aves/screens/reset_password.dart';
import 'package:aves/screens/sign_up.dart';
import 'package:aves/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with RestorationMixin {
  RestorableBool signin=RestorableBool(false);
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return signin.value?HomeScreen():Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              // hexStringToColor("#2b5876"),
              // // hexStringToColor("9546C4"),
              // hexStringToColor("5E61F4"),
              // hexStringToColor("#4e4376")
              hexStringToColor("#0F2027"),
              hexStringToColor("#203A43"),
              hexStringToColor("#2C5364")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                // logoWidget("assets/img1.png"),
                Text("AVES",
                style: GoogleFonts.kaushanScript(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),
                forgetPassword(context),
                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                      .then((value) {
                    setState(() {
                      signin.value=true;
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                }),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            " Sign Up",
            // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            style: GoogleFonts.lobster(color: Colors.white, fontSize: 25,),
          ),
        ),
      ],
    );
  }


  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child:  Text(
          "Forgot Password?",
          // style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
          style: GoogleFonts.akayaTelivigala(color: Colors.white),
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
  @override
  // TODO: implement restorationId
  String? get restorationId => "home_id";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(signin, 'home_page');
  }
}