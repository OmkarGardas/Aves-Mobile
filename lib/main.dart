import 'package:firebase_core/firebase_core.dart';
import 'package:aves/screens/sign_in.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: FirebaseOptions(
    //     apiKey: "AIzaSyBGfPjGGJ0LJSgnRkLh5aFvi4h8xs-j8LI",
    //     authDomain: "aves-e1c3c.firebaseapp.com",
    //     projectId: "aves-e1c3c",
    //     storageBucket: "aves-e1c3c.appspot.com",
    //     messagingSenderId: "889981688011",
    //     appId: "1:889981688011:web:24bff8f7ec42824f28a34e",
    //     measurementId: "G-S8DSPQEN4L"
    // )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}