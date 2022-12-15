import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aves/screens/sign_in.dart';


class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white54,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: Text(
            'menu',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),

            decoration: BoxDecoration(

              color: Colors.greenAccent,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/b.jpg')
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("Logout",style: TextStyle(
              color: Colors.black87,
            )),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("signed out");
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => SignInScreen()));
              });
            },
          ),
        ],
      ),
    );
  }
}
