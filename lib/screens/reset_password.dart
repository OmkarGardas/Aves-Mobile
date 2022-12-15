import 'package:firebase_auth/firebase_auth.dart';
import 'package:aves/reusable_widgets/reusable_widget.dart';
import 'package:aves/screens/home_screen.dart';
import 'package:aves/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text(
          "Reset Password",
          // style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          style: GoogleFonts.alegreya(fontSize: 24, fontWeight: FontWeight.bold,),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                hexStringToColor("#d9534f"),
                hexStringToColor("#f9f9f9"),
                hexStringToColor("#5bc0de"),
                // hexStringToColor("#fce9db")
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Aves",
                      style: GoogleFonts.lobsterTwo(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    reusableTextField("Enter Email Id", Icons.person_outline, false,
                        _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    firebaseUIButton(context, "Reset Password", () {
                      FirebaseAuth.instance
                          .sendPasswordResetEmail(email: _emailTextController.text)
                          .then((value) => Navigator.of(context).pop());
                    })
                  ],
                ),
              ))),
    );
  }
}